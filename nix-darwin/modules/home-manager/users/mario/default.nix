{ config, pkgs, ... }:
let 
vars = {
  homeDir = "/Users/mario";
  dotxDir = "/Users/mario/.dotx";
}; 
in
{
  home = {
    username = "mario";
    homeDirectory = "/Users/mario";

    stateVersion = "24.11";
  };

  home.packages = [
    pkgs.chezmoi
      pkgs.tree
  ];

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${vars.dotxDir}/nvim";
    ".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "${vars.dotxDir}/ghostty";
  };

  programs.git = {
    enable = true;

    userName = "Mario Sanchez Lara";
    userEmail = "mario@mariosl.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;

    gitCredentialHelper = [
      "https://github.com"
    ];
  };

  programs.ssh = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };
}
