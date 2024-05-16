{ config, pkgs, ... }:

{

  fileSystems."/mnt/user/services/plex" = {
  device = "unraid.lan:/mnt/user/services/plex";
  fsType = "nfs";
  neededForBoot = false;
  options = [
  "nofail"
	"rw"
	"hard"
	];
  };

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
    version = "1.40.1.8227-c0dd5a73e";
    src = pkgs.fetchurl {
      url = "https://downloads.plex.tv/plex-media-server-new/${version}/debian/plexmediaserver_${version}_amd64.deb";
      sha1 = "73ace82400e7449e0f8d74ec5bb477109b5b2edb";
    };
  });
  }; 
  in {
    enable = true;
    openFirewall = true;
    user = "actuary";
    dataDir = "/mnt/user/services/plex";
    package = plexpass;
  };
  #services.tautulli.enable = true;

}