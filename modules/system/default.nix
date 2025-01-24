{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./graphics.nix
    ./locals.nix
    ./networking.nix
    ./nix.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Do not install any packeges by default
  environment.defaultPackages = [];
}