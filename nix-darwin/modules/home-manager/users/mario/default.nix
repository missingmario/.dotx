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
    pkgs.tree

    pkgs.nixfmt-rfc-style

    pkgs.lua-language-server
    pkgs.nixd

    pkgs.zig
    pkgs.zls
  ];

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${vars.dotxDir}/nvim";
    ".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "${vars.dotxDir}/ghostty";

    ".config/git/ignore".source = config.lib.file.mkOutOfStoreSymlink "${vars.dotxDir}/git/ignore";
  };

  programs.git = {
    enable = true;

    userName = "Mario Sanchez Lara";
    userEmail = "mario@mariosl.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;

    gitCredentialHelper = {
      enable = true;
      hosts = [ "https://github.com" ];
    };
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
