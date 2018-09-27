
killProcess() {
    match_text='/Applications/'$1'.app'
    target=`ps -ef | grep $match_text | grep -v 'grep' | sed -n '1p'`
    # line_cout=`echo $target | sed -n '$='`
    # echo $target,$line_cout
    if [ -z "$target" ]
    then
        echo 'Process '$1' Not Running'
        return 0
    fi
    echo 'Process '$1' Running'
    target=`echo $target | cut -d ' ' -f 2`
    echo $target | xargs kill
    return 1
}

openProcess() {
    open '/Applications/'$1'.app'
    echo $1' Already Launch'
}

killProcess $1
running=`echo $?`
echo 'Running: '$running
if [ $running != 1 ]
then
    openProcess $1
fi
