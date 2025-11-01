{
  description = "ur mom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # winapps = {
    #   url = "github:winapps-org/winapps";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      neovim-nightly-overlay,
      # winapps,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          neovim-nightly-overlay.overlays.default
        ];
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          # (
          #   {
          #     pkgs,
          #     ...
          #   }:
          #   {
          #     environment.systemPackages = [
          #       winapps.packages."${system}".winapps
          #       winapps.packages."${system}".winapps-launcher
          #     ];
          #   }
          # )
        ];
      };
      homeConfigurations = {
        xijnim = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
