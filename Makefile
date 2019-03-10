# -*- Makefile -*-

all:
	echo 'No rule for make all existing. Please run "sudo make install" to install seafctl'

install: 
	cp seafctl /usr/local/bin/seafctl
	cp seafctl-completion.bash /etc/bash_completion.d/seafctl
	cp seafile.conf /etc/seafile.conf
