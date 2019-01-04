# --SAVE_HISTORY BEGIN--
# Usage: create ~/.history directory. Include the function in .bashrc
# records commands executed from each session based on ip address.
SSH_CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')
save_history() {
if [[ "{$BASH_COMMAND}" != *"printf \"\033]0;%s@%s:%s"* ]]; then
        echo "$(date) ${SSH_CLIENT_IP} ${BASH_COMMAND}" >> ~/.history/${SSH_CLIENT_IP}.history
fi
}
trap save_history DEBUG
# --SAVE_HISTORY END--

# --CLEANUP BEGIN--
# Usage: Include in .bashrc
# clear up history when the session is disconnected.
cleanup() {
cat /dev/null > ~/.bash_history && history -c && exit
}
trap cleanup EXIT
# --CLEANUP END--