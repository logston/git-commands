#!/bin/bash

GIT_CMD_DIR="${HOME}/.git-commands"
BASH_EXPORT='export PATH="$HOME/.git-commands:$PATH"'

# Check for ~/.bash_profile file
if [ ! -f "${HOME}/.bash_profile" ]; then
    echo "Creating ~/.bash_profile file"
    touch "${HOME}/.bash_profile"
fi

# Check for line in ~/.bash_proile
grep "${BASH_EXPORT}" ~/.bash_profile > /dev/null
if [ $? -ne 0 ]; then
    echo "Installing PATH update inn ~/.bash_profile"
    echo "${BASH_EXPORT}" >> "${HOME}/.bash_profile"
fi

# Create and update .git-commands directory
if [ -d "${GIT_CMD_DIR}" ]; then
    echo "Updating command repository"
    cd ${GIT_CMD_DIR}
    git pull
    cd -
    echo "Updated complete!"

else
    echo "Installing command repository at ~/.git-commands"
    cd ${HOME}
    git clone -q https://github.com/logston/git-commands.git "${HOME}/.git-commands"
    cd -
    echo "Installation complete!"
fi
