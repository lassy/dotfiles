if [ -d "$HOME/.zsh.d" ]; then
    for f in `find "$HOME/.zsh.d" -follow -name "rc-*" | sort`; do
        source $f
    done
fi

# GitHub
export GIT_COMMITTER_NAME=""
export GIT_AUTHOR_NAME=""
export EMAIL=""
