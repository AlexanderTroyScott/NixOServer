{
  config,
  pkgs,
 ...
}: {

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "AlexanderTroyScott";
    userEmail = "Alexander.Troy.Scott@gmail.com";
  };

}