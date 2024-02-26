{
    programs.lsd = {
        enable = true;
        enableAliases = true;
        settings = {
            color.when = "always";
            icons = {
                when = "always";
                theme = "fancy";
                seperator = " ";
            };
            permission = "rwx";
            hyperlink = "never";
            no-symlink = false;
            symlink-arrow = "⇒";
        };
        colors = {
            user = 159;                           # cyan
            group = 231;                          # foreground
            permission = {
                read = 183;                         # blue
                write = 212;                        # magenta
                exec = 159;                         # cyan
                exec-sticky = 159;                  # cyan
                no-access = 210;                    # red
            };
            date = {
                hour-old = 146;                     # comment 20% lighter
                day-old = 103;                      # comment
                older = 60;                         # current line
            };
            size = {
                none = 60;                          # current line
                small = 120;                        # green
                medium = 222;                       # orange
                large = 210;                        # red
            };
            inode = {
                valid = 231;                        # foreground
                invalid = 210;                      # red
            };
            links = {
                valid = 159;                        # cyan
                invalid = 210;                      # red
            };
            tree-edge= 183;                      # blue
        };
    };
}
