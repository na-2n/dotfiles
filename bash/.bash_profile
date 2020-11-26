# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
    . ~/.bashrc
fi

export EDITOR=nvim

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH=$PATH:/home/yui/.dvm/sym
export PATH=$PATH:/home/yui/.gem/ruby/2.5.0/bin
export PATH=$PATH:/home/yui/.yarn/bin
export PATH=$PATH:/home/yui/.local/bin

export NVM_DIR="/home/yui/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ESP_DIR="/home/yui/.espressif"

function source-idf {
    [ -s "$ESP_DIR/esp-idf/export.sh" ] && . "$ESP_DIR/esp-idf/export.sh"
}

