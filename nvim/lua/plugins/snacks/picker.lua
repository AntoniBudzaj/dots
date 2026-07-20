return {
  enabled = true,
  sources = {
    files = {
      ignored = true,
      hidden = false
    }
  },
  matcher = {
    fuzzy = true,          -- use fuzzy matching
    smartcase = true,      -- use smartcase
    ignorecase = true,     -- use ignorecase
    sort_empty = false,    -- sort results when the search string is empty
    filename_bonus = true, -- give bonus for matching file names (last part of the path)
    file_pos = true,       -- support patterns like `file:line:col` and `file:line`
    cwd_bonus = false,     -- give bonus for matching files in the cwd
    frecency = false,      -- frecency bonus
    history_bonus = false, -- give more weight to chronological order
  },
}
