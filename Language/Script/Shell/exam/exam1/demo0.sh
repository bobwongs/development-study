# ! /bin/bash

killProcess() {
    ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

killProcess 'WeChat'  # Kill WeChat