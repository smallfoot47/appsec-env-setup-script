#!/usr/bin/env bash
set -ex

apt_status=$(apt --version)
if [[ $apt_status == *not found* ]]; then
  sudo pacman -Su
  echo "Installing git..."
  sudo pacman -S git

  echo "Installing lcov..."
  sudo pacman -S lcov

  echo "Installing AFL++..."
  sudo pacman -S afl++

  echp "Installing GDB..."
  sudo pacman -S gdb
else
  sudo apt-get update
  echo "Installing git..."
  sudo apt install git

  echo "Installing lcov..."
  sudo apt-get -y install lcov

  echo "Installing AFL++..."
  sudo apt-get -y install afl++

  echo "Installing GDB..."
  sudo apt-get -y install gdb
fi

echo "Setup for HW1 complete..."
