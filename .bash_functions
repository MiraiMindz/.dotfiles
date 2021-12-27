function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

function initgit() {
    git init -b main && git add . && git commit -m "First commit" && git remote add origin "$1" && git remote -v && git push origin main
}
