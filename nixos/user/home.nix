{ config, pkgs, lib, inputs, ... }:
{
    imports = [
        ./firefox.nix
    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "unix";
    home.homeDirectory = "/home/unix";

    home.packages = with pkgs; [
        fd
        rustup
        gcc
        # fonts
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
    ];


    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.


    programs = {

        home-manager = {
            enable = true;
            path = lib.mkForce "$HOME/.dotfiles/nixos";
        };

        kitty = {
            enable = true;
            font.name = "FiraCode Nerd Font Reg";
            font.package = (pkgs.nerdfonts.override { fonts = ["FiraCode"]; });
            settings.enable_audio_bell = false;
            extraConfig = ''
                background #22212C
                foreground #f8f8f2
                cursor #ABB2BF
                selection_background #44475a
                color0 #191A21
                color8 #4B5263
                color1 #ff5555
                color9 #FF6E6E
                color2 #50fa7b
                color10 #8AFF80
                color3 #FFFF80
                color11 #F1FA8C
                color4 #9580FF
                color12 #bd93f9
                color5 #FF80BF
                color13 #FF92DF
                color6 #80FFEA
                color14 #A4FFFF
                color7 #ABB2BF
                color15 #ffffff
                selection_foreground #1e1f28
            '';
        };

        fzf = {
            enable = true;
            colors = {
                fg="-1";
                bg="-1";
                hl = "#5fff87";
                "fg+" = "-1";
                "bg+" = "-1";
                "hl+" = "#ffaf5f";
                info = "#af87ff";
                prompt = "#5fff87";
                pointer = "#ff87d7";
                marker = "#ff87d7";
                spinner = "#ff87d7";
            };
        };

        lf = { enable = true; };

        zsh = {
            enable = true;
            enableAutosuggestions = true;
            syntaxHighlighting = {
                enable = true;
                highlighters = [
                    "brackets"
                    "cursor"
                ];
                styles = {
                    ## Comments
                    comment="fg=#6272A4";
                    ## Constants
                    ## Entitites
                    ## Functions/methods
                    alias="fg=#50FA7B";
                    suffix-alias="fg=#50FA7B";
                    global-alias="fg=#50FA7B";
                    function="fg=#50FA7B";
                    command="fg=#50FA7B";
                    precommand="fg=#50FA7B,italic";
                    autodirectory="fg=#FFB86C,italic";
                    single-hyphen-option="fg=#FFB86C";
                    double-hyphen-option="fg=#FFB86C";
                    back-quoted-argument="fg=#BD93F9";
                    ## Keywords
                    ## Built ins
                    builtin="fg=#8BE9FD";
                    reserved-word="fg=#8BE9FD";
                    hashed-command="fg=#8BE9FD";
                    ## Punctuation
                    commandseparator="fg=#FF79C6";
                    command-substitution-delimiter="fg=#F8F8F2";
                    command-substitution-delimiter-unquoted="fg=#F8F8F2";
                    process-substitution-delimiter="fg=#F8F8F2";
                    back-quoted-argument-delimiter="fg=#FF79C6";
                    back-double-quoted-argument="fg=#FF79C6";
                    back-dollar-quoted-argument="fg=#FF79C6";
                    ## Serializable / Configuration Languages
                    ## Storage
                    ## Strings
                    command-substitution-quoted="fg=#F1FA8C";
                    command-substitution-delimiter-quoted="fg=#F1FA8C";
                    single-quoted-argument="fg=#F1FA8C";
                    single-quoted-argument-unclosed="fg=#FF5555";
                    double-quoted-argument="fg=#F1FA8C";
                    double-quoted-argument-unclosed="fg=#FF5555";
                    rc-quote="fg=#F1FA8C";
                    ## Variables
                    dollar-quoted-argument="fg=#F8F8F2";
                    dollar-quoted-argument-unclosed="fg=#FF5555";
                    dollar-double-quoted-argument="fg=#F8F8F2";
                    assign="fg=#F8F8F2";
                    named-fd="fg=#F8F8F2";
                    numeric-fd="fg=#F8F8F2";
                    ## No category relevant in spec
                    unknown-token="fg=#FF5555";
                    path="fg=#F8F8F2";
                    path_pathseparator="fg=#FF79C6";
                    path_prefix="fg=#F8F8F2";
                    path_prefix_pathseparator="fg=#FF79C6";
                    globbing="fg=#F8F8F2";
                    history-expansion="fg=#BD93F9";
                    #ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
                    #ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
                    #ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
                    #ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
                    back-quoted-argument-unclosed="fg=#FF5555";
                    redirection="fg=#F8F8F2";
                    arg0="fg=#F8F8F2";
                    default="fg=#F8F8F2";
                    cursor="standout";
                };
            };
            zsh-abbr.enable = true;
            zsh-abbr.abbreviations = {
                hm = "home-manager switch --flake ~/.dotfiles/nixos";
                upos = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos";
            };
            shellAliases = {
                cat = "bat";
            };
        };

        lsd = {
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

        bat = {
            enable = true;
            config = {
                theme = "Dracula";
            };
            themes = {
                dracula = {
                    src = pkgs.fetchFromGitHub {
                        owner = "dracula";
                        repo = "sublime"; # Bat uses sublime syntax for its themes
                        rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
                        sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
                    };
                    file = "Dracula.tmTheme";
                };
            };
        };

        zoxide = {
            enable = true;
            options = [
                "--cmd cd"
            ];
        };

        btop = {
            enable = true;
            settings = {
                color_theme = "dracula";
                theme_background = false;
                vim_keys = true;
            };
        };

    };

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;
        
        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';

        ".config/nixpkgs" = { source = ../../.config/nixpkgs; recursive = true;};
    };


    programs.starship.enable = true;
    home.file.".config/starship.toml".source = ../../.config/starship.toml;

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. If you don't want to manage your shell through Home
    # Manager then you have to manually source 'hm-session-vars.sh' located at
    # either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/unix/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    # Let Home Manager install and manage itself.
}
