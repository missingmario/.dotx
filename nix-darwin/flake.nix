{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    tap-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    tap-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    tap-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew, tap-core, tap-cask, tap-bundle, home-manager }: 
    let
    darwinConfiguration = { pkgs, ... }: {
      nix.settings = {
        experimental-features = "nix-command flakes";
      };

      system = {
        stateVersion = 6;
        configurationRevision = self.rev or self.dirtyRev or null;
      };

      nixpkgs = {
        hostPlatform = "aarch64-darwin";
      };
    };
  homebrewConfiguration = { pkgs, ... }: {
    nix-homebrew = {
      enable = true;

      user = "mario";

      mutableTaps = false;
      taps = {
        "homebrew/homebrew-core" = tap-core;
        "homebrew/homebrew-cask" = tap-cask;
        "homebrew/homebrew-bundle" = tap-bundle;
      };
    };
  };
  in
  {
    darwinConfigurations."Marios-Virtual-Machine" = nix-darwin.lib.darwinSystem {
      modules = [ 
        nix-homebrew.darwinModules.nix-homebrew
        home-manager.darwinModules.home-manager

        darwinConfiguration
        homebrewConfiguration

        ./modules/darwin
        ./modules/homebrew
        ./modules/home-manager
      ];
    };
  };

}
