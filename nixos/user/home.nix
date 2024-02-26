{ config, pkgs, lib, inputs, ... }:
{
    imports = [
        ./programs/firefox.nix
        ./programs/nvim.nix
        ./programs/kitty.nix
        ./programs/zsh.nix
        ./programs/lsd.nix
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

    services.flameshot.enable = true;

    programs.starship.enable = true;
    home.file.".config/starship.toml".source = ../../.config/starship.toml;

    programs = {

        # rofi.enable = true; # window switcher and application launcher

        tmux = {
            enable = true;
        };

        script-directory = {
            enable = true;
            settings = { SD_ROOT = "${config.home.homeDirectory}/.scripts"; };
        };

        ripgrep.enable = true;

        home-manager = {
            enable = true;
            path = lib.mkForce "$HOME/.dotfiles/nixos";
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
    };


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
    };

    # Let Home Manager install and manage itself.
}
