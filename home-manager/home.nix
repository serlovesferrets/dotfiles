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
      fzf
      fd
      gh
      neovim
      wget
      direnv
      zsh
      pure-prompt

      # .NET
      csharp-ls

      # My favorite font
      cascadia-code

      ## Nix
      nixd
      nixpkgs-fmt

      ## Lua
      lua
      lua-language-server
      stylua
    ];

    file = { };
    sessionVariables = { EDITOR = "nvim"; };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # Home manager
      hms = "home-manager switch";
      hmb = "home-manager build";
      # Git repos
      gr = "cd $((find ~/dev ~/.config /tmp -type d -name \".git\" | sed 's/....$//' | fzf) || pwd)";
      # Go to
      gt = "cd $((find . -type d | fzf) || pwd)";
      # Nvim
      n = "nvim";
      nt = "nvim +'Telescope git_files'";
      nta = "nvim +'Telescope find_files'";
    };

    initExtra = ''
      export CLICOLOR=1
      export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
      export FZF_DEFAULT_OPTS=" \
        --color=fg:-1,fg+:#C1C0D6,bg:-1,bg+:#262626 \
        --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
        --color=hl:#BAAFD2,hl+:#BAAFD2,info:#EFB799,marker:#84BA9D \
        --color=border:#262626,label:#aeaeae,query:#C1C0D6 \
        --color=selected-bg:#494d64 \
        --multi"

      eval "$(direnv hook zsh)"
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
