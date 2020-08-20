#!/bin/bash

echo "+===================================+"
echo "|         🐙 Github Account         |"
echo "+===================================+"
echo "Introduce your username: "
read USERNAME
echo "Introduce your email: "
read EMAIL

git config --global user.name "${USERNAME}"
git config --global user.email "${EMAIL}"

echo "+===================================+"
echo "|   🐙 Github Account - 💽 Store    |"
echo "+===================================+"
git config --global user.name
git config --global user.email
echo "======================="
echo "1 - Crear SSH key"
echo "2 - Salir"
echo "========================"
echo -n "Selecione una opcion:"
read  opcion
case $opcion in
	1)  echo "+====================================+"
		echo "|🔑 Generating SSH key for that email|"
		echo "+====================================+"
		ssh-keygen -t rsa -b 4096 -C "$(git config --global user.email)"
		;;
	2) exit;;
	*) echo "Opcion erronea";
esac
