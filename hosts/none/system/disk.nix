{ config, lib, pkgs, modulesPath, ... }:
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/84acfb57-2131-470a-8000-6722d796b260";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/d4172c3d-dbb5-4d1d-ab03-f2d2ace1628e";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/84acfb57-2131-470a-8000-6722d796b260";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/84acfb57-2131-470a-8000-6722d796b260";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/84acfb57-2131-470a-8000-6722d796b260";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/84acfb57-2131-470a-8000-6722d796b260";
      fsType = "btrfs";
      options = [ "subvol=log" ];
      neededForBoot = true; 
   };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/809C-5222";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9d230636-caed-46fb-a6d3-651c6b4bff4f"; }
    ];
}
