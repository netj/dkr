# `dkr` — Docker CLI shorthands

## Synopsis

```bash
eval $(dkr choose)
dkr tmux
dkr hack RUN ps axf
dkr hack RUN-ti vim

eval $(dkr run ubuntu)
dkr tame
dkr tmux
dkr rm
```

### Shorthands

* `dkr tmux [CONTAINER]`
    Launches TMUX in your container.

* `dkr tame [CONTAINER]`
    Tames your container, installing TMUX and other essential goodies.

* `dkr run [REPO[:TAG]]`
    Starts a new container of an image.
* `dkr rm [CONTAINER]`
    Kills and removes running containers.


## Installation

```bash
git clone https://github.com/netj/dkr.git
echo export PATH="'$PWD/dkr/bin'"':"$PATH"' >>~/.bash_profile
```


## Customization

One can put something like below in their `~/.dkrrc`:

```bash
: ${DKR_USER:=$USER}  # run commands in containers as the same $USER as host

# custom taming for APT-based containers
: ${DKR_TAME_APT_SOURCE:=http://debian.stanford.edu}
: ${DKR_TAME_APT_PACKAGES:="
        curl
        make
    "}

# custom taming for Linux containers
dkr-tame-Linux() {
    # install netj's dotfiles
    RUN-uti bash -c 'bash <(u=git.io/netj.files; curl -fsSL $u || wget -nv -O- $u)'
}
```
