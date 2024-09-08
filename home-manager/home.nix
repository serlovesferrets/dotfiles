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

    packages = pkgs.callPackage ./packages.nix { inherit pkgs; };
    file = { };
    sessionVariables = { EDITOR = "nvim"; };
  };

  programs.starship = {
    enable = true;
    settings = {
      palette = "mellow-lite";
      palettes.foo = {
        black = "#161617";
        red = "#FA7CA6";
        green = "#84BA9D";
        blue = "#6ABCE8";
        yellow = "#EFB799";
        purple = "#BBAEDE";
        cyan = "#EE9ACC";
        white = "#C1C0D6";
      };
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };
    };
  };

  programs.direnv = {
    enable = true;
    silent = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
}
