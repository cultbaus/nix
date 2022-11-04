{ pkgs
, lib
, config
, inputs
, ...
}: {
  programs.bash = {
    loginShellInit = builtins.readFile ./login.sh;
    promptInit = builtins.readFile ./prompt.sh;
  };
  environment.pathsToLink = [ "/share/bash-completion" ];
}
