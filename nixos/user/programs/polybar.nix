{
    services.polybar = {
        enable = true;
        script = "polybar bar &";
        config = {
            "bar/top" = {
                monitor = "\${env:MONITOR:eDP-1}";
                width = "100%";
                height = "3%";
                radius = 0;
                modules-center = "date";
            };

            "module/date" = {
                type = "internal/date";
                internal = 5;
                date = "%d.%m.%y";
                time = "%H:%M";
                label = "%time%  %date%";
            };
        };
    };
}
