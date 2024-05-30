{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    vim.defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      # nvim-web-devicons
      # nvim-tree
      nvim-treesitter
      # appearance
      lualine-nvim
      rainbow-delimiters-nvim
      vim-startify
      indent-blankline-nvim
      # git
      vim-fugitive
      vim-gitgutter
      # lsp
      lsp-zero-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      luajitPackages.nvim-cmp
    ];
  };
}
