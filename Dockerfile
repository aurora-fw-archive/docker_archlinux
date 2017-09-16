FROM base/archlinux
MAINTAINER Luís Ferreira <contact@lsferreira.net>

RUN curl -o /etc/pacman.d/mirrorlist "https://www.archlinux.org/mirrorlist/?country=all&protocol=https&ip_version=6&use_mirror_status=on" && \
	sed -i 's/^#//' /etc/pacman.d/mirrorlist

ONBUILD RUN pacman-key --populate && \
	pacman-key --refresh-keys && \
	pacman -Sy --noprogressbar --noconfirm && \
	pacman -S --force openssl --noconfirm && \
	pacman -S pacman --noprogressbar --noconfirm && \
	pacman-db-upgrade && \
	pacman -Syyu --noprogressbar --noconfirmpacman -Sy --noconfirm archlinux-keyring && \
	pacman -Syyu base-devel git --noprogressbar --noconfirm