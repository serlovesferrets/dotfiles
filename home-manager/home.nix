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

    packages = [
      # Coding tools
      pkgs.neovim
      pkgs.tmux
      pkgs.ripgrep
      pkgs.gh

      ## I'm sorry
      pkgs.neofetch

      # Fish
      pkgs.fish
      pkgs.fishPlugins.tide
      pkgs.fishPlugins.autopair

      # My favorite font
      pkgs.cascadia-code

      # Language stuff
      pkgs.nil
      pkgs.nixpkgs-fmt

      ## Python
      pkgs.python3
      pkgs.black
      pkgs.nodePackages.pyright

      ## Haskell
      pkgs.ghc
      pkgs.cabal-install
      pkgs.haskell-language-server

      ## Java
      pkgs.jdk21
      pkgs.gradle
      pkgs.jdt-language-server

      ## Lua
      pkgs.lua-language-server
      pkgs.stylua
    ];

    file = { };
    sessionVariables = { };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      fish_vi_key_bindings # Vi mode
    '';
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      fish
      exit
    '';
  };

  programs.home-manager.enable = true;
}
