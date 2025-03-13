{ pkgs, ... }:
{

  programs.fish = {
    enable = true;
  };

  users.users."mario" = {
    home = "/Users/mario";
  };

}
