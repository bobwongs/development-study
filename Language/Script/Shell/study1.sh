
function test() {
    echo $1
    return 0
}

# test $1
# echo $?

if [[ "hello" =~ "ell" ]]
then
    echo 'contain'
else
    echo 'not contain'
fi