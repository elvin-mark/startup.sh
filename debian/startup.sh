# Update package lists
apt update

# === Essential CLI Tools ===
apt install -y \
       git curl wget zsh unzip make cmake vim tree \
       tmux htop btop jq bat ripgrep fzf neofetch

# === Networking Tools ===
apt install -y \
       ngrep netcat-openbsd socat telnet tcpdump traceroute dnsutils

# === Programming Tools (Assembly, C/C++, Debuggers) ===
apt install -y \
       nasm gcc gdb clang-format clangd \
       python3 python3-pip python3-venv \

curl -fsSL https://bun.sh/install | bash

wget https://go.dev/dl/go1.25.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.25.3.linux-amd64.tar.gz 
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
rm go1.25.3.linux-amd64.tar.gz
source ~/.bashrc

# === Install Neovim 0.11.3 (from GitHub release) ===
wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 nvim && mv nvim /opt/
ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

# === Clone LazyVim starter config ===
mkdir -p $HOME/.config/nvim
git clone https://github.com/LazyVim/starter.git $HOME/.config/nvim

# === Install Oh My Zsh ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
