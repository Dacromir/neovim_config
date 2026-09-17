#!/bin/bash
### Install neovim ###
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim 

### Install Dependencies ###
# Treesitter
sudo apt install clang libclang-dev llvm
# Python LSPs
sudo apt install python3-full
# Telescope
sudo apt install ripgrep fd-find

### Install command-line tools ###
# Treesitter CLI
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked tree-sitter-cli
