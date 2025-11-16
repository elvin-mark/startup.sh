# Update package lists
dnf update

# === Essential CLI Tools ===
dnf install -y \
       git curl zsh make vim unzip tree wget \
       tmux btop htop jq bat \
       ripgrep fastfetch fzf procps

# === Networking Tools ===
dnf install -y \
       ngrep nc socat telnet tcpdump traceroute dnsutils iputils

# === Programming Tools (Assembly, C/C++, Debuggers) ===
dnf install -y \
       nasm gcc gdb

# === Programming Languages & Runtimes ===
dnf install -y \
       python3 python3-pip \
       golang \
       npm nodejs

# === Install uemacs ===
git clone https://github.com/torvalds/uemacs.git /tmp/uemacs
make -C /tmp/uemacs install
rm -r /tmp/uemacs

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
