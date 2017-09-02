.PHONY: i3 xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm -S

installi3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm -S

installdev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm -S

i3:
	$(stow) urxvt
	$(stow) termite
	xrdb ~/.Xresources
	$(stow) fish
	$(stow) i3
	$(stow) polybar
	$(stow) compton
	$(stow) keyboard
	$(stow) easystroke

xfce:
	$(stow) xfce4

pre-install:
	sudo apt install stow
