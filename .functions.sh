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