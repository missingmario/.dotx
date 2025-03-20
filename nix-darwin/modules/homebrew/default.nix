{ pkgs, ... }:
{

  homebrew = {
    enable = true;

    taps = [
      "homebrew/core"
      "homebrew/cask"
    ];

    casks = [ 
      "ghostty"

      "rectangle"
      "iina"
      "keka"

      "1password"

      "google-chrome"

      "visual-studio-code"
    ];

    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
  };

}
