{
    services.xserver.enable = true;
    # Configure keymap in X11
    services.xserver.xkb.layout = "us";
    # services.xserver.xkb.options = "caps:escape";
    services.xserver.libinput.enable = true;
}
