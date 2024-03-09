{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  github-runner
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };
  services.github-runners = {
      alex = {
        url = "https://github.com/AlexanderTroyScott/hackathon-predictive-analytics";
        tokenFile = "/etc/nixos/alex.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["vpn"];
        name = "actuary";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          ];
      }; 
  };
    services.github-runners = {
      alex = {
        url = "https://github.com/Actuary-LLC/reverse-proxy";
        tokenFile = "/etc/nixos/actuary.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        #extraLabels = ["vpn"];
        name = "actuary";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          ];
      }; 
  };
}