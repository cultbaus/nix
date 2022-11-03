# nix

my nixos build

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
