#!/bin/bash
bash_path=$(cd "$(dirname "$0")";pwd)
source $bash_path/base.config

echo "该脚本将会把" $serverA "机器上的" $document "目录同步到" $serverB "机器上";
read -p "是否要继续？(y|n) "
 
rs() {
    /usr/bin/rsync -azP \
    --exclude logs \
    --exclude upload \
    --exclude caches \
    --exclude tmp \
$document/ $serverB:$parent/$document/
 
}
 
if [ $REPLY == 'y' -o $REPLY == 'Y' ]
then
    echo "即将同步……"
    sleep 2
    cd $parent
    rs $serverB
#    rs C
    echo "同步完成。"   
elif [ $REPLY == 'n' -o $REPLY == 'N' ]
then
    exit 1
else
    echo "请输入字母y或者n"
fi
