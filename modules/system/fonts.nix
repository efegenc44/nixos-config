{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
  ];

  # fonts.fontDir.enable = true;

  # fonts.fontconfig.enable = false;
}