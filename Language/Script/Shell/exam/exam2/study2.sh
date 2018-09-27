#!/bin/bash

# 传入参数：
#   dir：指定目录dir，除.txt之外的所有文件  $1
#   backupDir：拷贝到的目录  $2
#   miniSize：最小大小  $3
#   x：前x个文件  $4

# 流程：切目录 - 找目标文件路径 - 循环检查文件大小 - 拷贝前x个大于miniSize的 - 做排序

# 待解决问题：如何遍历文件名

x=5
miniSize=80
backupDir=backupDir
mkdir $backupDir

getSize() {
    return `du $1 | awk '{print $1}'`
}

# cd $1
cd source

count=0
arr=(1)

find . ! -name '*txt' ! -name '*.DS_Store' ! -name '.' | while read line
do
if [ `du $line | awk '{print $1}'` -ge $miniSize ]
then
    # echo 'file: '$line
    # du $line
    
    arr=(${arr[*]} $line)
    echo "--${arr[*]}"

    # cp $line ../backupDir
    

    # echo '数组：'
    # for var in ${array[*]} 
    # do    
    #     echo "打印的内容："$var
    # done
fi
# count=`expr $count + 1`
# # echo "count: $count"
# if [ $count -ge $x ]
# then
#     break
# fi
# echo "===${arr[*]}"
# exit 0
done
echo "===${arr[*]}"
exit 0


# # array=(1 2 3)
# echo '文件排序输出'
# for var in ${array[*]}
# do
#     # getSize $line
#     # echo $line'+'$?
#     echo "Content: "$var
# done

# # len=${#array[@]}
 
# # for((i=0; i<$len; i++))
# # do
# #     for((j=i+1; j<$len; j++))
# #     do
# #         getSize ${array[i]}
# #         former=$?
# #         getSize ${array[j]}
# #         latter=$?
# #         if [[ former -gt latter ]]
# #         then
# #         temp=${array[i]}
# #         array[i]=${array[j]}
# #         array[j]=$temp
# #         fi
# #     done
# # done

# # echo '按类型排序'
# # array_types=[]

# arr=()
# for a in "1 2 3 "
# do
# if [[ true ]]
# then
#      arr=(${arr[*]} "$a")
# fi

# done
# echo ${arr[*]}