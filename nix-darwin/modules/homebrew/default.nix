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
      "latest"

      "1password"

      "google-chrome"

      "visual-studio-code"
      "android-studio"
    ];

    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
  };
}
