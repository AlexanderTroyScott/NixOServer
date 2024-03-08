{
fileSystems."/home/Unraid/Media" = {
  device = "unraid.lan:/mnt/user/Media";
  fsType = "nfs";
  neededForBoot = false;
  #automount.enable = true;
  options = [
  "nofail"
	"rw"
	"hard"
	"intr"
	];
  };

}