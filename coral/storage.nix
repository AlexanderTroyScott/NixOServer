 { config, pkgs, ... }:
{

environment.systemPackages = with pkgs; [ nfs-utils ];
boot.initrd = {
  supportedFilesystems = [ "nfs" ];
  kernelModules = [ "nfs" ];
  };

 #services.nfs.client = {
 #   enable = true;
    # You can specify additional NFS client configurations here if needed
 # };
    


fileSystems."/mnt/user/docker/volumes" = {
	device = "unraid.lan:/mnt/ssd/docker/volumes";
	fsType = "nfs4";
	neededForBoot = false;
  #automount.enable = true;
  options = [
  "nofail"
	"rw"
	"soft"
  "timeo=14"
	];
  };

fileSystems."/mnt/user/library" = {
  device = "unraid.lan:/mnt/user/library";
  fsType = "nfs4";
  neededForBoot = false;
  #automount.enable = true;
  options = [
    "x-systemd.automount" "noauto"
 "nofail"
	"rw"
	"soft"
  "sync"
	];
  };

fileSystems."/mnt/user/vault" = {
  device = "unraid.lan:/mnt/ssd/vault";
  fsType = "nfs4";
  neededForBoot = false;
  #automount.enable = true;
  options = [
    "x-systemd.automount" "noauto"
  "nofail"
	"rw"
	"soft"
  "sync"
	];
  };
fileSystems."/mnt/user/scan" = {
  device = "unraid.lan:/mnt/ssd/scan";
  fsType = "nfs4";
  neededForBoot = false;
  #automount.enable = true;
  options = [
   "x-systemd.automount" "noauto"
  "nofail"
	"rw"
	"soft"
  "sync"
	];
 };
}
