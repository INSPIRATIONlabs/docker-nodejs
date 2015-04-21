#!/bin/bash
if [ ! -z "$GITREPO" ]; then
	rm -R /var/node
	mkdir /var/node
	git clone $GITREPO /var/node
	cd /var/node
	npm install --unsafe-perm
	bower --allow-root install
	node app.js
fi
