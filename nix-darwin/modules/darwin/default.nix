{ pkgs, ... }:
{

  programs.fish = {
    enable = true;
  };

  users.users."mario" = {
    home = "/Users/mario";
  };

  system.defaults = {
    dock.autohide = false;
    dock.mineffect = "scale";
    dock.show-recents = false;
    dock.persistent-apps = [
      "/Applications/Ghostty.app"
      {
        spacer = {
          small = true;
        };
      }
      "/Applications/Visual Studio Code.app"
    ];
    
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.KeyRepeat = 2;
  };

}
