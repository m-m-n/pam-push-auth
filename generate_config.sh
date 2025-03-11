#!/bin/bash

if [ -z "$AUTH_SERVER_BASEURL" ]; then
  echo "環境変数 AUTH_SERVER_BASEURL が設定されていません"
  exit 1
fi

CONFIG_H_PATH=src/config.h

echo "#ifndef CONFIG_H" > $CONFIG_H_PATH
echo "#define CONFIG_H" >> $CONFIG_H_PATH
echo "" >> $CONFIG_H_PATH
echo "#define AUTH_SERVER_BASEURL \"$AUTH_SERVER_BASEURL\"" >> $CONFIG_H_PATH
echo "" >> $CONFIG_H_PATH
echo "#endif" >> $CONFIG_H_PATH
