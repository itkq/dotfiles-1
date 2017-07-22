# Go
export GOPATH=$HOME
export PATH="${GOPATH}/bin:$PATH"
export GOMAXPROCS=4

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/itkq/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/itkq/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/itkq/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/itkq/google-cloud-sdk/completion.zsh.inc'; fi
