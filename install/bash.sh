#!/bin/bash

GIT_CMD_DIR="${HOME}/.git-commands"
BASH_EXPORT='export PATH="$HOME/.git-commands:$PATH"'

# Check for ~/.bash_profile file
if [ ! -f "${HOME}/.bash_profile" ]; then
    touch "${HOME}/.bash_profile"
fi

# Check for line in ~/.bash_proile
exists=$(grep ${BASH_EXPORT} ~/.bash_profile | wc -l)
if [ ! ${exists} ]; then
    echo ${BASH_EXPORT} >> "${HOME}/.bash_profile"
fi

# Create and update .git-commands directory
if [ -d "${GIT_CMD_DIR}" ]; then
    cd ${GIT_CMD_DIR} && git pull && cd -

else
    cd ${HOME}
    git clone https://github.com/logston/git-commands.git
fi
