#!/bin/bash
# Install latest version of neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# Install Dependencies
sudo apt install neovim clang libclang-dev llvm python3-full ripgrep fd-find

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Tree Sitter
cargo install --locked tree-sitter-cli
