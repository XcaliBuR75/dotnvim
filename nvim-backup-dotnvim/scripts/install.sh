printf "\n------------------------- Install Dependencies -------------------------\n"
sudo apt install -y git curl gcc python3-pip cmake ripgrep python-is-python3 > /dev/null

if ! command -v nvim &> /dev/null
then
    printf "\n------------------------- Install Neovim -------------------------\n"
    sudo curl -o /usr/bin/nvim -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage > /dev/null
    sudo chmod a+x /usr/bin/nvim > /dev/null
fi

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
if ! command -v node &> /dev/null
then
    printf "\n------------------------- Install NodeJS-------------------------\n"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - > /dev/null
    sudo apt install -y nodejs > /dev/null
fi

if ! command -v yarn &> /dev/null
then
    printf "\n------------------------- Install Yarn --------------------------\n"
    sudo npm install --global yarn > /dev/null
    yarn global add stylefmt
fi

if [ -d $HOME/.config/nvim ];
then
    printf "\n------------------------- Backup existing config --------------------------\n"
    mv  ~/.config/nvim ~/.config/nvim-bak > /dev/null
fi

printf "\n------------------------- Download s1n7ax neovim config --------------------------\n"
git clone --recurse-submodules -j8 https://github.com/s1n7ax/dotnvim.git ~/.config/nvim > /dev/null

if [ ! -d $HOME/.fonts/CascadiaCode ]; then
    printf "\n------------------------- Install nerdfont --------------------------\n"

    TEMP_NAME=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; printf '')
    TEMP_DIR="/tmp/$TEMP_NAME"
    mkdir $TEMP_DIR
    curl -o "$TEMP_DIR/CascadiaCode.zip" -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip > /dev/null
    unzip "$TEMP_DIR/CascadiaCode.zip" -d "$TEMP_DIR/CascadiaCode" > /dev/null
    mkdir -p ~/.fonts > /dev/null
    mv "$TEMP_DIR/CascadiaCode" ~/.fonts/ > /dev/null
fi


printf "\n------------------------- Setting up Java --------------------------\n"
TEMP_DIR="$(mktemp -d)"

cd $TEMP_DIR

git clone https://github.com/microsoft/java-debug.git
git clone https://github.com/microsoft/vscode-java-test.git

cd java-debug
chmod u+x mvnw
./mvnw clean install
mkdir -p ~/.local/share/nvim/lsp_server_additions/jdtls
cp com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar ~/.local/share/nvim/lsp_server_additions/jdtls
cd ..

cd vscode-java-test
yarn
yarn build-plugin
cp server/*.jar ~/.local/share/nvim/lsp_server_additions/jdtls
cd ../..

rm -rf $TEMP_DIR
