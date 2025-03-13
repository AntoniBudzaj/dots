if status is-interactive
  set -g fish_greeting
  starship init fish | source
zoxide init fish | source

end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH $HOME/.config/rofi/scripts $PATH

alias zen='flatpak run io.github.zen_browser.zen'
alias vim='nvim'

# pnpm
set -gx PNPM_HOME "/home/antek/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
