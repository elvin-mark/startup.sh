# === Essential CLI Tools ===
pacman -Syu git curl wget zsh make cmake vim unzip
pacman -Syu fastfetch htop btop bat jq fzf tree
pacman -Syu ripgrep tmux eza

# === Networking Tools ===
pacman -Syu ngrep socat inetutils nmap tcpdump

# === Programming Tools (Assembly, C/C++, Debuggers) ===
pacman -Syu nasm gcc gdb clang

# === Programming Languages & Runtimes ===
pacman -Syu python python-pip go npm nodejs

# === Build and install Neovim
# git clone https://github.com/neovim/neovim.git /tmp/neovim
# cd /tmp/neovim && make && make install
# cd $HOME

# === Install Neovim 0.11.3 (from GitHub release) ===
wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 nvim && mv nvim /opt/
ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

# === Clone LazyVim starter config ===
mkdir -p $HOME/.config/nvim
git clone https://github.com/LazyVim/starter.git $HOME/.config/nvim

# === Install Python requirements ===
pip3 install -r requirements.txt  --break-system-packages

# === Install global npm packages (used by Neovim LSP and formatters) ===
npm install -g typescript typescript-language-server prettier

# === Install Oh My Zsh ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
