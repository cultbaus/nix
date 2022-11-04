# nix

my nixos build

## installation

installation varies slightly between desktop/laptop implementations

### laptop (nil@none)

install nixos as normal, create `nixos`, `boot`, and `swap` partitions for home/boot/swap

in `/etc/nixos/configuration.nix`:

```nix
{ pkgs, ... }:
{
  networking = {
    hostName = "none";
    wireless = {
      enable = true;
      networks = {
        "ssid" = {
          psk = "psk";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    git
  ];
}
```

reboot, login as root because you followed the readme here and didn't make a user:

```bash
useradd -m -g users -G wheel -s nil
```

clone the repo, cd, run:

```bash
sudo nixos-rebuild switch --flake ."#none"
```

drop into a nix-shell with home-manager, and run the `make home` to install user packages

## quickstart

everything is controlled via the makefile, `make` will print a list of available targets.

### home-manager

to rebuild home-manager configurations: `make home`

### system

to rebuild system-level configurations: `make system`

### generate

to generate all global node modules as nix packages: `make generate`

### clean

to aggressively clean up: `make clean`

## config

### secrets

secrets are contained inside of the [secrets](./secrets) directory and it's just a single `.nix` file that has three values:

```nix
{ ... }:

{
  wifi = {
    ssid = "wifi_ssid";
    psk = "wifi_password";
  };
  git = {
    key = "git_signing_key"; # note: this is not sensitive
  };
}
```

everything is managed via git crypt, so you know, if you fork or clone this repo you'll need to re-configure the `.git-crypt` initialization to match your own keyring, since you can only have my wifi password over my dead body
