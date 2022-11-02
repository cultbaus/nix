{ pkgs, ... }: {
  users.users = {
    nil = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHIeUqwngaJ/bHKXpMhagUGFN6VNHBBcEEfadjPHAu+A cultbaus@gmail.com"
      ];
    };
  };
}
