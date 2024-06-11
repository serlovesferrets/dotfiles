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
      tmux
      ripgrep
      gh
      neovim

      ## I'm sorry
      screenfetch

      # Fish
      fish
      fishPlugins.tide
      fishPlugins.autopair

      # My favorite font
      cascadia-code

      ## Nix
      nixd
      nixpkgs-fmt

      ## Lua
      lua-language-server
      stylua
    ];

    file = { };
    sessionVariables = { };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      fish_add_path $HOME/.config/scripts/

      abbr flake "nix flake init --template github:the-nix-way/dev-templates#"
      abbr dev "nix develop -c fish"

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
