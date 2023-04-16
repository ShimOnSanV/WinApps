#!/bin/bash

# Give me some arguments?
getarv=0

function usage() {
    echo "Usage: $0 -s -d -b"
}

function show_help() {
    echo "Usage: $0 [-h] [-s] [-d] [-b]"
    echo " -h       this message will be shown."
    echo " -s       build the Qt toolkit from source."
    echo " -d       install the dependency on GNU Debian, Ubuntu, and Linux Mint."
    echo " -b       this project will be built."
}

function build_from_source() {
    echo "... build the Qt toolkit from source"
    
    # Make build QT from source https://doc.qt.io/qt-6/linux.html
    # We need QT 6.1 or higher
}

function install_dependencies() {
    echo "... install the dependency on GNU Debian, Ubuntu, and Linux Mint."
    
    sudo apt update -q

    sudo apt install -y build-essential libgl1-mesa-dev
    sudo apt install -y -q build-essential libgl1-mesa-dev

    sudo apt install -y -q libxkbcommon-x11-0
    sudo apt install -y -q libxcb-image0
    sudo apt install -y -q libxcb-keysyms1
    sudo apt install -y -q libxcb-render-util0
    sudo apt install -y -q libxcb-xinerama0
    sudo apt install -y -q libxcb-icccm4

    sudo apt install -y -q gcc g++ make

    sudo apt install -y libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev libxcb-icccm4 libxcb-icccm4-dev libxcb-sync1 libxcb-sync-dev libxcb-xfixes0-dev libxrender-dev libxcb-shape0-dev

    # For QT 6.5 or higher sudo apt install libxcb-cursor0
    sudo apt install libxcb-cursor0
}

function build() {
    echo "... this project will be built"

    # I am in the tools directory inside a root of the project, so I am going outside of it.
    cd ..
    cd WinApps_FrrstRunWizard
    # We nedd QT tolchian in 6.5 verion:
    # FIXME You should find the greatest version of QT on the computer, >= 6.
    toolchain=$(find /home -type d -path "*/Qt/6.5.0/gcc_64/bin" -print -quit)

    if [[ -z $toolchain ]]; then
        echo "The QT was not found!"
        exit 1
    else
        tmp="/qmake"
        toolchain+=$tmp
        qmake=$toolchain
        mkdir -p build
        cd build
        #/home/pyroxar/Qt/6.5.0/gcc_64/bin/qmake ..
        $qmake ..
        make
    fi
    
}

while getopts ":hsdb" opt; do
  case ${opt} in
    h)
      getarv=1
      show_help
      exit 0
      ;;
    s)
      getarv=1
      build_from_source
      ;;
    d)
      getarv=1
      install_dependencies
      ;;
    b)
      getarv=1
      build
      ;;
    \?)
      echo "Wrong option: -$OPTARG" 1>&2
      show_help
      exit 1
      ;;
    
  esac
done

shift $((OPTIND -1))

if [ $getarv -eq 0 ]; then
    echo "This script $0 needs an argument"
    show_help
    usage
    exit 1
else
  echo "flag = true"
fi



