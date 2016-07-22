# ~/.zshrc
# ------------------------------------------------------------------------------
autoload -U colors zsh-mime-setup select-word-style
colors                 # Colors.
zsh-mime-setup         # Run everything as if it's an executable.
select-word-style bash # Ctrl+W on words.

# VCS 
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%c%{$fg[green]%}%u%{$reset_color%} [%{$fg[red]%}%b%{$reset_color%}] %{$fg[yellow]%}%s%{$reset_color%}:%r"
precmd() {  # Run before each prompt.
    vcs_info
}

# Prompt
setopt PROMPT_SUBST     # Allow funky stuff in prompt.

color="green"
if [ "$USER" = "root" ]; then
    color="red"         # Root is red. 
fi;

PROMPT="%{$fg[$color]%}%n%{$reset_color%}%B%{$fg[red]%}@%b%U%B%{$fg[red]%}%m%b%{$reset_color%}%u %{$fg[yellow]%}%~ \$vcs_info_msg_0_
%{$fg[$color]%}$ %{$reset_color%}"

export TERM=xterm-256color
export LSCOLORS=exfxdxbxcxegedabagacad  # ls colors.
# Order of lscolors from left to right.
# directory = b
# symlink = f
# socket = d
# pipe = b
# executable = c
# b = red
# c = green
# d = yellow
# e = blue
# f = magenta
# g = cyan

# Keybindings
# Lookup in /etc/termcap or /etc/terminfo else, you can get the right keycode
# by typing ^v and then type the key or key combination you want to use.
# "man zshzle" for the list of available actions

# A lot of stuff that I'm not quite sure of but used anyway.
# ------------------------------------------------------------------------------
# Completion
autoload -U compinit
compinit
zmodload -i zsh/complist
setopt hash_list_all            # Hash everything before completion.
setopt completealiases          # Complete aliases.
setopt always_to_end            # When completing from the middle of a word, move the cursor to the end of the word.
setopt complete_in_word         # Allow completion from within a word/phrase.
setopt correct                  # Spelling correction for commands.
setopt list_ambiguous           # Complete as much of a completion until it gets ambiguous.

zstyle ':completion::complete:*' use-cache on               # Completion caching, use rehash to clear.
zstyle ':completion:*' cache-path ~/.zsh/cache              # Cache path.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Ignore case.
zstyle ':completion:*' menu select=2                        # Menu if nb items > 2.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # Colors!
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # List of completors to use.

# Sections Completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
# users=(jvoisin root)           # Because I don't care about others.
zstyle ':completion:*' users $users
zstyle ':completion:*' special-dirs true

# Generic Completion with '--help'
compdef _gnu_generic gcc
compdef _gnu_generic gdb

# Pushd
setopt auto_pushd               # Make cd push old dir in dir stack.
setopt pushd_ignore_dups        # No duplicates in dir stack.
setopt pushd_silent             # No dir stack after pushd or popd.
setopt pushd_to_home            # `Pushd` = `pushd $HOME`.

# History
HISTFILE=~/.zsh_history         # Where to store zsh config.
HISTSIZE=1024                   # Big history.
SAVEHIST=1024                   # Big history.
setopt append_history           # Append.
setopt hist_ignore_all_dups     # No duplicate.
unsetopt hist_ignore_space      # Ignore space prefixed commands.
setopt hist_reduce_blanks       # Trim blanks.
setopt hist_verify              # Show before executing history commands.
setopt inc_append_history       # Add commands as they are typed, don't wait until shell exit.
setopt share_history            # Share hist between sessions.
setopt bang_hist                # !keyword.

# Various
setopt auto_cd                  # If command is a path, cd into it.
setopt auto_remove_slash        # Self explicit.
setopt chase_links              # Resolve symlinks.
setopt clobber                  # Truncate existing files when using >.
setopt correct                  # Try to correct spelling of commands.
setopt extended_glob            # Activate complex pattern globbing.
setopt glob_dots                # Include dotfiles in globbing.
setopt print_exit_value         # Print return value if non-zero.
unsetopt beep                   # No bell on error.
unsetopt bg_nice                # No lower prio for background jobs.
unsetopt hist_beep              # No bell on error in history.
unsetopt hup                    # No hup signal at shell exit.
unsetopt ignore_eof             # Do not exit on end-of-file.
unsetopt list_beep              # No bell on ambiguous completion.
unsetopt rm_star_silent         # Ask for confirmation for `rm *' or `rm path/*'.
# setxkbmap -option compose:ralt  # compose-key... shell doesn't seem to like this.
