# -*- Makefile -*-

all:
	echo 'No rule for make all existing. Please run "sudo make install" to install seafctl'

install: 
	mv seafctl /usr/local/bin/seafctl
	mv seafctl-completion.bash /usr/share/bash-completion/completions/seafctl
	mv seafile.conf /etc/seafile.conf
