{ pkgs
, lib
, config
, inputs
, ...
}:
{
  services = {
    picom = {
      enable = true;
      fade = false;
      backend = "glx";
      vSync = true;
      settings = {
        opengl-swc = true;
        glx-swap-method = 2;
      };
      experimentalBackends = true;
      shadow = true;
      shadowOpacity = 0.2;
      shadowOffsets = [ (-10) (-10) ];
      shadowExclude = [
        "name *= 'picom'"
        "name = 'cpt_frame_window'"
        "_GTK_FRAME_EXTENTS@:c"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];
    };
  };
}
