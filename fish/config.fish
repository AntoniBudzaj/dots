if status is-interactive
  set -g fish_greeting
zoxide init fish | source
oh-my-posh init fish --config ~/.config/fish/tokyonight.omp.json | source

end

function sshetc --description 'ssh to etc-server'
  ssh -p 2222 etc-server/user@192.168.1.52
end

alias zen='flatpak run io.github.zen_browser.zen'
alias vim='nvim'
alias zed='flatpak run dev.zed.Zed'

# pnpm
set -gx PNPM_HOME "/home/antek/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
