# === Essential CLI Tools ===
apk add git curl make cmake
apk add htop btop bat exa procs ripgrep fzf
apk add zsh vim tmux
apk add fontconfig

# === Networking Tools ===
apk add busybox-extras ngrep netcat-openbsd socat

# === Programming Tools (Assembly, C/C++, Debuggers) ===
apk add gcc musl-dev
apk add nasm gdb
apk add python3 py3-pip npm nodejs
apk add clang clang-dev python3-dev linux-headers

wget https://go.dev/dl/go1.25.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.25.3.linux-amd64.tar.gz 
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
rm go1.25.3.linux-amd64.tar.gz
source ~/.bashrc

# apk add kubectl docker # (Optional)

# === Build and install Neovim
apk add gettext-dev
git clone https://github.com/neovim/neovim.git /tmp/neovim
cd /tmp/neovim && make && make install
cd $HOME

# === Clone LazyVim starter config ===
mkdir -p $HOME/.config/nvim
git clone https://github.com/LazyVim/starter.git $HOME/.config/nvim

# === Install Python requirements ===
pip3 install -r requirements.txt  --break-system-packages

# === Install global npm packages (used by Neovim LSP and formatters) ===
npm install -g typescript typescript-language-server prettier

# === Install Oh My Zsh ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
