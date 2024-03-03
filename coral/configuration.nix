# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./prowlarr.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "coral"; # Define your hostname.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_6_7.gasket #google coral
    plex
    plexRaw
    plexamp
    plex-media-player
  ];
  #services.frigate.enable = true;
  services.plex = let plexpass = pkgs.plex.override {
  plexRaw = pkgs.plexRaw.overrideAttrs(old: rec {
    version = "1.40.1.8120-6dc7f7fd8";
    src = pkgs.fetchurl {
      url = "https://downloads.plex.tv/plex-media-server-new/${version}/debian/plexmediaserver_${version}_amd64.deb";
      sha1 = "a85174fc5169db425f101c4a314d3460c37f9bff";
    };
  });
  }; 
  in {
    enable = true;
    openFirewall = true;
    user = "actuary";
    dataDir = "/var/lib/plex/'TV Shows'";
    package = plexpass;
  };
  services.tautulli.enable = true;

}
