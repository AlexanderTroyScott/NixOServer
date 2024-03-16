{
fileSystems."/mnt/user/Media" = {
  device = "unraid.lan:/mnt/user/Media";
  fsType = "nfs";
  neededForBoot = false;
  #automount.enable = true;
  options = [
  "nofail"
  "sec=sys"
  "rw"
  "insecure"
  "anongid=100"
  "anonuid=99"
  "no_root_squash"
	];
  };
fileSystems."/mnt/user/services/authentik" = {
  device = "unraid.lan:/mnt/user/services/authentik";
  fsType = "nfs";
  neededForBoot = false;
  #automount.enable = true;
  options = [
  "nofail"
	"rw"
	"hard"
	];
  };
fileSystems."/mnt/user/services/servarr" = {
  device = "unraid.lan:/mnt/user/services/servarr";
  fsType = "nfs";
  neededForBoot = false;
  #automount.enable = true;
  options = [
  "nofail"
	"rw"
	"hard"
	];
  };
}