{
    home.file.".config/qtile/config.py" = {
        source = ../../../.config/qtile/config.py;
        onChange = ''
            qtile cmd-obj -o cmd -f reload_config
        '';
    };
}
