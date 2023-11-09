{ lib, config, ... }: {
  imports = [
    ../.
    ../../../common/cpu/intel/kaby-lake
    ../../../common/gpu/intel
    ../../../common/gpu/nvidia
    ../../../common/pc/ssd
  ];

  hardware = {
    nvidia = {
      prime = {
        intelBusId = lib.mkDefault "PCI:0:2:0";
        nvidiaBusId = lib.mkDefault "PCI:2:0:0";
      };
      powerManagement = lib.mkIf config.hardware.nvidia.prime.sync.enable {
        enable = lib.mkDefault true;
      };
      modesetting = lib.mkIf config.hardware.nvidia.prime.sync.enable {
        enable = lib.MkDefault true;
      };
    };
  };

  services.fprintd.enable = true;

}
