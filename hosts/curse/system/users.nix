{ pkgs
, lib
, config
, inputs
, ...
}: {
  users.users = {
    body = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
    };
  };
}
