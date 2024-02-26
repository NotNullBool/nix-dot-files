{ pkgs, ... }:
{
    home.packages = with pkgs; [
        fd
        rustup
        gcc
        # fzf # set up in home.nix
    ];

    home.file.".config/nvim" = { source = ../../.config/nvim; recursive = true; };
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
    };

    # programs.opam.enable = true; # ocaml stuff
    # programs.pyenv.enable = true; # python env per user
    # programs.rbenv.enable = true; # ruby env per user

    # programs.ripgrep.enable = true; # managing in home.nix

}
