# aliases
# --------------------------------------------------------------------------------
shopt -s expand_aliases                                                 # vim reads aliases

# general
alias emacs='printf "\xf0\x9f\x98\x90  Dont do that.\n"'                # fun
alias ls='ls -aF'                                   
alias vi=/usr/local/Cellar/vim/7.4.1830/bin/vim                         # lazy Cellar vim
alias vim=/usr/local/Cellar/vim/7.4.1830/bin/vim                        # " 

# apple scripts 
alias goto_safari='cd; cd .bin/appl/; osascript goto_safari.scpt'

# ssh 
alias compute='ssh -Y eric.chung@compute.cse.tamu.edu'                  # compute server
alias linux='ssh -Y eric.chung@linux.cse.tamu.edu'                      # linux server

# git
alias git_shove='./.bin/bash/git_shove.sh'                              # quick commit
alias git_up_subs='git submodule foreach git pull origin master'        # update submods