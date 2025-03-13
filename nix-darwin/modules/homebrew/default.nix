{ pkgs, ... }:
{

  homebrew = {
    enable = true;

    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/bundle"
    ];

    casks = [ 
      "ghostty"
      "iina"
      "keka"
      "1password"

      "visual-studio-code"

      "flutter"
    ];

    onActivation.cleanup = "zap";
  };

}
