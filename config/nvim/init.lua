-- Enables the experimental Lua module loader
if vim.loader then
  vim.loader.enable()
end

-- dein base directory.
local dein_dir = vim.env.HOME .. "/.cache/dein"

-- dein.vim repository.
local dein_repo = dein_dir .. "/repos/github.com/Shougo/dein.vim"

-- my neovim config directory.
vim.env.BASE_DIR = vim.fn.fnamemodify(vim.env.MYVIMRC, ":h")
vim.env.HOOKS_DIR = vim.env.BASE_DIR .. "/rc/hooks"

-- vimrc files written by lua script.
local vimrcs_dir = vim.env.BASE_DIR .. "/rc/init/"
local inline_vimrcs = {
  "keymap.vim",
  "autocmd.vim",
  "commands.vim",
  "options.vim",
  "syntaxlazy.vim",
  "vime.vim",
}

-- toml management by dein.
local toml_dir = vim.env.BASE_DIR .. "/toml/"

local dein_tomls = {
  "dein.toml",
  "ddc.toml",
  "ddu.toml",
}
local lazy_tomls = {
  "skkeleton.toml",
  "git.toml",
  "lazy.toml",
  "lsp.toml",
}

if not vim.regex("/dein.vim"):match_str(vim.o.runtimepath) then
  if vim.fn.isdirectory(dein_repo) ~= 1 then
    os.execute("git clone https://github.com/Shougo/dein.vim " .. dein_repo)
  end
  vim.opt.runtimepath:prepend(dein_repo)
end

-- loading dein module
local dein = require("dein")

for index, inline_vimrc in pairs(inline_vimrcs) do
  inline_vimrcs[index] = vimrcs_dir .. inline_vimrc
end

-- dein options
dein.setup({
  install_progress_type = "floating",
  enable_notification = true,
  auto_recache = true,
  lazy_rplugins = true,
  install_check_diff = true,
  install_check_remote_threshold = 24 * 60 * 60,
  inline_vimrcs = inline_vimrcs,
})

if dein.load_state(dein_dir) == 1 then
  dein.begin(dein_dir)
  for _, toml_file in pairs(dein_tomls) do
    dein.load_toml(toml_dir .. toml_file)
  end
  for _, toml_file in pairs(lazy_tomls) do
    dein.load_toml(toml_dir .. toml_file, { lazy = true })
  end
  dein.end_()
  dein.save_state()
end

if dein.check_install() then
  dein.install()
end

if vim.env.plug_dev ~= nil then
  vim.opt.rtp:prepend(vim.fn.getcwd())
end

require('user.nodefaultplugs')
