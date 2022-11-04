{ pkgs
, lib
, config
, inputs
, ...
}: {
  users.users = {
    nil = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
    };
  };
}
