
```
arch -arm64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Update Homebrew and install Node.js 16:

```
brew update
brew install node@16
```
Add the Node.js 16 binary to your PATH by adding the following line to your ~/.zshrc or ~/.bashrc file:

```
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
```
Save the changes and restart your Terminal or run source ~/.zshrc or source ~/.bashrc to apply the changes.


## Python

Install pyenv:
Make sure pyenv is installed via Homebrew:

```
brew install pyenv
```

Install Python 3.11 with pyenv:

```
pyenv install 3.11.0
```

Add to :

```
open -a TextEdit ~/.zshrc
```

```
# Add pyenv to PATH
export PATH="$HOME/.pyenv/bin:$PATH"

# Initialize pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
```
