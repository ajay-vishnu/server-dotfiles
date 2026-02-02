sudo apt update && sudo apt upgrade -y

# add wezterm repo to apt
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Setup for docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# add cloudflare repo and key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

sudo apt update

sudo apt install $(awk '{print $1}' ./initialize/packages.txt | tr '\n' ' ')

# Install rust and temporarily export cargo path
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
export PATH=$PATH:$HOME/.cargo/bin

# Install xh http client and starship
curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
curl -sS https://starship.rs/install.sh | sh

# Install git-delta
GIT_DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*')
curl -Lo delta.tar.gz "https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VERSION}/delta-${GIT_DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
tar -xf delta.tar.gz "delta-${GIT_DELTA_VERSION}-x86_64-unknown-linux-gnu/git-delta" -O >./git-delta
sudo install git-delta -D -t /usr/local/bin/
rm "delta-${GIT_DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz" git-delta

# Install the latest version of go
GO_VERSION=$(curl -s "https://go.dev/dl/?mode=json" | jq -r '.[0].version')
curl -Lo go.tar.gz "https://go.dev/dl/$GO_VERSION.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz

# Install the latest version of neovim
NVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/relases/latest" | \grep -Po '"tag_name": *"\K[^"]*')
curl -Lo nvim.tar.gz "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.tar.gz"
sudo tar -C /opt/ -xzf nvim.tar.gz
rm nvim.tar.gz

# Download, Build and Install Mold which is a faster unix linker compared to lldb
(
    git clone --branch stable https://github.com/rui314/mold.git
    cd mold || return
    sudo ./install-build-deps.sh
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ -B build
    cmake --build build "-j$(nproc)"
    sudo cmake --build build --target install
    rm -r mold
    printf '[target.x86_64-unkown-linux-gnu]\nrustflags = ["-C", "linker=clang", "-C", "link-arg=-fuse-ld=/usr/bin/mold"]' >~/.cargo/config.toml
)

# install gitmoji-cli
npm i -g gitmoji-cli

export PATH=$PATH:$HOME/.cargo/bin:/usr/local/go/bin
export GOPATH=$HOME/.local/share/go

cargo install eza --locked
cargo install jaq --locked
cargo install --git https://github.com/neovide/neovide.git
cargo install --git https://github.com/linebender/resvg.git resvg
cargo install tree-sitter-cli --locked
cargo install --force --git https://github.com/sxyazi/yazi.git yazi-build
cargo install zoxide --locked

ya pkg add Rolv-Apneseth/starship
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:full-border
ya pkg add yazi-rs/plugins:what-size
ya pkg add yazi-rs/plugins:toggle-pane

go install -x github.com/jesseduffield/lazydocker@latest
go install -x github.com/jesseduffield/lazygit@latest
go install -x github.com/junegunn/fzf@latest

(
    git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git
    sudo mkdir /usr/share/fonts/opentype/sfmono-nerd-font-ligaturized
    sudo cp ./SFMono-Nerd-Font-Ligaturized/*.otf /usr/share/fonts/opentype/sfmono-nerd-font-ligaturized
    yes | rm -r SFMono-Nerd-Font-Ligaturized
)

stow lazydocker
stow lazygit
stow nvim
stow starship
stow tmux
stow wezterm
stow yazi
stow zsh
