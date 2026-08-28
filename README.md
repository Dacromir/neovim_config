# Introduction

This is where I keep my neovim config saved across devices.

# Requirements

## Install up-to-date neovim

Stable apt packages for neovim are significantly out of date. Instead, set up neovim to use `unstable`:

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
```

## Install `tree-sitter-cli`
- Install [Rust](https://rustup.rs/)
- Install Clang/LLVM (`sudo apt-get update; sudo apt-get install clang libclang-dev llvm`)
- Run `cargo install --locked tree-sitter-cli` ([source](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md))
