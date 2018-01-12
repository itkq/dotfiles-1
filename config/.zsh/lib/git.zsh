# Configuration for git
alias gci="git commit -S"
alias gcim="git commit -S -m"
alias gm="git merge"
alias gst="git status"
alias gco="git checkout"
alias gbr="git branch"
alias ga="git add"
alias gaa="ga -A"
alias gf="git fetch"
alias gd="git diff --word-diff=color"
alias gignore="git rm -r --cached .; git add ."
alias gca="git commit -S --amend"
alias gcan="git commit -S --amend --no-edit"
alias gcop='git status | grep modified | awk "{print \$2}" | peco | xargs git checkout'
alias git_delete_local_branch='git branch --merged | grep -v "*" | grep -v master | grep -v for_tracking | xargs git branch -d'
alias git_delete_remote_branch="git branch -a --merged | grep -v master | grep remotes/origin| sed -e 's% *remotes/origin/%%' | xargs -I% git push origin :%"
alias gri="git rebase -i --autostash"
alias current-branch='git rev-parse --abbrev-ref HEAD'

function gl(){
  if [ $# -ne 0 ]; then
    git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%an %Creset%s %C(blue)%d%Creset' $@
  else
    git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%an %Creset%s %C(blue)%d%Creset' -10
  fi
}

# git push to current branch with remote fallback
function gp() {
  if [ $# -ne 0 ]; then
    # if origin is http://github.com/foo/bar, change to github.com:foo/bar
    if git remote | grep -q origin; then
      remote=`git config --get remote.origin.url`

      if echo $remote | grep -q "^https://"; then
        new_remote=`echo $remote | sed -e "s/https:\/\/github\.com\//github.com:/g"`

        git remote rm origin
        git remote add origin $new_remote
      fi
    fi

    # check whether remote mine exists or not
    mine_push=false
    for arg in $@; do
      if [ $arg = "mine" ]; then
        mine_push=true
      fi
    done

    # if mine does not exist, push to origin
    if $mine_push; then
      if git remote | grep -q mine; then
        git push $@ `current-branch`
      else
        git push `echo $@ | sed -e "s/mine/origin/"` `current-branch`
      fi
    else
      git push $@ `current-branch`
    fi
  else
    git push
  fi
}
function gpf() {
  current_dir=$(git rev-parse --show-toplevel)
  remote_url=$(git remote get-url --push origin)
  echo "\e[33m[Warning] You are trying force pushing\e[m"
  echo "  from: $current_dir:`current-branch`"
  echo "    to: $remote_url:`current-branch`"
  read Answer\?'Are you sure? [Y/n] '
  case $Answer in
    '' | [Yy]* )
      git push -f origin `current-branch`
      ;;
    * )
      echo "Force pushing interrupted."
      return 1
      ;;
  esac
}

function gg() {
  if [[ -n `git rev-parse --git-dir 2> /dev/null` ]]; then
    git grep -n $@
  else
    find . -type f | xargs grep -n --color=auto $@
  fi
}

function up() {
  git branch --set-upstream-to=$@/master master
}

function mine() {
  if [[ -n `git remote | grep mine` ]]; then
    echo "remote mine is already set up"
    return
  fi

  local repo_name=$(git rev-parse --show-toplevel | sed -e "s/^.*\///g")
  local repo_path="github.com:itkq/${repo_name}"
  git remote add mine $repo_path
  git fetch mine
  git branch --set-upstream-to=mine/`current-branch` `current-branch`
  echo "added remote mine: ${repo_name}"
}

# git-hook
# export PATH="$HOME/.git-hook/bin:$PATH"

function github-url() {
  ruby <<-EOS
  require 'uri'

  def parse_remote(remote_origin)
  if remote_origin =~ /^(https|ssh):\/\//
    uri = URI.parse(remote_origin)
    [uri.host, uri.path]
    elsif remote_origin =~ /^[^:\/]+:\/?[^:\/]+\/[^:\/]+$/
    host, path = remote_origin.split(":")
    [host.split("@").last, path]
  else
    raise "Not supported origin url: #{remote_origin}"
  end
end

host, path = parse_remote(\`git config remote.origin.url\`.strip)
puts "https://#{host}/#{path.gsub(/\.git$/, '')}"
EOS
}

function preq() {
  # git rev-list --ancestry-path : only display commits that exist directly on the ancestry chain
  # git rev-list --first-parent  : follow only the first parent commit upon seeing a merge commit
  merge_commit=$(ruby -e 'print (File.readlines(ARGV[0]) & File.readlines(ARGV[1])).last' <(git rev-list --ancestry-path $1..master) <(git rev-list --first-parent $1..master))

  if git show $merge_commit | grep -q 'pull request'; then
    issue_number=$(git show $merge_commit | grep 'pull request' | ruby -ne 'puts $_.match(/#(\d+)/)[1]')
    url="$(github-url)/pull/${issue_number}"
  else
    url="$(github-url)/commit/${1}"
  fi

  if which open > /dev/null; then
    open $url
  else
    xdg-open $url
  fi
}

# ghe get
function ghe() {
  case $1 in
    get )
      # You must export $GHE_HOST in ~/.zshrc.local
      ghq get $GHE_HOST:$2
      ;;
    * )
      ghq $@
      ;;
  esac
}


GITHUB_USERNAME="Takuya Kosugiyama"
LF=$'\\\x0A'

function git_ig(){
  gibo -l | tr '\t', '\n' | sed -e '/^$/d' | sort | sed -e '1,2d' |  peco --prompt "Select Language >" | xargs gibo >> .gitignore
}

function git_license(){
  curl -H "Accept: application/vnd.github.drax-preview+json" -X GET https://api.github.com/licenses | jq ".[].url" | peco --prompt "Select License >" | sed -e "s/\"//g" | xargs -J % curl -H "Accept: application/vnd.github.drax-preview+json" -X GET % | jq ".body" | sed -e 's/^\"//' | sed -e 's/\"$//' | sed -e 's/\\\"/\"/g' | sed -e 's/\\n'/"$LF"'/g' > LICENSE
}

function git_add_remote_origin(){
  curl -# -X GET https://api.github.com/users/${GITHUB_USERNAME}/repos | jq ".[].ssh_url" | peco | xargs git remote add origin
}

function git_setup(){
  git init
  git_ig
  git_license
  echo "# README" > README.md
  git add .gitignore LICENSE README.md
  git commit -m "first commit"
  git_add_remote_origin
  git push origin master
}

function gupdate(){
  local stash_flg=0
  local change_branch_flg=0
  [ -z "$(git status --short)" ] || (git stash push -u -q && stash_flg=1)
  [ "$(__current_branch)" != "master" ] && git checkout master && change_branch_flg=1
  git fetch upstream && git merge --ff upstream/master
  (( $change_branch_flg )) && git checkout -
  (( $stash_flg )) && git stash pop
}
