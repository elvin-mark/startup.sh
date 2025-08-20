# Update package lists
apt update

# === Essential CLI Tools ===
apt install -y \
       git curl zsh make vim unzip tree wget \
       tmux cmus w3m btop htop jq bat \
       ripgrep

# === Networking Tools ===
apt install -y \
       ngrep netcat-openbsd socat telnet tcpdump traceroute dnsutils

# === Programming Tools (Assembly, C/C++, Debuggers) ===
apt install -y \
       nasm gcc gdb clang-format clangd python3-venv

# === Programming Languages & Runtimes ===
apt install -y \
       python3 python3-pip \
       golang \
       npm nodejs

# === Install Neovim 0.11.3 (from GitHub release) ===
wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 nvim && mv nvim /opt/
ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

# === Create Neovim config directory ===
mkdir -p $HOME/.config/nvim

# === Install vim-plug (plugin manager for Neovim) ===
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# === Clone personal Neovim config ===
git clone https://github.com/elvin-mark/init.vim $HOME/.config/nvim

# === Install Python requirements ===
pip3 install -r requirements.txt  --break-system-packages

# === Install global npm packages (used by Neovim LSP and formatters) ===
npm install -g typescript typescript-language-server prettier

# === Install Oh My Zsh ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
