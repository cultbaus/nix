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
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRUF0jWE/YmHd4+92/veLAdlRD9J8Qqv9S/EdpRGWJOPfHZSBBGLUjjgAsGyfI0liz80z4YNvvvw3NLA7ZSpvM0GptfGeofHXp86UPnchsYRTmjdBF7O61v7VprCQ54GD54UB3Zh6Uk2WcGU9sOGdrbYQXGwY1Ei07C0HMNI067NfxZi4zFRLwzCqQL/eazE//BAoKAjPhcwY05cD9prQNEKaZBAae3jpRgkQhEm9AAWBJjXoteWWfKz45V4JusYN71RptPo/KXuoKVZkIy1Dt9880IOVDl0eMjCxoYZICJB1a/SIr3gb0HTK0E5hNKzn8PAYk/vwdMfLzWi/6rTfJqKFPxNlbEKtVzKVe/vQZhymj5+EMyaPIRyGRvTLM+uwLIDbbicDcBeMh1JyYs4yMz5yiZketVnVWtdUPu35HizWmBC37A2JW2VTXrtox3M4h8iOl263mLlXNUhF2RBFTsYyxLFwhYFZp0Q8B2vs49yAy04N1lgykY4Qm2BBj4E6Yy85S4IMwXCJfYHL+PhMBX6IJNRFwHZ3QmU/580tBvTm1PXjwm4l+mhjH/sP0qfGQNdnBs+NuWF8CTOwm5zn+M0DLioT3VOzOP6SGfbod+79EPQZDbGWirOPctFfDbQbP2tA6F5gC2MzYWCJb4V39+CeDmwQo3jb+bmph4HZhDw== cultbaus@gmail.com"
      ];
    };
  };
}
