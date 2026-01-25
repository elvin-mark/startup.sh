# Update package lists
apt update

# === Essential CLI Tools ===
apt install -y \
       git curl wget zsh unzip make cmake vim tree \
       tmux htop btop jq bat ripgrep fzf neofetch

# === Networking Tools ===
apt install -y \
       ngrep netcat-openbsd socat telnet tcpdump traceroute dnsutils

# === Install Oh My Zsh ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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


# === DevOps tools ===
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mkdir -p ~/.local/bin
mv kubectl ~/.local/bin

