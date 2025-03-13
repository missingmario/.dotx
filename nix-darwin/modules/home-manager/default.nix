{ pkgs, ... }:
{

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
      "mario" = ./users/mario;
    };
  };

}
