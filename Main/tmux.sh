#!/bin/sh

session="Ripple!Clone"
alias EXIT="exit"

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
		printf "%s\n" "No argument provided"
		printf "%s\n" "Available commands: "
		printf "%s\n" "new --new -N | Makes a new session"
		printf "%s\n" "attach --attach -A | Attaches you to the Ripple session"
		printf "%s\n" "kill --kill -K | Kills the current Ripple session"
		EXIT 74 ;;
esac; shift; done
