
#! /bin/bash

SERVER='BungeeCord.jar'
SCREENAME="bungee"
MAX_RAM="1024M"
MIN_RAM="1024M"
HOME="/home/network/bungee"
USER='root'
HISTORY=32
INVOCATION="screen -S ${SCREENAME} java -Xmx${MAX_RAM} -Xms${MIN_RAM} -jar ${SERVER}"
ME=`whoami`

as_user() {
  if [ ${ME} == ${USER} ] ; then
    bash -c "$1"
  else
    su - ${USER} -c "$1"
  fi
}

cmd() {
  command="$1";
  logfile="${HOME}/proxy.log.0"
  if server_running
  then
    pre_log_len=`wc -l "${HOME}/proxy.log.0" | awk '{print $1}'`
    as_user "screen -p 0 -S ${SCREENAME} -X eval 'stuff \"${command}\"\015'"
    sleep .2
    V=`wc -l ${logfile} | awk '{print $1}'`-${pre_log_len}
    tail -n $[V] ${logfile}
  else
    echo "${SERVER} was not running. Not able to run command."
  fi
}

server_running() {
  if ps ax | grep SCREEN | grep ${SCREENAME} | grep ${SERVER} > /dev/null
  then
    return 0
  else
    return 1
  fi
}

start() {
  if server_running
  then
    echo "${SCREENAME} is already running!"
  else
    as_user "cd ${HOME} && ${INVOCATION}"
    if server_running
    then
      echo "${SCREENAME} is now running."
    else
      echo "Error! Could not start ${SCREENAME}!"
    fi
  fi
}

stop() {
  if server_running
  then
    echo "Stopping ${SCREENAME}"
    screen -S ${SCREENAME} -X quit
  else
    echo "${SCREENAME} was not running."
  fi
}

view() {
  echo "IMPORTANT: leave console with CTRL + A + D, otherwise the server will crash"
  echo "console opens in 3 seconds"
  sleep 3
  screen -r ${SCREENAME}
}

case "$1" in
  start)
    start
    ;;
  view)
    view
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    sleep 5
    start
    ;;
  status)
    if server_running
    then
      echo "${SCREENAME} is running."
    else
      echo "${SCREENAME} is not running."
    fi
    ;;

  *)
  echo "Usage: $0 {start|view|stop|status|restart}"
  exit 1
  ;;
esac

exit 0
