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
      echo "Server wird gestartet, screen -r ${SCREENAME} oder ./start.sh view eingeben um die Serverkonsole anzuzeigen."
    else
      echo "Der Server ist schon gestartet."
    fi
    ;;
  stop)
    screen -S ${SCREENAME} -X stuff "save-all\n"
    echo "Der Save-All-Befehl wurde an den Server gesendet."
    screen -S ${SCREENAME} -X stuff "stop\n"
    echo "Der Stop-Befehl wurde an den Server gesendet."
    ;;
  restart)
    screen -S ${SCREENAME} -X stuff "say Die lobby startet neu!\n"
    screen -S ${SCREENAME} -X stuff "save-all\n"
    sleep 10
    screen -S ${SCREENAME} -X stuff "stop\n"
    sleep 10
    cd ${HOME}
    screen -d -m -S ${SCREENAME} java -Xmx${MAX_RAM} -Xms${MIN_RAM} -XX:+UseG1GC -jar ${SERVER} nogui
    echo Server wurde neugestartet
    ;; 
  view)
    echo "Wichtig die Konsole mit Strg+A+D verlassen sonst stürzt der Server ab"
    echo "Konsole startet in 3s"
    sleep 3
    screen -r ${SCREENAME}
    ;;
  kill)
    screen -X -S ${SCREENAME} kill
    echo Screen wurde gekillt
    ;;
  *)
    echo "Verwende: ${0} {start|stop|restart|view|kill}"
exit 2
esac
exit 0
