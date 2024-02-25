{config, ...}:

{
  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.extraConfig = ''ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel'';
  sops.secrets."wireless.env" = {};
  networking.wireless.environmentFile = config.sops.secrets."wireless.env".path;
  networking.wireless.networks."@SSID@".psk ="@PASS@";
}
