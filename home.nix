{
  pkgs,
  ...
}:
{
  home.username = "xijnim";
  home.homeDirectory = "/home/xijnim";
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ":q" = "exit";
      "l" = "ls -la";
    };
  };
  home.packages = with pkgs; [
    hyprshot
    hyprpaper
    waybar
    wofi
    obs-studio
    firefox
    tmux
    gcc
    nil
    nixpkgs-fmt
    nodejs
    ripgrep
    wl-clipboard-rs
    feh
    fastfetch
    btop
    libnotify
    pavucontrol
    file
    banana-cursor

    tmux-sessionizer
    aseprite

    rustup

    olympus
  ];

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "xijnin@gmail.com";
        name = "xijnim";
      };
      pull = {
        rebase = false;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.vesktop.enable = true;

  programs.home-manager.enable = true;
}
