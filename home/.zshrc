if [ -d "$HOME/.zsh.d" ]; then
    for f in `find "$HOME/.zsh.d" -follow -name "rc-*" | sort`; do
        source $f
    done
fi

# GitHub
# [Must] Override in .zshrc.local to use GitHub
export GIT_COMMITTER_NAME=""
export GIT_COMMITTER_EMAIL=""
export GIT_AUTHOR_NAME=""
export GIT_AUTHOR_EMAIL=""

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
