## homedir

Files from my home directory (work, laptop and shared hosting).

## Installation

**Please note** that this is code is only intended for reference. There's
probably no point in you actually cloning this repository and using it on
your own system (unless you're me.)

If you do want to use it anyway, **please create a fork** before making
any significant changes. If you're crazy enough to use my stuff as-is, this
is how to do it:

    git clone git://github.com/hmans/homedir.git
    cd homedir
    ./install.sh

Please note that running `install.sh` will create stuff in your actual home directory.
In case of file name collisions, existing files will be renamed, existing symlinks will be removed.
