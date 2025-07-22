# add rust repo to apt
curl -fsSL https://apt.cli.rs/pubkey.asc | sudo tee -a /usr/share/keyrings/rust-tools.asc
curl -fsSL https://apt.cli.rs/rust-tools.list | sudo tee /etc/apt/sources.list.d/rust-tools.list

sudo apt update

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# install gitmoji-cli
npm i -g gitmoji-cli

cargo install --git https://github.com/sxyazi/yazi.git yazi-cli yazi-fm
cargo install --git https://github.com/neovide/neovide.git
cargo install --git https://github.com/linebender/resvg.git resvg

ya pack -a Rolv-Apneseth/starship
ya pack -a yazi-rs/plugins:smart-enter
ya pack -a yazi-rs/plugins:full-border
ya pack -a yazi-rs/plugins:what-size
ya pack -a yazi-rs/plugins:toggle-pane

go install -x github.com/jesseduffield/lazydocker
