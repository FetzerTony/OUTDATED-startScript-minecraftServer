#!/bin/sh

HOME="/home/network/lobby"
SCREENAME='lobby'
MAX_RAM="2G"
MIN_RAM="1G"
SERVER="spigot-1.19.2.jar"


case "$1" in
  start)
    if ! screen -list | grep -q ${SCREENAME} ; then
      cd ${HOME}
      screen -d -m -S ${SCREENAME} java -Xmx${MAX_RAM} -Xms${MIN_RAM} -XX:+UseG1GC -jar ${SERVER} nogui
      echo "Starting the server, type \"screen -r ${SCREENAME}\" or \"./start.sh view\" to display the server console."
    else
      echo "The server is already started."
    fi
    ;;
  stop)
    screen -S ${SCREENAME} -X stuff "save-all\n"
    echo "The save-all command was sent to the server."
    screen -S ${SCREENAME} -X stuff "stop\n"
    echo "The stop command was sent to the server."
    ;;
  restart)
    screen -S ${SCREENAME} -X stuff "say The server restarts!\n"
    screen -S ${SCREENAME} -X stuff "save-all\n"
    sleep 10
    screen -S ${SCREENAME} -X stuff "stop\n"
    sleep 10
    cd ${HOME}
    screen -d -m -S ${SCREENAME} java -Xmx${MAX_RAM} -Xms${MIN_RAM} -XX:+UseG1GC -jar ${SERVER} nogui
    echo "Server has restarted"
    ;; 
  view)
    echo "IMPORTANT: leave console with CTRL + A + D, otherwise the server will crash"
    echo "console opens in 3 seconds"
    sleep 3
    screen -r ${SCREENAME}
    ;;
  kill)
    screen -X -S ${SCREENAME} kill
    echo Screen wurde gekillt
    ;;
  *)
    echo "Usage: ${0} {start|stop|restart|view|kill}"
exit 2
esac
exit 0
