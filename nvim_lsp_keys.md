# Neovim LSP Keys Cheat Sheet


## Navigation & Code Inspectoin

| Keybind    | Action               | Description                                |
| ---------- | -------------------- | ------------------------------------------ |
| gd         | Goto Definition      | Jump to where the symbol is defined        |
| gD         | Goto Declaration     | Jump to where the symbol is declared       |
| gi         | Goto Implementation  | Jump to were the method is implemented     |
| gr         | Find References      | List uses / references of a symbol         |
| K          | Hover Docoumentatoin | Show information about the symbol          |
| <C-k>      | Show Signature       | Show function signature and args           |


## Code Actions & Refactoring

| Keybind    | Action               | Description                                |
| ---------- | -------------------- | ------------------------------------------ |
| <leader>rn | Rename Symbol        | Rename all instances of the symbol         |
| <leader>ca | Code Action          | Show available quick fixes or refactors    |
| gq or gw   | Format Code          | Format the current file or selection       |


## Diagnostics

| Keybind    | Action               | Description                                |
| ---------- | -------------------- | ------------------------------------------ |
| [d         | Previous Diagnostic  | Jump to previous error / warning           |
| ]d         | Next Diagnostic      | Jump to next error / warning               |
| <c-w>d     | Open Diagnostics     | Show information about selected diagnostic | 

