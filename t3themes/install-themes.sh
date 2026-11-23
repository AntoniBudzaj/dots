#!/usr/bin/env bash
# install-themes.sh — put the T3 Code themes from this folder into T3's themes dir.
#
#   ./install-themes.sh            link T3's themes dir to this folder (edits stay in sync)
#   ./install-themes.sh --copy     copy the theme files instead of linking
#   ./install-themes.sh -f         replace an existing themes dir/link (a real dir is moved to a .bak-<time> copy)
#   ./install-themes.sh -n         dry run, change nothing
#   ./install-themes.sh -h         help
#
# T3's themes dir: $T3_THEMES_DIR, else ~/.t3/userdata/themes
# A theme = <id>.json plus an optional <id>.png/.jpg/.webp background with the same id.
# Linux/macOS (bash). Afterwards pick the theme in T3, e.g. "tokyo-night".
set -euo pipefail

mode=link force=0 dry=0
for arg in "$@"; do
  case $arg in
    --copy)       mode=copy ;;
    -f|--force)   force=1 ;;
    -n|--dry-run) dry=1 ;;
    -h|--help)    sed -n '2,12p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "unknown option: $arg (try -h)" >&2; exit 2 ;;
  esac
done

src=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
dst=${T3_THEMES_DIR:-$HOME/.t3/userdata/themes}

run() { if (( dry )); then echo "  [dry-run] $*"; else "$@"; fi; }

shopt -s nullglob
files=("$src"/*.json "$src"/*.png "$src"/*.jpg "$src"/*.jpeg "$src"/*.webp)
(( ${#files[@]} )) || { echo "no theme files found in $src" >&2; exit 1; }

# already the same place? (dst is a link to this folder, or this folder IS dst)
if [[ -e $dst && $(realpath "$dst") == "$src" ]]; then
  echo "Already in place: $dst -> $src"
  printf '  %s\n' "${files[@]##*/}"
  exit 0
fi

run mkdir -p "$(dirname "$dst")"

if [[ $mode == copy ]]; then
  if [[ -L $dst ]]; then
    (( force )) || { echo "$dst is a symlink to $(readlink "$dst"); use -f to replace it with a real folder." >&2; exit 1; }
    run rm "$dst"
  fi
  run mkdir -p "$dst"
  (( dry )) || echo "Copying themes to $dst"
  for f in "${files[@]}"; do run cp -v -- "$f" "$dst/"; done
else
  if [[ -L $dst ]]; then
    (( force )) || { echo "$dst already links to $(readlink "$dst"); use -f to repoint it here." >&2; exit 1; }
    run rm "$dst"
  elif [[ -d $dst ]]; then
    if [[ -z $(ls -A "$dst") ]]; then
      run rmdir "$dst"
    else
      (( force )) || { echo "$dst already has files. Use --copy to add the themes next to them, or -f to back it up and link." >&2; exit 1; }
      bak="$dst.bak-$(date +%Y%m%d-%H%M%S)"
      echo "Backing up existing folder to $bak"
      run mv "$dst" "$bak"
    fi
  elif [[ -e $dst ]]; then
    echo "$dst exists and is not a folder." >&2; exit 1
  fi
  run ln -s "$src" "$dst"
  (( dry )) || echo "Linked $dst -> $src"
fi

echo "Themes available:"; printf '  %s\n' "${files[@]##*/}"
(( dry )) && echo "(dry run, nothing changed)" || echo "Done. Select the theme in T3 (or restart T3 if it doesn't show up)."
