{ home-manager, sops-nix, ... }:
{
  system = "x86_64-linux";
  modules = [
    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops

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

      # Auto-upgrades
      system.autoUpgrade = {
        enable = true;
        dates = "daily";
        allowReboot = true;
        rebootWindow = {
          lower = "05:00";
          upper = "07:00";
        };
      };
    }
  ];
}
