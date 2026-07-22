.PHONY: install link unlink lint clean purge

install:
	./scripts/install.sh

link:
	ln -sf $(PWD)/pokemonrc ~/.pokemonrc

unlink:
	rm -f ~/.pokemonrc

lint:
	zsh -n pokemonrc

clean:
	rm -f ~/.cache/pokemon/state

purge:
	rm -rf ~/.cache/pokemon