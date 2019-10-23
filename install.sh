SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -s {$SCRIPT_DIR}/gemrc ~/.gemrc
echo "Successfully generating .gemrc"

ln -s {$SCRIPT_DIR}/gnuplot ~/.gnuplot
echo "Successfully generating .gnuplot"

ln -s {$SCRIPT_DIR}/gitconfig ~/.gitconfig
echo "Successfully generating .gitconfig"

ln -s {$SCRIPT_DIR}/zshrc.org ~/.zshrc
echo "Successfully generating .zshrc"

git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
echo "Successfully cloning NeoBundle"

mkdir -p ~/.vim/bundle
ln -s {$SCRIPT_DIR}/vim/vimrc ~/.vim/vimrc
ln -s {$SCRIPT_DIR}/vim/vimrc.plugin ~/.vim/vimrc.plugin
ln -s {$SCRIPT_DIR}/vim/vimrc.local ~/.vim/vimrc.local
echo "Successfully generating vim settings"

exit 0
