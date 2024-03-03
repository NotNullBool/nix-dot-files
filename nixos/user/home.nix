{ config, pkgs, lib, unstable-pkgs, ... }:
{

    imports = [
        ./programs/firefox.nix
        ./programs/nvim.nix
        ./programs/kitty.nix
        ./programs/zsh.nix
        ./programs/lsd.nix
        ./programs/rofi.nix # x11 only;
        ./programs/polybar.nix
        ./wm/qtile.nix
    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "unix";
    home.homeDirectory = "/home/unix";

    home.packages = with pkgs; [
        yq # used for yml files and added for TMUX plugin
        trashy # buggy may want to replace
        fd
        rustup
        gcc
        komorebi
        xclip
        # fonts
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
    ] ++ [
        unstable-pkgs.webcord-vencord
        unstable-pkgs.fastfetch
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

    programs.yazi = { 
        enable = true;
        enableZshIntegration = true;
        theme = {
            status = {
                separator_open = "";
                separator_close = "";
            };
        };
    };

    programs.tmux.enable = true;
    home.file.".config/tmux" = { 
        source = ../../.config/tmux; 
        recursive = true;
    };
    

    programs = {

        script-directory = {
            enable = true;
            settings = { SD_ROOT = "${config.home.homeDirectory}/.dotfiles/scripts"; };
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

}
