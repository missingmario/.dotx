{ pkgs, ... }:
{

  homebrew = {
    enable = true;

    casks = [ 
      "ghostty"
      "iina"
      "keka"
      "1password"

      "visual-studio-code"

      #"flutter"
    ];

    onActivation.cleanup = "zap";
  };

}
