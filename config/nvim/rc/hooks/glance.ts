// ~/.config/glance/init.ts
//import markdownItEmoji from 'https://esm.sh/markdown-it-emoji'
import markdownItMathjax3 from 'https://esm.sh/markdown-it-mathjax3?bundle'
import MarkdownIt from 'https://esm.sh/markdown-it'

export function createMarkdownRenderer(md: MarkdownIt): MarkdownIt {
  return md.use(markdownItMathjax3, { tex: {tags: 'ams'} });
}
