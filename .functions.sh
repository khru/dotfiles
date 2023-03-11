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
	echo "Introduce your name: "
	read NAME
	echo "Introduce your email: "
	read EMAIL
	echo "Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: ${NAME}
Name-Email: ${EMAIL}
Expire-Date: 0" >! ~/.gen-key-script
	echo "====================================="
	echo "♻️ Erasing the old GPG keys if exists"
	echo "====================================="
	gpg --delete-key "${NAME}"
	gpg --delete-secret-key "${NAME}"

	echo "====================================="
	echo "🔑 Generating GPG keys"
	echo "====================================="
	gpg --batch --gen-key ~/.gen-key-script

	ID=$(gpg --list-secret-keys --with-colons \
    2> /dev/null \
    | grep '^sec:' | cut --delimiter ':' --fields 5)
	
	echo "
	[user]
	  	name = ${NAME}
	  	email = ${EMAIL}
	  	username = ${USERNAME}
	  	signingkey=${ID}
	[commit]
		gpgsign = true
	" >! ~/.gitconfig_local
	echo "📃 The OUTPUT of the ~/.gitconfig_local file is:"
	cat ~/.gitconfig_local
	gpg --armor --export ${ID} >! ~/.gpg_github_key
	echo "📃 The OUTPUT of the ~/.gpg_github_key will be copy to your clipboard and the content would be:"
	cat ~/.gpg_github_key | xclip -selection clipboard
	cat ~/.gpg_github_key
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

function docker::stop-all() {
	docker stop $(docker ps -a -q)
}

function monday() {
	#terminals
	cd ~/projects/nailted-api && tilix -a session-add-right -w ~/projects/nailted-survey-webapp && tilix -a session-add-down -w ~/projects/nailted-webapp && tilix -a app-new-session -w ~/projects/nailted-api && tilix -a session-add-right -w ~/projects/nailted-survey-webapp && tilix -a session-add-down -w ~/projects/nailted-webapp && tilix -a app-new-session -w ~/projects/nailted-api;

	#slack
	slack > /dev/null 2>&1 &

	#tandem
	tandem > /dev/null 2>&1 &

	#tandem
	dbeaver > /dev/null 2>&1 &

	# google chrome
	google-chrome https://mail.google.com/  https://www.notion.so/ https://github.com/nailted > /dev/null 2>&1 &

}

function nailted-api() {
	npm run dev:start-postgres && npm run dev && npm run dev:stop-postgres
}

clone_git_repo() {
  repo_url=$(curl -s -H "Authorization: token $GITHUB_TOKEN_PULL" "https://api.github.com/user/repos?per_page=200" | jq --raw-output ".[].ssh_url" | fzf)
  git clone "$repo_url"
  echo "$repo_url"
}

open_project() {
	ls ${PROJECTS} | rofi -show -dmenu -i -normal-window | xargs -I_ echo ${PROJECTS}/_ | xargs -L 1 bash -c 'code -n $0'
}

core_setup() {
	sdk install java 11.0.17-ms
        sdk install gradle 6.8.1
        sdk install kotlin 1.4.20
        sdk install maven 3.8.2
        sdk use java 11.0.17-ms
        sdk use gradle 6.8.1
        sdk use kotlin 1.4.20
        sdk use maven 3.8.2
}

core_up() {
	cd ${PROJECTS}/scentmate/core
	core_setup
	docker-compose up -d
	./gradlew bootRun
}

core_down() {
	cd ${PROJECTS}/scentmate/core
	docker-compose down
	cd -
}

front_up() {
	cd ${PROJECTS}/scentmate/frontend
        nvm use
        npm run dev
}

admin_up() {
        cd ${PROJECTS}/scentmate/admin
        nvm use
        npm run dev
}

clean_apt_update() {
	sudo rm /var/lib/apt/lists/lock
	sudo rm /var/cache/apt/archives/lock
	sudo rm /var/lib/dpkg/lock
}

function lg () {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}


declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="5"

function pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  	val=$1
	echo $val | lolcat
  	sleep ${pomo_options["$val"]}m
	notify-send "'$val' session done" --icon=dialog-information
 	spd-say -r -25 "'$val' session done"
  fi
}

function cycle_work(){
    for i in $(seq $1); do
        pomodoro 'work'
        pomodoro 'break'
    done
}

function zsh_preformance() {
    repeat 10 { time zsh -i -c exit }
}


function cheat.sh() {
   curl cheat.sh/$1
}


function resetvpn() {
	 cd ~/Descargas/PanGPLinux-6.0.4-c25/
	./install.sh
	cd -

}

function wttr() {
	curl wttr.in/$1
}


function pdfCipher() {
	# $1 input, $2 output, $3 password
	pdftk $1 output $2 userpw $3
}

function ram () {
ps -eo pid,comm | grep -E -i -w 'chrome|slack|zoom' | awk '{print $1}' | xargs sudo renice -n 19 -p
}
