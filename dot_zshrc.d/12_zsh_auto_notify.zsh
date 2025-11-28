znap source MichaelAquilina/zsh-auto-notify

AUTO_NOTIFY_IGNORE+=("x")
AUTO_NOTIFY_IGNORE+=("cm edit")
AUTO_NOTIFY_IGNORE+=("nv")
AUTO_NOTIFY_IGNORE+=("pg")
AUTO_NOTIFY_IGNORE+=("jj")
AUTO_NOTIFY_IGNORE+=("make psql")
AUTO_NOTIFY_IGNORE+=("perldoc")
AUTO_NOTIFY_IGNORE+=("make up shit")
AUTO_NOTIFY_IGNORE+=("make shit")
AUTO_NOTIFY_IGNORE+=("ssh")
AUTO_NOTIFY_IGNORE+=("/usr/bin/ssh")
AUTO_NOTIFY_IGNORE+=("perl /home/fra/bin/nv_sess_load")
AUTO_NOTIFY_IGNORE+=("docker compose logs")
AUTO_NOTIFY_IGNORE+=("tmux")

#export AUTO_NOTIFY_WHITELIST=("paru" "docker")

export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_EXPIRE_TIME=5000
export AUTO_NOTIFY_CANCEL_ON_SIGINT=0

#run disable_auto_notify to disable notify
