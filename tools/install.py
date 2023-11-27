#!/usr/bin/env python3

import subprocess
import platform

def is_virtualbox_installed():
    try:
        subprocess.run(["VBoxManage", "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
        return True
    except subprocess.CalledProcessError:
        return False

def install_virtualbox():
    if is_virtualbox_installed():
        print("Oracle VirtualBox jest już zainstalowany na tym systemie.")
        return
    
    system = platform.system()
    
    if system == "Linux":
        try:
            subprocess.run(["sudo", "apt-get", "update"])
            subprocess.run(["sudo", "apt-get", "install", "virtualbox"])
            print("Oracle VirtualBox został pomyślnie zainstalowany.")
        except Exception as e:
            print(f"Wystąpił błąd podczas instalacji Oracle VirtualBox: {e}")
    else:
        print("Obsługiwane są tylko systemy Linux. Oracle VirtualBox nie jest dostępny dla innych systemów.")

if __name__ == "__main__":
    install_virtualbox()
