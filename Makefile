deps:
	librarian-puppet install --path modules --verbose

tools:
	gem install tmuxinator puppet-lint librarian-puppet

init:
	rm -f ~/.tmuxinator/aem-workspace.yml
	ln -s `pwd`/tmuxinator.yml ~/.tmuxinator/aem-workspace.yml

clean:
	rm -rf .librarian .tmp modules

provision:
	puppet apply provisioner/aem.pp --modulepath modules/

tmux:
	tmuxinator start aem-workspace

.PHONY: clean deps tools init clean provision tmux
