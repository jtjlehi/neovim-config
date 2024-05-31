{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    packages.x86_64-linux.default = pkgs: {
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
  };
}
