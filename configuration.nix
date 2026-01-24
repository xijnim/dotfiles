{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./kanata.nix
    # ./vm.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
  };

  users.users.xijnim = {
    isNormalUser = true;
    description = "xijnim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    git
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.EDITOR = "nvim";

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  services.openssh.enable = true;
  services.preload.enable = true;
  # services.power-profiles-daemon.enable = true;

  hardware.bluetooth.enable = true;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "performance";
       turbo = "auto";
    };
  };

  system.stateVersion = "25.05";
}
