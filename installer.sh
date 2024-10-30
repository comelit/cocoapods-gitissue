#!/bin/bash

set -e

if ! [ -x "$(command -v figlet)" ];
then
  alias figlet='echo '
fi

echo ""
figlet "GitPods"
echo ""

function init
{
    cd "$REPO_FULL_PATH"

    figlet "Check bin dependencies"

    if ! [ -x "$(command -v brew)" ];
    then
        echo "installing brew"
        # sample script: skip brew install
    fi

    if ! [ -x "$(command -v figlet)" ];
    then
        echo "installing figlet"
        # sample script: skip figlet install
    fi

    if ! [ -x "$(command -v git)" ];
    then
        figlet "installing git"
        # sample script: skip git install
    fi

    if ! [ -x "$(command -v g++)" ];
    then
        echo "g++ not found!...."
        echo "try to select xcode toolchain...."
        # sample script: skip xcode-select
    fi

    figlet "Repo Download"

    updateLibrariesBranches

    echo 'initialization completed' >> .init
}

function checkinit
{ 
    if ! [[ -e "$REPO_FULL_PATH/.init" ]]; then
        echo ""
        echo "------------------------ ERROR ---------------------------"
        echo "--> Missing Initialization, please run \"installer.sh init\" <--"
        echo "----------------------------------------------------------"
        echo ""
        exit 1
    fi
}

function updateLibrariesBranches
{
    cd $REPO_FULL_PATH
    git submodule update --init --recursive --checkout --force
    printrepostatus
}

function printrepostatus
{
    figlet "Repo status"
    cd $REPO_FULL_PATH
    git submodule foreach "version.sh 2> /dev/null || git describe --tags --always; echo" | cut -d " " -f2 | sed -e "s/'//g"
}

function printhelp
{
    echo ""
    echo "------------------------- HELP -----------------------"
    echo "Please use \"installer.sh [arg]\""
    echo " init: repo initialization"
    echo " pod-init: initialize only the dependency needed when installing the CocoaPods (this is used only from CocoaPods podspec)"
    echo "------------------------------------------------------"
    echo ""
}


REPO_FULL_PATH=$(perl -e 'use Cwd "abs_path"; use File::Basename; ($name,$path,$suffix) = fileparse(abs_path(shift)); print $path' $0)
echo $REPO_FULL_PATH
echo

case "$1" in
    init)
        init
        exit 0
        ;;
    pod-init)
        updateLibrariesBranches
        ;;
    *)
        printhelp
        exit 1
        ;;
esac
