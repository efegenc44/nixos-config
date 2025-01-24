{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
}