{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
      editor = false;

      # windows = {};
      # cleanOnBoot = true;
    };

    # grub = {
    #   enable = true;
    #   configurationLimit = 10;
    #   efiSupport = true;
    #   useOSProber = true;
    # };

    timeout = 10;
  };
}