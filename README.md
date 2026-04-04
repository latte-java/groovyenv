# groovyenv
Groovy environment scripts to install and use different versions of Groovy similar to rbenv

## Install

```bash
curl -fsSL https://lattejava.org/groovyenv/install | bash
```

## Usage

```bash
# Install the latest Groovy 4
groovyenv install 4

# Install a specific version
groovyenv install 4.0.31

# List available versions from Apache archive
groovyenv install --list

# Set the global Groovy version
groovyenv global 4

# Set the local Groovy version for the current directory
groovyenv local 4

# Set Groovy version for the current shell session (requires groovyenv init)
groovyenv shell 4

# Clear the shell version override
groovyenv shell --unset

# Show the currently active version
groovyenv current

# List installed versions
groovyenv versions

# Print GROOVY_HOME for the current version
groovyenv home

# Upgrade to the latest patch for a major version
groovyenv upgrade 4

# Regenerate shims
groovyenv reshim

# Diagnose common setup problems
groovyenv doctor

# Remove an installed version
groovyenv uninstall 4.0.31
```

## Version Resolution

groovyenv resolves the Groovy version using this precedence:

1. `GROOVYENV_VERSION` env var (set by `groovyenv shell`)
2. `.groovyversion` file in the current directory (searching up the tree)
3. `~/.groovyversion` (set by `groovyenv global`)

The file can contain a full version (`4.0.31`) or just a major version (`4`). A major version resolves to the highest installed patch for that major.

## GROOVY_HOME

To set `GROOVY_HOME` automatically and enable `groovyenv shell`, add one of the following to your shell init file:

**bash** (`~/.bashrc`):
```bash
eval "$(groovyenv init)"
```

**zsh** (`~/.zshrc`):
```zsh
eval "$(groovyenv init)"
```

**fish** (`~/.config/fish/config.fish` or Oh My Fish `init.fish`):
```fish
groovyenv init | source
```
