{ ...
}:
let
  values = import ../../secrets { };
in
{
  wifi = values.wifi;
  git = values.git;
}
