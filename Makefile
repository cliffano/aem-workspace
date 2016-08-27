tools:
	gem install tmuxinator

init:
	rm -f ~/.tmuxinator/aem-workspace.yml
	ln -s `pwd`/tmuxinator.yml ~/.tmuxinator/aem-workspace.yml

tmux:
	tmuxinator start aem-workspace

.PHONY: init tmux tools
