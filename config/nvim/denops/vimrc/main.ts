import { Denops } from "https://deno.land/x/denops_std@v5.0.1/mod.ts";

export function main(denops: Denops) {
  denops.dispatcher = {
    set_openai_key(key: unknown) {
      Deno.env.set('OPENAI_API_KEY', key as string);
    },
  };
}
