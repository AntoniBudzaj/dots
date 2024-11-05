if status is-interactive
  set -g fish_greeting
  starship init fish | source
zoxide init fish | source

end

source "$HOME/.cargo/env.fish"
fish_add_path /home/antek/.spicetify

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
