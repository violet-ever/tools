#!/bin/bash
#nginx目录
nginx_path=/home/hynetic/runtime/nginx-1.14.2

#用于备份的日志存放路径
path_bak=$nginx_path/logs-bak
#判断日志备份文件夹是否存在，不存在则创建
if [ ! -d $path_bak ]; then
	mkdir $path_bak
fi
#昨天的日期
time_path=$(date +%Y%m%d -d 'yesterday')
#判断日志备份'天'文件夹是否存在，不存在则创建
if [ ! -d $path_bak/$time_path ]; then
	mkdir $path_bak/$time_path
fi

replace_path=/logs-bak/$time_path/

#循环备份文件
files=$(ls $nginx_path/logs/*.log)
for file in $files
do 
cp $file ${file/\/logs\//$replace_path} && echo '' > $file;
done;