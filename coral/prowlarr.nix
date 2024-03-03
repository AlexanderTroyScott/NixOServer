{
  users.groups.mediacenter = {};
  users.users.prowlarr = {
    isNormalUser = true;
    uid = 13006; # Specify your UID here
    home = "/home/prowlarr";
    shell = pkgs.zsh;
  };

}