# parses output from git grep and opens files on sublime
function gosub(){
      awk '{print $1}' | sed 's/:$//' | xargs subl
}

function ban_ip() {
    iptables -A INPUT -s $1 -j DROP
}

function dup() {
    docker-compose up -d $@
}

function of() {
	selected=$(ps axc | awk 'NR > 1' | awk '{print substr($0,index($0,$5))}' | sort -u | fzf)

	if [ ! -z $1 ]; then
	        lsof -r 2 -c "$selected"
	else
	        lsof -c "$selected"
	fi
}

function dc() {
	if docker ps >/dev/null 2>&1; then
	  container=$(docker ps | awk '{if (NR!=1) print $1 ": " $(NF)}' | fzf --height 40%)

	  if [[ -n $container ]]; then
	    container_id=$(echo $container | awk -F ': ' '{print $1}')

	    docker exec -it $container_id /bin/bash || docker exec -it $container_id /bin/sh
	  else
	    echo "You haven't selected any container! ༼つ◕_◕༽つ"
	  fi
	else
	  echo "Docker daemon is not running! (ಠ_ಠ)"
	fi
}

progress-bar() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

function edit() {
	nano $(find . -maxdepth 1 -type f | fzf)
}


function lsip() {
	nmcli -g ip4.address device show $(ifconfig | cut -d ' ' -f1| tr ':' '\n' | awk NF | fzf)
}

function zsh-stats() {
 fc -l 1 | awk '{CMD[$2]++;count++;} END { for (a in CMD)	print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25;
}

function gitconfig() {
	echo "+===================================+"
	echo "|         🐙 Github Account         |"
	echo "+===================================+"
	echo "Introduce your username: "
	read NAME
	echo "Introduce your email: "
	read EMAIL
	echo "📃 The OUTPUT of the ~/.gitconfig_local file is:"
	echo "[user]
	  name = ${NAME}
	  email = ${EMAIL}
	  username = ${USERNAME}
	" >! ~/.gitconfig_local
	cat ~/.gitconfig_local
	echo "======================="
	echo "1 - Editar"
	echo "2 - Continuar"
	echo "========================"
	echo -n "Selecione una opcion:"
	read  opcion
	case $opcion in
		1)  nano ~/.gitconfig_local
			;;
		2) ;;
		*) echo "Opcion erronea";
	esac
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
			ssh-keygen -t rsa -b 4096 -C "${EMAIL}"
			;;
		2) exit;;
		*) echo "Opcion erronea";
	esac
}

# update node to latest lts version
function nvm::update() {
  local -r current_node_version=$(nvm current)
  local -r next_node_version=$(nvm version-remote --lts)
  if [ "$current_node_version" != "$next_node_version" ]; then
    local -r previous_node_version=$current_node_version
    nvm install --lts
    nvm reinstall-packages "$previous_node_version"
    nvm uninstall "$previous_node_version"
    nvm cache clear
  fi
}
