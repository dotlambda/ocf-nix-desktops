{ lib, config, ... }:

with lib;
let
  cfg = config.ocf.tmpfsHome;
in
{
  options.ocf.tmpfsHome = {
    enable = mkEnableOption "Enable /home on tmpfs";
  };

  config = mkIf cfg.enable {
    fileSystems."/home" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = [ "size=16G" "mode=755" ];
    };
  };
}
