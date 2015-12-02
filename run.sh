#!/bin/bash
if [ ! -z "$GITREPO" ]; then
	rm -R /var/node
	mkdir /var/node
	git clone $GITREPO /var/node
	cd /var/node
	npm install --unsafe-perm
	bower --allow-root install
fi
if [ -z "$TIMEZONE" ]; then
	TIMEZONE="Europe/Berlin"
fi
echo $TIMEZONE | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata
node app.js
