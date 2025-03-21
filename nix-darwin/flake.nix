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
      url = "github:missingmario/nix-homebrew/brew-4.4.25";
    };

    nix-homebrew-taps = {
      url = "github:missingmario/nix-homebrew-taps";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      nix-homebrew,
      nix-homebrew-taps,
      home-manager,
      ...
    }:
    let
      system = "aarch64-darwin";
      darwinConfiguration =
        { ... }:
        {
          nix.settings = {
            experimental-features = "nix-command flakes";
          };

          system = {
            stateVersion = 6;
            configurationRevision = self.rev or self.dirtyRev or null;
          };

          nixpkgs = {
            hostPlatform = system;
          };
        };
      homebrewConfiguration =
        { ... }:
        {
          nix-homebrew = {
            enable = true;
            user = "mario";
            taps = nix-homebrew-taps.taps;
            mutableTaps = true;
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
