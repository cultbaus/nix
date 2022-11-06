{ pkgs
, lib
, config
, inputs
, ...
}:
{
  time.timeZone = "America/Los_Angeles";

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
  ];
}
