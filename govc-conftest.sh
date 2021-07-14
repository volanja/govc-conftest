#!/usr/bin/env bash

# govc-conftest allows for testing resources in your cluster using Open Policy Agent
# It uses the conftest utility and expects to find associated policy files in
# a directory called policy

# Check if a specified command exists on the path and is executable
function check_command () {
    if ! [[ -x $(command -v "$1") ]] ; then
        echo "$1 not installed"
        exit 1
    fi
}

function usage () {
    echo "A govc plugin for using Conftest to test objects in VMware vSphere using Open Policy Agent"
    echo
    echo "See below site for more information"
    echo "   https://github.com/open-policy-agent/conftest"
    echo "   https://github.com/vmware/govmomi/tree/master/govc"
    echo
    echo "Usage:"
    echo "   conftest govc [command]"
    echo
}

# Check the required commands are available on the PATH
check_command "govc"
check_command "conftest"

if [[ ($# -eq 0) || ($1 == "--help") || ($1 == "-h") ]]; then
    # No commands or the --help flag passed and we'll show the usage instructions
    usage
elif [[ ($# -eq 1) && $1 =~ ^[a-z\.]+$ ]]; then
    # If we have one argument then we assume govc command
    if output=$(govc "$1" --json); then
        echo "Testing $1"
        echo "$output" | conftest test -
    fi
else
    echo "Please check the arguments to govc conftest"
    echo
    usage
    exit 1
fi
