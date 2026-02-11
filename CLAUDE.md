# Neovim Config

## Color Scheme

Theme: `github_dark_high_contrast` (projekt0n/github-nvim-theme)

When adding or modifying highlight groups, always use colors from this palette. Never use arbitrary colors. Pick the best matching color for the context.

| Color     | Usage                                      |
|-----------|--------------------------------------------|
| `#0d1f3c` | Dark background (cursor, subtle surfaces)  |
| `#162030` | Mid background (context blocks, overlays)  |
| `#1a3a5c` | Light background (references, selections)  |
| `#58a6ff` | Accent blue (separators, line numbers, UI) |
| `#c9d1d9` | Primary text                               |

All custom highlights live in `lua/plugins/colorscheme.lua` inside `apply_highlights()`. Add new overrides there to keep them centralized and to survive colorscheme reloads.
