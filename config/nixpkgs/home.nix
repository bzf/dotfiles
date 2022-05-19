{ config, pkgs, ... }:

{
  nixpkgs.overlays = import ./overlays.nix;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "andreligne";
  home.homeDirectory = "/home/andreligne";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
    pkgs.rbenv
    pkgs.ruby-build
    pkgs.fzf
    pkgs.rustup
    pkgs.autojump
    pkgs.tmux
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "André Ligné";
      init.defaultBranch = "main";
      alias.pf = "push --force-with-lease";
      alias.pr = "pull --rebase";
      push.default = "current";
      rebase.autoStash = true;
      rebase.autosquash = true;
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
}
