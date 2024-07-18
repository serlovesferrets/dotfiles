{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = "ser";
    homeDirectory = "/Users/ser";

    stateVersion = "23.11";

    packages = with pkgs; [
      # Coding tools
      ripgrep
      gh
      neovim
      wget
      zsh
      pure-prompt

      # C++
      meson
      mesonlsp

      # Fish
      # fish
      # fishPlugins.tide
      # fishPlugins.autopair

      # My favorite font
      cascadia-code

      ## Nix
      nixd
      nixpkgs-fmt

      ## Lua
      lua
      lua-language-server
      stylua

      ## LaTeX
      texliveFull
      texlab
      texlivePackages.latexindent
    ];

    file = { };
    sessionVariables = { };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
        export CLICOLOR=1
        export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "sindresorhus/pure"; }
      ];
    };

  };

  programs.home-manager.enable = true;
}
