ln -s ~/.rc_files/gemrc ~/.gemrc
echo "Successfully generating .gemrc"
ln -s ~/.rc_files/gnuplot ~/.gnuplot
echo "Successfully generating .gnuplot"
ln -s ~/.rc_files/gitconfig ~/.gitconfig
echo "Successfully generating .gitconfig"
ln -s ~/.rc_files/zshrc.org ~/.zshrc
echo "Successfully generating .zshrc"
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
echo "Successfully cloning NeoBundle"
mkdir -p ~/.vim/bundle
ln -s ~/.rc_files/vim/vimrc ~/.vim/vimrc
ln -s ~/.rc_files/vim/vimrc.plugin ~/.vim/vimrc.plugin
ln -s ~/.rc_files/vim/vimrc.local ~/.vim/vimrc.local
echo "Successfully generating vim settings"

exit 0
