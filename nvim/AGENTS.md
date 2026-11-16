# Konfiguracja Neovim

Neovim 0.12+, bez lazy.nvim: pluginy instaluje wbudowany `vim.pack`, LSP konfiguruje natywne `vim.lsp.config` / `vim.lsp.enable`. Repo gita to całe `~/.config`, ten katalog to `nvim/`.

## Kolejność ładowania

`init.lua` → `lua/config/init.lua`, które ładuje po kolei:

1. `config.autocmds`, `config.cmds`, `config.diagnostics` (pusty)
2. `config.lsp` – ustawienia serwerów + autocmd `LspAttach`
3. `config.options` – tu ustawiany jest `mapleader` (spacja)
4. `plugins.init` – wszystkie pluginy
5. `config.keymaps` – wymaga już załadowanych pluginów (telescope, snacks, cokeline, conform, spectre)
6. `config.theme`

## Układ katalogów

| Ścieżka | Zawartość |
| --- | --- |
| `lua/config/` | opcje, keymapy, autocmdy, wspólna logika LSP |
| `lua/lsp/<serwer>.lua` | ustawienia jednego serwera przez `vim.lsp.config(...)` |
| `lua/plugins/<plugin>.lua` | jeden plik na plugin: `vim.pack.add` + `setup` |
| `lua/plugins/init.lua` | lista `require` pluginów – nowy plik trzeba tu dopisać |
| `lua/snippets/` | własne snippety |
| `nvim-pack-lock.json` | lockfile `vim.pack` (commitowany) |

## LSP

- Serwery instaluje Mason (`lua/plugins/mason.lua`, lista `ensure_installed`), a `mason-lspconfig` włącza je automatycznie (`automatic_enable`). Nie trzeba wołać `vim.lsp.enable` ręcznie.
- Domyślne `cmd` / `filetypes` / `root_dir` pochodzą z `nvim-lspconfig`. Pliki w `lua/lsp/` tylko nadpisują to, co potrzebne (zwykle `settings`).
- Każdy plik z `lua/lsp/` musi być dopisany jako `require` na górze `lua/config/lsp.lua`.
- C# to wyjątek: obsługuje go `seblyng/roslyn.nvim` (`lua/plugins/roslyn.lua`), a `roslyn_ls` z lspconfig jest wykluczony z `automatic_enable`.
- `vtsls` jest konfigurowany w dwóch plikach (`lsp/vtsls.lua` i `lsp/vue.lua`); `vim.lsp.config` scala tabele, ale listy (`filetypes`, `globalPlugins`) są zastępowane przez później załadowany plik.
- Wspólne zachowanie po podpięciu serwera (inlay hints pod `<leader>li`, kolory dokumentu) jest w autocmd `LspAttach` w `lua/config/lsp.lua`.

## Dodawanie języka

1. `lua/plugins/mason.lua` – serwer do `ensure_installed`.
2. `lua/lsp/<serwer>.lua` z ustawieniami + `require` w `lua/config/lsp.lua` (tylko jeśli domyślne nie wystarczą).
3. `lua/plugins/conform.lua` – formatter w `formatters_by_ft`.
4. `lua/plugins/treesitter.lua` – parser w `langs` (ta lista ustawia też filetype'y, dla których startuje podświetlanie i indent).

## Pozostałe

- Uzupełnianie: `blink.cmp` (`lua/plugins/blink-cmp.lua`). `lua/plugins/nvim-cmp.lua` istnieje, ale nie jest ładowany.
- Formatowanie: `conform.nvim` z `lsp_format = "fallback"`, wywoływane keymapą z `lua/config/keymaps.lua`.
- Narzędzia spoza Masona brane z systemu (Arch): `rustfmt`, `cargo clippy`, `prettier`, `stylua`.

## Sprawdzanie zmian

Test bez UI: `nvim --headless <plik> -c 'lua vim.defer_fn(function() ... vim.cmd("qa!") end, <ms>)'` i wypisanie `vim.lsp.get_clients({ bufnr = 0 })` oraz `require("conform").list_formatters(0)`. Serwery potrzebują kilku sekund na start (rust-analyzer dłużej).
