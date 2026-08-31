#!/bin/bash
# Install latest version of neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Clang + LLVM
sudo apt-get update; sudo apt-get install clang libclang-dev llvm

# Install Tree Sitter
cargo install --locked tree-sitter-cli
