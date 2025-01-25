{ config, pkgs, ... }:

let
  username = "efegenc44";
in
{
  imports = [
    ./alacritty.nix
    ./git.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
  };

  home.packages = with pkgs; [
    fastfetch
    btop
    wget

    libgcc
    rustup
    python313

    spotify

    vscode
    kdePackages.kate

    alacritty
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
