# -*- Makefile -*-

all:
	echo 'No rule for make all existing. Please run "sudo make install" to install seafctl'

install: 
	cp seafctl /usr/local/bin/seafctl
	cp seafctl-completion.bash /usr/share/bash-completion/completions/seafctl
	cp seafile.conf /etc/seafile.conf
