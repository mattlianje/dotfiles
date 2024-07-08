fr() {
    local repo=$(find ~/repos/ -mindepth 1 -maxdepth 1 -type d | fzf --height 40% --border)

    if [[ -n $repo ]]; then
        repo_name=$(basename "$repo")

        if [[ -n $TMUX ]]; then
            # We're inside a tmux session, create a new window
            tmux new-window -n "$repo_name" -c "$repo"
        else
            # Outside tmux, create a new session named after the repo
            tmux new-session -d -s "$repo_name" -c "$repo"
            tmux rename-window -t "${repo_name}:0" "$repo_name"
            tmux attach-session -t "$repo_name"
        fi
    fi
}


# VIM mode ...
set -o vi

