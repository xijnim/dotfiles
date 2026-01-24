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
    hyprpicker
    waybar
    wofi
    wlogout

    obs-studio
    firefox
    librewolf
    tmux
    gcc
    nil
    zls
    nixpkgs-fmt
    nodejs
    ripgrep
    jq
    wl-clipboard-rs
    feh
    fastfetch
    btop
    yazi
    libnotify
    pavucontrol
    file
    tree
    bat
    cava
    brightnessctl
    nautilus
    psmisc
    yt-dlp
    ffmpeg
    audacity

    jetbrains.rust-rover
    sublime4
    protonup-qt

    gimp

    tmux-sessionizer
    aseprite

    tree-sitter
    rustup
    cargo-watch
    cargo-expand
    gnumake
    # clang-tools
    python3
    python3Packages.pip
    python3Packages.numpy

    zig
    gleam

    olympus
    wtfutil

    # qt6.qtbase
    # qt6.qtnetworkauth
    # qt6.qtdeclarative
    # qt6.qtsvg
    # qt6.qttools
    # qt6.qt5compat
    # qt6.qtscxml
    # libsndfile
    # musescore

    kdePackages.kdenlive
    kdePackages.okular
    nwg-displays

    tetris
    # clang
    libclang
    glibc.dev
    valgrind

    vlc
    pyright
    libreoffice
    packet

    bluez
    bluez-tools
    blueman
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

  home.sessionVariables = {
    LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
  };

  programs.vesktop.enable = true;

  programs.home-manager.enable = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
}
