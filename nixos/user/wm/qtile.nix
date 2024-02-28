{unstable-pkgs, ...}:
{
    home.file.".config/qtile/config.py" = {
        source = ../../../.config/qtile/config.py;
        onChange = "/nix/store/rx6hpd5q9hgkfm3qv1grr47611r97l84-python3.11-qtile-0.23.0/bin/qtile cmd-obj -o cmd -f reload_config";# "qtile cmd-obj -o cmd -f reload_config";
    };
    home.file.".config/qtile/default.png".source = ../../../.config/qtile/default.png;

    # Picom
    home.packages = with unstable-pkgs; [ picom ];
    home.file.".config/qtile/autostart-picom.sh".source = ../../../.config/qtile/autostart-picom.sh;
    home.file.".config/picom.conf".source = ../../../.config/picom.conf;
}
