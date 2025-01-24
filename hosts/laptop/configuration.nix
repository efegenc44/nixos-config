{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  networking.hostName = "laptop";

  users.users.efegenc44 = {
    isNormalUser = true;
    description = "Efe Genç";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;

    # Touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    printing.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  programs = {
    firefox.enable = true;
    git.enable = true;
    vim.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
