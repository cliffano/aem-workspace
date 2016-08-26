tools:
  gem install tmuxinator

tmux:
	ln -s tmuxinator.yml ~/.tmuxinator/aem-workspace.yml
	tmuxinator start aem-workspace

.PHONY: tools tmux
