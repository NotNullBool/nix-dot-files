# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, unstable-pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
        inputs.home-manager.nixosModules.default
        inputs.sops-nix.nixosModules.sops
        ./hardware-configuration.nix
        ./networking.nix
        ../user/user-setup.nix
        ./wm/x11.nix
        ./wm/sddm.nix
        ./wm/qtile/qtile.nix
    ];


    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = (_: true);

    sops.defaultSopsFile = ../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/unix/.config/sops/age/keys.txt";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# nix.nixPath = if nix.channel.enable 
# then [
#       "nixpkgs=/nix/var/nix/profiles/per-user/channels/nixos"
#       "nixos-config = ~/.dotfiles/nixos/configuration.nix"
#       "/nix/var/nix/profiles/per-user/root/channels"
# ] else [];

# Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

# Set your time zone.
    time.timeZone = "America/New_York";

# Enable touchpad support (enabled default in most desktopManager).


# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
    sound.enable = true;
    services.pipewire = {
        enable = true;
        wireplumber.enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
    };

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;


# List packages installed in system profile. To search, run:
# $ nix search wget
    programs.zsh.enable = true;
    programs.ssh.askPassword = "";
    environment.systemPackages = with pkgs; [
        neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        tmux
        git
    ]; #++ [
      #  unstable-pkgs.picom
    #];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "23.11"; # Did you read the comment?

}

