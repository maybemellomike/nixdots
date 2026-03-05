{ config, pkgs, ... }:

{
  programs.mangowc = {
    enable = true;

    config = {

      #
      # ─── GENERAL ─────────────────────────────────────────────
      #

      gappih = 10;
      gappiv = 10;
      gappoh = 10;
      gappov = 10;

      circle_layout = [ "tile" "scroller" "center_tile" ];

      #
      # ─── BLUR ─────────────────────────────────────────────────
      #

      blur = 2;
      blur_layer = 5;
      blur_optimized = 1;

      blur_params = {
        num_passes = 5;
        radius = 5;
        noise = 0.02;
        brightness = 0.9;
        contrast = 0.9;
        saturation = 1.2;
      };

      #
      # ─── SHADOWS ──────────────────────────────────────────────
      #

      shadows = 0;
      layer_shadows = 5;
      shadow_only_floating = 1;
      shadows_size = 10;
      shadows_blur = 15;
      shadows_position_x = 0;
      shadows_position_y = 0;
      shadowscolor = "0x000000ff";

      #
      # ─── WINDOW APPEARANCE ────────────────────────────────────
      #

      border_radius = 5;
      no_radius_when_single = 0;
      no_border_when_single = 0;
      borderpx = 0;

      focused_opacity = 1.0;
      unfocused_opacity = 0.8;

      mod = "mod4";
      terminal = "kitty";

      mouse_natural_scrolling = 1;

      #
      # ─── AUTOSTART ────────────────────────────────────────────
      #

      exec-once = [
        "waybar"
        "waypaper --restore"
        "hypridle"
      ];

      autostart = [
        "setxkbmap -option ctrl:nocaps"
      ];

      #
      # ─── ANIMATIONS ───────────────────────────────────────────
      #

      animations = 1;
      layer_animations = 1;

      animation = {
        type_open = "slide";
        type_close = "slide";
        fade_in = 1;
        fade_out = 1;
        tag_direction = 1;

        zoom_initial_ratio = 0.3;
        zoom_end_ratio = 0.8;

        duration = {
          move = 300;
          open = 200;
          tag = 250;
          close = 400;
          focus = 0;
        };

        curve = "0.2,0.8,0.2,1";
      };

      #
      # ─── SCROLLER ─────────────────────────────────────────────
      #

      scroller = {
        structs = 20;
        default_proportion = 0.8;
        focus_center = 0;
        prefer_center = 0;
        pointer_focus = 1;
        single_proportion = 1.0;
        proportion_preset = [ 0.5 0.8 1.0 ];
      };

      #
      # ─── KEYBINDINGS ──────────────────────────────────────────
      #

      keybindings = [

        { key = "r"; mods = [ "mod4" "shift" ]; action = "reload"; }

        { key = "Return"; mods = [ "mod4" ]; action = "spawn"; command = "kitty"; }
        { key = "Return"; mods = [ "mod4" "shift" ]; action = "swapnext"; }

        { key = "q"; mods = [ "mod4" "shift" ]; action = "exit"; }
        { key = "c"; mods = [ "mod4" "shift" ]; action = "killclient"; }
        { key = "n"; mods = [ "mod4" "shift" ]; action = "switch_layout"; }

        { key = "h"; mods = [ "mod4" ]; action = "resize"; argument = "-30 0"; }
        { key = "l"; mods = [ "mod4" ]; action = "resize"; argument = "30 0"; }

        { key = "f"; mods = [ "mod4" ]; action = "togglefloating"; }

        { key = "space"; mods = [ "mod4" ]; action = "spawn"; command = "wofi --show drun"; }

        #
        # Workspace switching
        #

        { key = "1"; mods = [ "mod4" ]; action = "view"; workspace = 1; }
        { key = "2"; mods = [ "mod4" ]; action = "view"; workspace = 2; }
        { key = "3"; mods = [ "mod4" ]; action = "view"; workspace = 3; }
        { key = "4"; mods = [ "mod4" ]; action = "view"; workspace = 4; }
        { key = "5"; mods = [ "mod4" ]; action = "view"; workspace = 5; }
        { key = "6"; mods = [ "mod4" ]; action = "view"; workspace = 6; }
        { key = "7"; mods = [ "mod4" ]; action = "view"; workspace = 7; }
        { key = "8"; mods = [ "mod4" ]; action = "view"; workspace = 8; }
        { key = "9"; mods = [ "mod4" ]; action = "view"; workspace = 9; }

        #
        # Tag (move window)
        #

        { key = "1"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 1; }
        { key = "2"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 2; }
        { key = "3"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 3; }
        { key = "4"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 4; }
        { key = "5"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 5; }
        { key = "6"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 6; }
        { key = "7"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 7; }
        { key = "8"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 8; }
        { key = "9"; mods = [ "mod4" "shift" ]; action = "tag"; workspace = 9; }

      ];
    };
  };
}
