pkgs:
{
    services.xserver.displayManager.sddm = {
        enable = true;
        theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
}
