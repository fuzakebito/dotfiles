import {
  type ActionArguments,
  ActionFlags,
  type DduOptions,
} from "jsr:@shougo/ddu-vim@~9.0.0/types";
import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddu-vim@~9.0.0/config";
import { type ActionData } from "jsr:@shougo/ddu-kind-file@~0.9.0";
import { type Params as FfParams } from "jsr:@shougo/ddu-ui-ff@~1.5.0";
import { type Params as FilerParams } from "jsr:@shougo/ddu-ui-filer@~1.5.0";
import type { Denops } from "jsr:@denops/std@~7.4.0";
import * as fn from "jsr:@denops/std@~7.4.0/function";

type Params = Record<string, unknown>;

export class Config extends BaseConfig {
  override config(args: ConfigArguments): Promise<void> {
    args.setAlias("files", "source", "file_rg", "file_external");
    args.setAlias("files", "source", "file_git", "file_external");
    args.setAlias("files", "filter", "matcher_ignore_current_buffer", "matcher_ignores");
    args.setAlias("files", "action", "tabopen", "open");
    args.setAlias("files", "column", "icon_filename_for_ff", "icon_filename");

    args.contextBuilder.patchGlobal({
      ui: "ff",
      profile: false,
      uiOptions: {
        ff: {
          actions: {
            kensaku: async (args: {
              denops: Denops;
              options: DduOptions;
            }) => {
              await args.denops.dispatcher.updateOptions(
                args.options.name,
                {
                  sourceOptions: {
                    _: {
                      matchers: ["matcher_kensaku"],
                    },
                  },
                },
              );
              await args.denops.cmd("echomsg 'change to kensaku matcher'");

              return ActionFlags.Persist;
            },
          },
        },
        filer: {
          toggle: true,
        },
      },
      uiParams: {
        ff: {
          autoAction: {
            name: "preview",
          },
          filterSplitDirection: "floating",
          filterFloatingPosition: "bottom",
          split: "floating",
          prompt: "> ",
          floatingBorder: "rounded",
          highlights: {
            filterText: "Statement",
            floating: "Normal",
            floatingBorder: "FloatBorder",
          },
          maxHighlightItems: 50,
          onPreview: async (args: {
            denops: Denops;
            previewWinId: number;
          }) => {
            await fn.win_execute(args.denops, args.previewWinId, "normal! zt");
          },
          previewFloating: true,
          previewFloatingBorder: "rounded",
          //previewSplit: "no",
          //startFilter: true,
          updateTime: 0,
          winWidth: 100,
        } as Partial<FfParams>,
        filer: {
          displayRoot: false,
          sort: "filename",
          sortTreesFirst: true,
          toggle: true,
          split: "floating",
          floatingBorder: "rounded",
          floatingTitle: "File",
          floatingTitlePos: "center",
          winHeight: "&lines-3",
          winWidth: "35",
          winRow: "0",
          winCol: "0",
          previewFloating: true,
          previewFloatingBorder: "rounded",
          previewFloatingTitle: "Preview",
          previewFloatingTitlePos: "center",
          previewHeight: "&lines-3",
          previewWidth: "&columns-39",
          previewRow: "&lines-1",
          previewCol: "37",
        } as Partial<FilerParams>,
      },
      sourceOptions: {
        _: {
          ignoreCase: true,
          matchers: ["matcher_substring"],
          smartCase: true,
        },
        file_git: {
          matchers: [
            "matcher_relative",
            "matcher_substring",
          ],
          columns: ["icon_filename_for_ff"],
        },
        file_rec: {
          matchers: [
            "matcher_substring",
            "matcher_hidden",
          ],
          columns: ["icon_filename_for_ff"],
        },
        file: {
          columns: ["icon_filename"],
        },
        dein: {
          defaultAction: "cd",
        },
        markdown: {
          sorters: [],
        },
        line: {
          matchers: [
            "matcher_kensaku",
          ],
        },
        path_history: {
          defaultAction: "uiCd",
        },
        rg: {
          matchers: [
            "matcher_substring",
            "matcher_files",
          ],
          sorters: ["sorter_alpha"],
        },
      },
      sourceParams: {
        file_rec: {
          chunkSize: 100,
        },
        file_git: {
          cmd: ["git", "ls-files", "-co", "--exclude-standard"],
        },
        rg: {
          args: [
            "--ignore-case",
            "--column",
            "--no-heading",
            "--color",
            "never",
          ],
        },
        file_rg: {
          cmd: [
            "rg",
            "--files",
            "--glob",
            "!.git",
            "--color",
            "never",
            "--no-messages",
          ],
          updateItems: 50000,
        },
      },
      filterParams: {
        matcher_kensaku: {
          highlightMatched: "Search",
        },
        matcher_substring: {
          highlightMatched: "Search",
        },
        matcher_ignore_files: {
          ignoreGlobs: ["test_*.vim"],
          ignorePatterns: [],
        },
      },
      kindOptions: {
        file: {
          defaultAction: "open",
          actions: {
            grep: async (args: ActionArguments<Params>) => {
              const action = args.items[0]?.action as ActionData;

              await args.denops.call("ddu#start", {
                name: args.options.name,
                push: true,
                sources: [
                  {
                    name: "rg",
                    params: {
                      path: action.path,
                      input: await fn.input(args.denops, "Pattern: "),
                    },
                  },
                ],
              });

              return Promise.resolve(ActionFlags.None);
            },
          },
        },
        word: {
          defaultAction: "append",
        },
        help: {
          defaultAction: "open",
        },
        deol: {
          defaultAction: "switch",
        },
        action: {
          defaultAction: "do",
        },
        readme_viewer: {
          defaultAction: "open",
        },
      },
      kindParams: {},
      actionOptions: {
        narrow: {
          quit: false,
        },
        tabopen: {
          quit: false,
        },
      },
      columnParams: {
        icon_filename: {
          defaultIcon: {
            icon: "",
          },
        },
        icon_filename_for_ff: {
          defaultIcon: {
            icon: "",
          },
          padding: 0,
          pathDisplayOption: "relative",
        },
      },
    });

    args.contextBuilder.patchLocal("files", {
      uiParams: {
        ff: {
          split: "floating",
        },
      },
    });

    return Promise.resolve();
  }
}
