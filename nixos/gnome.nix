{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gedit
    gnome-photos
  ]) ++ (with pkgs.gnome; [
    cheese
    epiphany
    geary
    evince
    gnome-characters
    totem
    tali
    iagno
    hitori
    atomix
  ]);

  environment.systemPackages = with pkgs; [
    gnome.gnome-terminal
  ];
}
