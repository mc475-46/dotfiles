ln -s ~/.rc_files/gemrc ~/.gemrc
ln -s ~/.rc_files/gnuplot ~/.gnuplot
ln -s ~/.rc_files/gitconfig ~/.gitconfig
ln -s ~/.rc_files/zshrc.org ~/.zshrc
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
mkdir -p ~/.vim/bundle
ln -s ~/.rc_files/vim/vimrc ~/.vim/vimrc
ln -s ~/.rc_files/vim/vimrc.plugin ~/.vim/vimrc.plugin
ln -s ~/.rc_files/vim/vimrc.local ~/.vim/vimrc.local

exit 0
