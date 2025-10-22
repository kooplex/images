git remote update && git status | grep behind
[ $? == 0 ] &&  git pull

# root@1eaad0668bda:/opt/pathogens-portal-hu# git remote update && git status
# Username for 'https://github.com': jegesm
# Password for 'https://jegesm@github.com':
# On branch main
# Your branch is behind 'origin/main' by 1 commit, and can be fast-forwarded.
#   (use "git pull" to update your local branch)
# 
# nothing to commit, working tree clean

