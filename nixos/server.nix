{ home-manager, ... }:
{
  system = "x86_64-linux";
  modules = [
    home-manager.nixosModules.home-manager

    ../hardware/intelcpu.nix

    ./all.nix
    ./server/btrfs.nix
    ./server/data.nix
    ./server/msmtp.nix
    ./server/networking.nix
    ./server/oci-containers.nix
    ./server/ssh.nix
    ./server/smartd.nix
    ./server/unlock-on-reboot.nix
    ./server/users.nix
    {
      networking.hostName = "server";

      # Disks
      boot.initrd.luks.devices.root.device = "/dev/disk/by-partlabel/root";
      fileSystems = {
        "/" = {
          device = "/dev/mapper/root";
          fsType = "ext4";
        };
        "/boot" = {
          device = "/dev/disk/by-partlabel/boot";
          fsType = "vfat";
        };
      };

      # Auto-upgrades
      system.autoUpgrade = {
        enable = true;
        dates = "daily";
        allowReboot = true;
        rebootWindow = {
          lower = "02:00";
          upper = "05:00";
        };
      };
    }
  ];
}
