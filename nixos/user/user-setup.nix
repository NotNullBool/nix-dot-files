{config, pkgs, ...}:

{
    

    # Define a user account. Don't forget to set a password with ‘passwd’.
    sops.secrets."users/unix/passwd".neededForUsers = true;
    sops.secrets."users/unix/passwd" = {};
    users.users."unix" = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        hashedPasswordFile = config.sops.secrets."users/unix/passwd".path;
        shell = pkgs.zsh;
        # ignoreShellProgramCheck = true;
    };
}
