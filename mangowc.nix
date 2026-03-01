{ config, pkgs, lib, ... }:

{
  wayland.windowManager.mango = {
    enable = true;


  settings = ''

# General settings

#gaps
gappih=10
gappiv=10
gappoh=10
gappov=10

#blur
blur=2 
blur_layer=5
blur_optimized=1
blur_params_num_passes=5
blur_params_radius=5
blur_params_noise=0.02
blur_params_brightness=0.9
blur_params_contrast=0.9
blur_params_saturation=1.2


border_radius=10
no_radius_when_single=0
no_border_when_single=0
borderpx=0
focused_opacity=1.0
unfocused_opacity=0.9

mod = SUPER
terminal = kitty

exec-once = waybar
exec-once = waypaper --restore
mouse_natural_scrolling=0

# Keybindings
bind=SUPER+SHIFT,r,reload_config
bind = SUPER,return,spawn,kitty
bind=SUPER+SHIFT,RETURN,swapnext
bind=SUPER+SHIFT,q,exit
bind=SUPER+SHIFT,c,killclient
bind=SUPER+SHIFT,n,switch_layout
bind=SUPER,h,resizewin,-30 0
bind=SUPER,l,resizewin, +30, +0

bind = SUPER+SHIFT,g,spawn,pkill waybar 
bind = SUPER+SHIFT,b,spawn,waybar 
bind = SUPER+SHIFT,q,quit
bind = SUPER,E,spawn, kitty yazi
bind = SUPER,space,spawn, wofi --show drun
bind=SUPER,f,togglefloating

#focus
bind=SUPER+SHIFT,h,focusdir,left
bind=SUPER+SHIFT,l,focusdir,right
bind=SUPER+SHIFT,k,focusdir,up
bind=SUPER+SHIFT,j,focusdir,down


#tags view
bind=SUPER,1,view,1,0
bind=SUPER,2,view,2,0
bind=SUPER,3,view,3,0
bind=SUPER,4,view,4,0
bind=SUPER,5,view,5,0
bind=SUPER,6,view,6,0
bind=SUPER,7,view,7,0
bind=SUPER,8,view,8,0
bind=SUPER,9,view,9,0


# Move windows to workspaces
bind=SUPER+SHIFT,1,tag,1,0
bind=SUPER+SHIFT,2,tag,2,0
bind=SUPER+SHIFT,3,tag,3,0
bind=SUPER+SHIFT,4,tag,4,0
bind=SUPER+SHIFT,5,tag,5,0
bind=SUPER+SHIFT,6,tag,6,0
bind=SUPER+SHIFT,7,tag,7,0
bind=SUPER+SHIFT,8,tag,8,0
bind=SUPER+SHIFT,9,tag,9,0

# Window Swap
bind=SUPER+ALT,k,exchange_client,up
bind=SUPER+ALT,j,exchange_client,down
bind=SUPER+ALT,h,exchange_client,left
bind=SUPER+ALT,l,exchange_client,right

# Gaps
bind=SUPER+SHIFT,a,incgaps,1
bind=SUPER+SHIFT,x,incgaps,-1

#Volume and Brightness
bind=NONE,XF86AudioRaiseVolume,spawn,amixer set Master 5%+ unmute
bind=NONE,XF86AudioLowerVolume,spawn,amixer set Master 5%- unmute
bind=NONE,XF86AudioMute,spawn,amixer set Master toggle o
bind=NONE,XF86AudioMicMute,spawn,
bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl -d intel_backlight set +1000             
bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl -d intel_backlight set 1000-    

# Caps lock remap
autostart = setxkbmap -option ctrl:nocaps
'';
  };
}
