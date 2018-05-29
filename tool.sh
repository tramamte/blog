#!/bin/bash

update() {
	echo -e "\033[0;32m[[   Updating   ]]\033[0m"
	git pull
	pushd public
	git pull
	popd
}

push() {
	echo -e "\033[0;32m[[   Pushing   ]]\033[0m"
	msg="update blog data `date`"
	if [ $# -eq 1 ]; then
		msg="$1"
	fi
	git add .
	git commit -m "${msg}"
	git push
}

deploy() {
	echo -e "\033[0;32m[[   Deploying   ]]\033[0m"
	msg="rebuilding blog `date`"
	if [ $# -eq 1 ]; then
		msg="$1"
	fi
	rm -rf public/*
	hugo
	pushd public
	git add .
	git commit -m "${msg}"
	git push origin master
	popd
}

usage() {
	echo -e "\033[0;36mUsage: $1 <command> [log]\033[0m"
	echo ""
	echo "Commands:"
	echo "  update (u)        Pull blog and public from GitHub"
	echo "  push   (p) [log]  Push blog to GitHub"
	echo "  deploy (d) [log]  Push public to GitHub"
}

if [ $# -eq 0 ]; then
	usage $0
else
	if [ "$1" == "update" -o "$1" == "u" ]; then
		update
	elif [ "$1" == "push" -o "$1" == "p" ]; then
		shift
		push $@
	elif [ "$1" == "deploy" -o "$1" == "d" ]; then
		shift
		deploy $@
	else
		usage $0
	fi
fi
