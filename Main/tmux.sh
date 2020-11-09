#!/bin/sh

session="Ripple!Clone"
alias EXIT="exit"

# Colors For Prints
alias RPRINT="printf '\\033[0;31m%s\\n'"     # Red
alias GPRINT="printf '\\033[0;32m%s\\n'"     # Green

new () {

	tmux new-session -c /root/liveemily/ -s $session -d
	tmux send-keys "cd pep.py" C-m
	tmux send-keys "python3.5 pep.py &" C-m
	tmux send-keys "cd .." C-m
	tmux send-keys "cd lets" C-m
	tmux send-keys "python3.6 lets.py &" C-m
	tmux send-keys "cd .." C-m
	tmux send-keys "cd avatar-server" C-m
	tmux send-keys "python3.6 avatar-server.py &" C-m
	tmux send-keys "cd .." C-m
	tmux send-keys "cd hanayo" C-m
	tmux send-keys "./hanayo &"
	tmux send-keys "cd .." C-m
	tmux send-keys "cd api" C-m
	tmux send-keys "cd ./api &" C-m
	tmux send-keys "cd .."

}

attach () {

	tmux "attach" -t $session

}

kill () {


	tmux kill-session -t $session

}

while [ "$#" -ge 0 ]; do case "$1" in
	"--new" | "-N")
		new
		
		EXIT 0 ;;

	"--attach" | "-A")
		attach
		
		EXIT 0 ;;
	"--kill" | "-K")
		kill
		
		EXIT 0 ;;
	*)
		RPRINT "No argument provided"
		GPRINT "Available commands: " \
		"	new    --new    -N | Makes a new session" \
		"	attach --attach -A | Attaches you to the Ripple session" \
		"	kill   --kill   -K | Kills the current Ripple session"
		EXIT 74 ;;
esac; shift; done
