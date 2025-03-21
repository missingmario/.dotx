{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
  };

  users.users."mario" = {
    home = "/Users/mario";
  };

  system.defaults = {
    dock = {
      autohide = false;
      mineffect = "scale";
      show-recents = false;
      static-only = false;

      tilesize = 48;

      persistent-apps = [
        "/Applications/Ghostty.app"
        "/System/Applications/Launchpad.app"
        "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
        "/Applications/Google Chrome.app"
        "/Applications/Visual Studio Code.app"
      ];
    };

    finder = {
      ShowPathbar = true;
    };

    NSGlobalDomain = {
      AppleICUForce24HourTime = true;

      KeyRepeat = 1;
      InitialKeyRepeat = 10;
    };
  };
}
