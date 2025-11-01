if ! type "home-manager" > /dev/null; then
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install
fi

LINKS=("nvim" "hypr" "kitty" "tms")

for link in "${LINKS[@]}"
do
    rm -f $HOME/.config/$link
    ln -s $HOME/dotfiles/$link $HOME/.config/$link
done

rm -f $HOME/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
