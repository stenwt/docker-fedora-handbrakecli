FROM fedora:latest

RUN dnf -y install python3-dnf-plugins-core && dnf config-manager --add-repo=http://negativo17.org/repos/fedora-multimedia.repo && dnf -y install HandBrake-cli && dnf clean all

WORKDIR /tmp/handbrake

ENTRYPOINT ["HandBrakeCLI"]

# add these to ~/.bashrc for shortcut power
# function handbrake { sudo docker run -i --privileged -v=$(pwd):/tmp/handbrake handbrakecli $* ; }
# function rip-dvd { handbrake --preset-import-file ~/.dotfiles/roku.plist -i /dev/sr0 -o $1.mp4 -N eng --subtitle-burned ; }
