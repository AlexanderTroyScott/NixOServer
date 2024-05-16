# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    #./prowlarr.nix
    ./storage.nix
    ./github-runner.nix
  #  ./plex.nix
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
 

    # Define the 'nobody' group
#  users.groups.nobody = {
#    gid = 100;
#  };

  # Define the 'nobody' user
#  users.users.nobody = {
#    isNormalUser = false; # 'nobody' is not a normal user
#    uid = 99;
#    group = "nobody";
#    home = "/"; # typically not used, set to the filesystem root
#    shell = pkgs.runCommandNoCC "no-login-shell" {} ''
#      echo "#!${pkgs.stdenv.shell}" > $out
#      echo "exit 1" >> $out
#      chmod +x $out
#    '';
#    description = "Unprivileged User";
#  };

}
