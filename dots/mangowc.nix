{ config, pkgs, lib, ... }:

{
  wayland.windowManager.mango = {
    enable = true;


  settings = ''

# General settings
xkb_rules_options=caps:ctrl
xkb_rules_options=ctrl:nocaps
repeat_rate=45
repeat_delay=250
mod = SUPER
terminal = kitty
exec-once = waybar
exec-once = waypaper --restore
exec-once = hypridle
mouse_natural_scrolling=1

#gaps
gappih=10
gappiv=10
gappoh=13
gappov=13
circle_layout=tile,scroller,center_tile
windowrule=focused_opacity:0.9,unfocused_opacity:0.8,appid:qutebrowser
windowrule=focused_opacity:0.7,unfocused_opacity:0.6,appid:emacs

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

#shadows
shadows=1
layer_shadows=4
shadow_only_floating=0
shadows_size=10
shadows_blur=15
shadows_position_x=0
shadows_position_y=0
shadowscolor=0x000000ff

border_radius=5
no_radius_when_single=0
no_border_when_single=0
borderpx=0
focused_opacity=1.0
unfocused_opacity=0.9


# Animation Configuration(support type:zoom,slide)
# tag_animation_direction: 1-horizontal,0-vertical
animations=1
layer_animations=1
animation_type_open=slide
animation_type_close=slide
animation_fade_in=1
animation_fade_out=1
tag_animation_direction=1
zoom_initial_ratio=0.3
zoom_end_ratio=0.8
fadein_begin_opacity=0.5
fadeout_begin_opacity=0.8
animation_duration_move=100
animation_duration_open=50
animation_duration_tag=50
animation_duration_close=100
animation_duration_focus=0
animation_curve_open=0.2,0.8,0.2,1
animation_curve_move=0.2,0.8,0.2,1
animation_curve_tag=0.2,0.8,0.2,1
animation_curve_close=0.2,0.8,0.2,1
animation_curve_focus=0.2,0.8,0.2,1
animation_curve_opafadeout=0.2,0.8,0.2,1
animation_curve_opafadein=0.2,0.8,0.2,1

# Scroller Layout Setting
scroller_structs=20
scroller_default_proportion=0.8
scroller_focus_center=0
scroller_prefer_center=0
edge_scroller_pointer_focus=1
scroller_default_proportion_single=1.0
scroller_proportion_preset=0.5,0.8,1.0

# Keybindings
bind=SUPER+SHIFT,r,reload_config
bind = SUPER,return,spawn,kitty
bind = SUPER,n,spawn,networkmanager_dmenu -l 30 -i
bind=SUPER+SHIFT,RETURN,swapnext
bind=SUPER+ALT,l,hyprlock
bind=SUPER+SHIFT,q,exit
bind=SUPER+SHIFT,f,togglefullscreen
bind=SUPER,s,toggle_scratchpad
bind=SUPER+SHIFT,c,killclient
bind=SUPER+SHIFT,n,switch_layout
bind=SUPER,h,resizewin,-30 0
bind=SUPER,l,resizewin, +30, +0
bind=SUPER,p,spawn,hyprshot -m region -o ~/pix/scrots/

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
bind=SUPER+ALT,1,comboview,1
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

'';
  };
}
