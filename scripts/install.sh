#!/usr/bin/env bash

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CACHE_DIR="${HOME}/.cache/pokemon"
SPRITES_DIR="${CACHE_DIR}/sprites"
DEX_DIR="${CACHE_DIR}/pokedex"

POKEMONRC_DEST="${HOME}/.pokemonrc"

echo "Installing Pokeshell..."
echo

# Prerequisites
if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required but was not found."
  exit 1
fi

# Create directories
mkdir -p "$CACHE_DIR"
mkdir -p "$SPRITES_DIR"
mkdir -p "$DEX_DIR"

# Install files
if [[ -e "$POKEMONRC_DEST" || -L "$POKEMONRC_DEST" ]]; then
  read -rp "~/.pokemonrc already exists. Overwrite? [y/N] " reply

  if [[ "$reply" =~ ^[Yy]$ ]]; then

    if [[ -L "$POKEMONRC_DEST" ]]; then
      echo "~/.pokemonrc is a symlink. Removing it first."
      rm "$POKEMONRC_DEST"
    fi

    cp "$SCRIPT_DIR/pokemonrc" "$POKEMONRC_DEST"
    echo "Updated ~/.pokemonrc"

  else
      echo "Keeping existing ~/.pokemonrc"
  fi

else
  cp "$SCRIPT_DIR/pokemonrc" "$POKEMONRC_DEST"
  echo "Installed ~/.pokemonrc"
fi

cp "$SCRIPT_DIR/pokemon.db" "$CACHE_DIR/pokemon.db"
echo "Installed pokemon.db"

# Download egg sprite
if [[ ! -f "$SPRITES_DIR/egg.png" ]]; then
  echo "Downloading egg sprite..."

  curl -fsSL \
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/mystery-egg.png" \
    -o "$SPRITES_DIR/egg.png"
fi

# Download pokémon sprites
echo "Downloading sprites..."

for id in $(seq 1 151); do
  filename=$(printf "%03d.png" "$id")

  [[ -f "$SPRITES_DIR/$filename" ]] && continue

  curl -fsSL \
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png" \
    -o "$SPRITES_DIR/$filename"
done

echo "Sprites downloaded."

echo
echo "Installation complete!"
echo
echo "Add the following to your ~/.zshrc:"
echo
echo "source ~/.pokemonrc"
echo
echo "Then restart your terminal or run:"
echo
echo "source ~/.zshrc"
echo