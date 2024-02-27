{lib, ...}:
{
    programs.rofi = {
        enable = true;
        theme = {
            "*" = {
                drac-bgd = "#22212C";
                drac-cur = "#454158";
                drac-fgd = "#f8f8f2";
                drac-cmt = "#7970A9";
                drac-cya = "#80FFEA";
                drac-grn = "#50fa7b";
                drac-ora = "#ffb86c";
                drac-pnk = "#FF80BF";
                drac-pur = "#9580FF";
                drac-red = "#ff5555";
                drac-yel = "#FFFF80";

                foreground = "@drac-fgd";
                background-color = "@drac-bgd";
                active-background = "@drac-pnk";
                urgent-background = "@drac-red";
                urgent-foreground = "@drac-bgd";

                selected-background = "@active-background";
                selected-urgent-background = "@urgent-background";
                selected-active-background = "@active-background";
                separatorcolor = "@active-background";
                bordercolor = "@drac-cmt";
            };

            "#window" = {
                background-color = "@background-color";
                border =           0;
                border-radius =    0;
                border-color =     "@bordercolor";
                padding =          15;
            };
        };
    };
}
