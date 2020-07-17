# Git Commands

Commands to make the git workflow easier.

## What is this?

Installation of this repo adds the following commands to your already installed git command:

- flush - throw away everything in the working directory and revert to the last commit at HEAD
- prune
    - merged - remove all local branches that have been merged remotely
    - local - remove local remote/\* branches that have been delete from origin
- test-commands - Test that this library is installed correctly

Example usage:

```
$ git prune merged
```

## Installation and Updating


```bash
curl -s https://raw.githubusercontent.com/logston/git-commands/master/install/bash.sh | bash
```

## Removal

Remove the `export PATH="$HOME/.git-commands:$PATH"` from your `~/.bash_profile` file.
Then delete the `~/.git-commands` directory.

## Why not a pre-commit hook? Or something built into one of the many hook managers?

These commands are not something you'll always want to run before/at/after each commit. Also,
there is not a clear option out of the exiting Git hooks which would suite these commands best.
