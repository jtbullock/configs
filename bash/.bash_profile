# Function to get Git branch and status
git_prompt_info() {
    # Check if we're inside a Git repo
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        
        # Check if there are uncommitted changes
        if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
            local dirty="*"
        else
            local dirty=""
        fi

        echo "($branch$dirty) "
    fi
}

PS1='\[\e[35m\][\u@\h] [\w] \[\e[36m\]$(git_prompt_info)\[\e[0m\]'

eval "$(/opt/homebrew/bin/brew shellenv)"

alias sbcl="rlwrap sbcl"
alias lisp="rlwrap sbcl"

alias lsl="ls -lh"
alias lsd="ls -tlh"

if which luaver > /dev/null; then . `which luaver`; fi

#[ -s "$HOME/.luaver/luaver" ] && . "$HOME/.luaver/luaver"

#eval "$(luarocks path)"
