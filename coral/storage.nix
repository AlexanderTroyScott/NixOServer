 { config, pkgs, ... }:
{

environment.systemPackages = with pkgs; [ nfs-utils ];
boot.initrd = {
  supportedFilesystems = [ "nfs" ];
  kernelModules = [ "nfs" ];
  };
fileSystems."/mnt/user/docker/volumes" = {
  device = "unraid.lan:/mnt/user/docker/volumes/";
  fsType = "nfs4";
  neededForBoot = false;
  #automount.enable = true;
  options = [
  "nofail"
	"rw"
	"hard"
  "sync"
	];
  };

fileSystems."/mnt/user/library" = {
  device = "unraid.lan:/mnt/user/library";
  fsType = "nfs4";
  neededForBoot = false;
  #automount.enable = true;
  options = [
 "nofail"
	"rw"
	"hard"
  "sync"
	];
  };

fileSystems."/mnt/user/vault" = {
  device = "unraid.lan:/mnt/user/vault";
  fsType = "nfs4";
  neededForBoot = false;
  options = [
  "nofail"
	"rw"
	"hard"
  "sync"
	];
  };
fileSystems."/mnt/user/scan" = {
  device = "unraid.lan:/mnt/user/scan";
  fsType = "nfs4";
  neededForBoot = false;
  options = [
  "nofail"
	"rw"
	"hard"
  "sync"
	];
 };
}
