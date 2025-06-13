if [ ! -d .git ]; then
  echo -e "\033[31m"
  echo "  ╭───────────────────────╮"
  echo "  │                       │"
  echo "  │   🚫 Git-free zone!   │"
  echo "  │   (╯°□°)╯︵ ┻━┻       │"
  echo "  │                       │"
  echo "  │  Run:                 │"
  echo "  │  git init             │"
  echo "  │  to plant a repo 🌱   │"
  echo "  │                       │"
  echo "  ╰───────────────────────╯"
  echo -e "\033[0m"
else
  echo "This directory is already a Git repository!"
fi
