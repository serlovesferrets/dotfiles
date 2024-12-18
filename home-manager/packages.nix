{ pkgs }:

with pkgs; let
  codingTools = [
    devenv
    ripgrep
    fzf
    fd
    gh
    wget
  ];

  shellStuff = [
    zsh
    direnv
    starship
  ];

  outsideNix = [
    rustup
    mold
  ];

  fonts = [
    jetbrains-mono
  ];

  nixUtils = [
    nixd
    nixpkgs-fmt
  ];

  nvimStuff = [
    neovim
    lua
    lua-language-server
    stylua
  ];

  macos = [
    pkg-config
    skhd
    yabai
  ];
in

codingTools
  ++ shellStuff 
  ++ outsideNix 
  ++ fonts 
  ++ nixUtils 
  ++ nvimStuff 
  ++ macos
