# Pokeshell

A Pokémon-inspired terminal game for zsh.

Pokeshell gives you a Pokémon egg when you start a terminal session. Each command you run counts as a step, and eventually the egg hatches into a random Gen 1 Pokémon.

## Features

- Persistent Pokémon egg across terminal sessions
- Step-based egg hatching
- Gen 1 Pokémon database
- Local Pokédex
- Terminal sprite display (iTerm2)
- Persistent save state

## Installation

Clone the repository:

```bash
git clone <repository-url>
cd pokeshell
```

Run the installer:

```bash
make install
```

Add the following to your `.zshrc`:

```zsh
source ~/.pokemonrc
```

Restart your terminal or reload your shell with:

```zsh
source ~/.zshrc
```

## Commands

View your current egg:

```zsh
egg
```

View your last hatched Pokémon:

```zsh
pokemon_last
```

Reset your current egg:

```zsh
pokemon_reset_state
```

## Development

Run the installer:

```bash
make install
```

Run a syntax check:

```bash
make lint
```

Create a development symlink:

```bash
make link
```

## Requirements

- zsh
- iTerm2 (for inline sprite display)
- curl (for sprite downloads)