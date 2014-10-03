if [ -d "$HOME/.zsh.d" ]; then
    for f in `find "$HOME/.zsh.d" -follow -name "rc-*" | sort`; do
        source $f
    done
fi
