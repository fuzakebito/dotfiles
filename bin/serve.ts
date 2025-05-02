#! /usr/bin/env deno
import { join, basename, extname } from "https://deno.land/std@0.212.0/path/mod.ts";
import { parse } from "https://deno.land/std@0.212.0/flags/mod.ts";

// Parse command-line arguments
const args = parse(Deno.args, {
  default: { port: 8000 },
  alias: { p: "port", h: "help" }
});

// Show help if requested
if (args.help) {
  console.log(`
  Deno File Server

  Serves files and directories over HTTP.

  USAGE:
    deno run --allow-read --allow-net file_server.ts [OPTIONS] [PATH]

  OPTIONS:
    -p, --port <PORT>    Port to listen on (default: 8000)
    -h, --help           Show this help message and exit

  EXAMPLES:
    deno run --allow-read --allow-net file_server.ts
    deno run --allow-read --allow-net file_server.ts -p 3000
    deno run --allow-read --allow-net file_server.ts ./public
  `);
  Deno.exit(0);
}

const PORT = args.port;
const BASE_PATH = args._.length > 0 ? String(args._[0]) : ".";

/**
 * Get content type based on file extension
 */
function getContentType(ext: string): string {
  const mimeTypes: Record<string, string> = {
    ".html": "text/html",
    ".htm": "text/html",
    ".css": "text/css",
    ".js": "text/javascript",
    ".json": "application/json",
    ".png": "image/png",
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".gif": "image/gif",
    ".svg": "image/svg+xml",
    ".txt": "text/plain",
    ".md": "text/markdown",
    ".pdf": "application/pdf",
    ".zip": "application/zip",
    ".mp3": "audio/mpeg",
    ".mp4": "video/mp4",
    ".webm": "video/webm",
    ".woff": "font/woff",
    ".woff2": "font/woff2",
    ".ttf": "font/ttf",
    ".otf": "font/otf",
    ".xml": "application/xml",
    ".csv": "text/csv",
    ".doc": "application/msword",
    ".docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    ".xls": "application/vnd.ms-excel",
    ".xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    ".ico": "image/x-icon"
  };

  return mimeTypes[ext.toLowerCase()] || "application/octet-stream";
}

/**
 * Get an error message from an unknown error
 */
function getErrorMessage(error: unknown): string {
  if (error instanceof Error) {
    return error.message;
  }
  return String(error);
}

/**
 * Serves a single file with appropriate headers
 */
async function serveFile(req: Request, filePath: string): Promise<Response> {
  try {
    const fileInfo = await Deno.stat(filePath);
    
    if (!fileInfo.isFile) {
      return new Response("Not a file", { status: 400 });
    }
    
    const url = new URL(req.url);
    const forceDownload = url.searchParams.has("download");
    
    const file = await Deno.open(filePath, { read: true });
    const fileContent = file.readable;
    
    const headers = new Headers();
    const fileExtension = extname(filePath);
    const fileName = basename(filePath);
    
    // Set appropriate content type based on file extension
    const contentType = forceDownload ? "application/octet-stream" : getContentType(fileExtension);
    headers.set("Content-Type", contentType);
    
    // Properly encode filename for Content-Disposition header
    // UTF-8 filename encoding following RFC 5987
    const fileNameEncoded = encodeURIComponent(fileName).replace(/['()]/g, escape);
    
    if (forceDownload) {
      // For forced downloads, use attachment disposition
      headers.set("Content-Disposition", `attachment; filename="${fileNameEncoded}"; filename*=UTF-8''${fileNameEncoded}`);
    } else {
      // For normal viewing, still provide filename but with inline disposition
      headers.set("Content-Disposition", `inline; filename="${fileNameEncoded}"; filename*=UTF-8''${fileNameEncoded}`);
    }
    
    headers.set("Content-Length", fileInfo.size.toString());
    
    return new Response(fileContent, {
      status: 200,
      headers
    });
  } catch (error: unknown) {
    console.error("Error serving file:", error);
    return new Response(`Error: ${getErrorMessage(error)}`, { status: 500 });
  }
}

/**
 * Creates an HTML page listing the directory contents
 */
async function serveDirectory(req: Request, dirPath: string): Promise<Response> {
  try {
    const url = new URL(req.url);
    const basePath = url.pathname;
    
    const entries = [];
    for await (const entry of Deno.readDir(dirPath)) {
      entries.push(entry);
    }
    
    // Sort entries: directories first, then files
    entries.sort((a, b) => {
      if (a.isDirectory && !b.isDirectory) return -1;
      if (!a.isDirectory && b.isDirectory) return 1;
      return a.name.localeCompare(b.name);
    });
    
    let html = `
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Directory listing for ${dirPath}</title>
          <style>
            body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
            h1 { margin-bottom: 20px; }
            ul { list-style-type: none; padding: 0; }
            li { margin: 8px 0; }
            a { text-decoration: none; color: #0366d6; }
            a:hover { text-decoration: underline; }
            .directory { font-weight: bold; }
            .file-actions { margin-left: 10px; font-size: 0.8em; }
          </style>
        </head>
        <body>
          <h1>Directory listing for ${dirPath}</h1>
          <ul>
    `;
    
    // Add parent directory link if not at root
    if (basePath !== "/") {
      const parentPath = basePath.slice(0, basePath.lastIndexOf("/")) || "/";
      html += `
        <li>
          <a href="${parentPath}">..</a> (Parent Directory)
        </li>
      `;
    }
    
    // Add all directory entries
    for (const entry of entries) {
      const entryPath = join(basePath, entry.name);
      
      if (entry.isDirectory) {
        html += `
          <li>
            <a href="${entryPath}" class="directory">${entry.name}/</a>
          </li>
        `;
      } else {
        html += `
          <li>
            <a href="${entryPath}">${entry.name}</a>
            <span class="file-actions">
              <a href="${entryPath}?download">[Download]</a>
            </span>
          </li>
        `;
      }
    }
    
    html += `
          </ul>
        </body>
      </html>
    `;
    
    return new Response(html, {
      status: 200,
      headers: {
        "Content-Type": "text/html; charset=utf-8"
      }
    });
  } catch (error: unknown) {
    console.error("Error serving directory:", error);
    return new Response(`Error: ${getErrorMessage(error)}`, { status: 500 });
  }
}

/**
 * Determines if the path is a file or directory and serves appropriately
 */
async function handleRequest(req: Request): Promise<Response> {
  const url = new URL(req.url);
  let path = decodeURIComponent(url.pathname);
  
  // Default to current directory if path is root
  if (path === "/") {
    path = BASE_PATH;
  } else {
    // Resolve path relative to the base path
    path = join(BASE_PATH, path.slice(1));
  }
  
  try {
    const fileInfo = await Deno.stat(path);
    
    if (fileInfo.isDirectory) {
      return serveDirectory(req, path);
    } else {
      return serveFile(req, path);
    }
  } catch (error: unknown) {
    if (error instanceof Deno.errors.NotFound) {
      return new Response("404 Not Found", { status: 404 });
    }
    
    console.error("Error handling request:", error);
    return new Response(`Error: ${getErrorMessage(error)}`, { status: 500 });
  }
}

// Start the server using Deno.serve
console.log(`Server running at http://localhost:${PORT}`);
console.log(`Serving: ${BASE_PATH}`);
Deno.serve({ port: PORT }, handleRequest);
