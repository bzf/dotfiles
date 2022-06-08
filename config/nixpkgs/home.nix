{ config, pkgs, stdenv, ... }:

let
  name = "André Ligné";
  username = "andreligne";
  homeDirectory =
    if pkgs.stdenv.isDarwin then
      "/Users/${username}"
    else
      "/home/${username}";
in
{
  nixpkgs.overlays = import ./overlays.nix;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = homeDirectory;

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
    pkgs.neovim
    pkgs.rbenv
    pkgs.ruby-build
    pkgs.rustup
    pkgs.rcm
    pkgs.ripgrep
    pkgs.solargraph
    pkgs.rust-analyzer
    pkgs.nodePackages.typescript-language-server
    pkgs.elmPackages.elm-language-server
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
      user.name = name;
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

  programs.tmux = {
    enable = true;

    baseIndex = 1;
    escapeTime = 10;
    keyMode = "vi";

    extraConfig = ''
      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l

      bind-key - split-window -v -c "#{pane_current_path}"
      bind-key \\ split-window -h -c "#{pane_current_path}"
      bind-key c new-window -c "#{pane_current_path}"
      bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded!"

      set -g renumber-windows on

      set -g status-style bg=colour240,fg=colour223
    '';
  };

  programs.zsh = {
    enable = true;

    enableCompletion = false;
    completionInit = true;
    defaultKeymap = "emacs";

    history = {
      path = "~/.zsh_history";
      size = 20000;
      save = 20000;
    };

    shellAliases = {
      ".." = "cd ..";
      vim = "nvim";
      be = "bundle exec";
    };

    initExtra = ''
      function g() {
        if [ "$#" -eq 0 ]; then
          git status
        else
          git "$@"
        fi
      }

      if [ -d "$HOME/.volta/" ]; then
        export PATH="$PATH:$HOME/.volta/bin"
      fi

      eval "$(rbenv init -)"
    '';

    envExtra = ''
      export EDITOR=nvim
      export PATH="$PATH:$HOME/.bin"
      export PATH="$PATH:$HOME/.local/bin"

      . "$HOME/.nix-profile/etc/profile.d/nix.sh"
    '';
  };

  programs.autojump.enable = true;
  programs.fzf.enable = true;
}
