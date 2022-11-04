{ pkgs
, lib
, config
, inputs
, ...
}: {
  virtualisation = {
    docker = {
      enable = true;
      rootless = { enable = true; };
    };
  };
}
