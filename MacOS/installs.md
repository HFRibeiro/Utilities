
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
