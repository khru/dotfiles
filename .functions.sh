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
