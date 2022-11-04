{ pkgs
, lib
, config
, inputs
, ...
}:
with pkgs; {
  home.packages = [
    git-crypt
  ];

  programs.git = {
    enable = true;
    signing = {
      key = secrets.git.signing-key;
      signByDefault = true;
    };
  };
}
