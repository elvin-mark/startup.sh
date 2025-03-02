apk add neovim git curl zsh
apk add gcc musl-dev
apk add clang clang-dev python3 py3-pip python3-dev go npm nodejs

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p $HOME/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone https://github.com/elvin-mark/init.vim $HOME/.config/nvim
pip3 install -r requirements.txt  --break-system-packages
