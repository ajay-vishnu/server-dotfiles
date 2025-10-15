sudo apt update && sudo apt upgrade -y

# add wezterm repo to apt
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Setup for docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update

sudo apt install $(awk '{print $1}' packages.txt | tr '\n' ' ')

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

# Download, Build and Install Mold which is a faster unix linker compared to lldb
git clone --branch stable https://github.com/rui314/mold.git
cd mold
sudo ./install-build-deps.sh
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ -B build
cmake --build build -j$(nproc)
sudo cmake --build build --target install
cd ..

go install -x github.com/jesseduffield/lazygit
go install -x github.com/jesseduffield/lazydocker

# install gitmoji-cli
npm i -g gitmoji-cli

cargo install --force --git https://github.com/sxyazi/yazi.git yazi-build yazi-cli yazi-fm
cargo install --git https://github.com/neovide/neovide.git
cargo install --git https://github.com/linebender/resvg.git resvg
cargo install eza
cargo install --git zoxide --locked
cargo install tree-sitter-cli

ya pack -a Rolv-Apneseth/starship
ya pack -a yazi-rs/plugins:smart-enter
ya pack -a yazi-rs/plugins:full-border
ya pack -a yazi-rs/plugins:what-size
ya pack -a yazi-rs/plugins:toggle-pane

go install -x github.com/jesseduffield/lazydocker
go install -x github.com/jesseduffield/lazygit

git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git
sudo cp *.otf /usr/share/fonts/opentype/sfmono-nerd-font-ligaturized
yes | rm -r SFMono-Nerd-Font-Ligaturized

stow lazydocker
stow lazygit
stow nvim
stow starship
stow tmux
stow wezterm
stow yazi
stow zsh
