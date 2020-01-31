if [ -d "${HOME}/.jenv/bin" ]; then export PATH="$HOME/.jenv/bin:$PATH"; fi
if which jenv > /dev/null; then eval "$(jenv init - --no-rehash)"; fi
