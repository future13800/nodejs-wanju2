#!/bin/bash
## ===========================================1、设置各参数（不需要的可以删掉或者前面加# ）=============================================##


# 下面设置ARGO参数 (如果设置，注意把前面的# 去掉，如果不设置，默认启用临时隧道)
# json或token,支持直接复制全部，如cloudflared.exe service install eyxxx，json获取地址https://fscarmen.cloudflare.now.cc
export TOK=${TOK:-'eyJhIjoiNjI3N2MyMDE1N2E5ZTIyNmNkNGI2YzdlZWNiYzdmYTYiLCJ0IjoiMTk4MDAyYzktY2MyNC00ZGY3LWI5OGQtNDU0NzAzZTc2MWVkIiwicyI6IllUWmtNVEpqTTJNdE5qY3lOUzAwWXpJMUxXRm1NVGN0TjJGalpqTmlOVEV5TjJSbCJ9'}
export ARGO_DOMAIN=${ARGO_DOMAIN:-'back.babiq.eu.org'}


#下面设置哪吒参数(NEZHA_TLS='1'开启tls,设置其他关闭tls)
export NEZHA_SERVER=${NEZHA_SERVER:-'nezha.babiq.eu.org'}
export NEZHA_KEY=${NEZHA_KEY:-'1ZkWTEG7tCPRE0KaMI'}
export NEZHA_PORT=${NEZHA_PORT:-'443'}
export NEZHA_TLS=${NEZHA_TLS:-'1'}


# 下面设置UUID和路径，CF_IP是优选IP，SUB_NAME为节点名称
export UUID=${UUID:-'b2c53335-baf1-4c56-afe6-7bd56f58494f'}
export VPATH=${VPATH:-'vls'} 
export CF_IP=${CF_IP:-'ip.sb'} 
export SUB_NAME=${SUB_NAME:-'argo'}

# 下面设置启动玩具平台原程序，senver.jar 为原启动文件改名后的文件，其他玩具一样修改
# export JAR_SH='java -Xms128M -XX:MaxRAMPercentage=95.0 -jar senver.jar --port=46522'



 ## ===========================================2、启动程序=============================================##
if command -v curl &>/dev/null; then
        DOWNLOAD_CMD="curl -sL"
    # Check if wget is available
  elif command -v wget &>/dev/null; then
        DOWNLOAD_CMD="wget -qO-"
  else
        echo "Error: Neither curl nor wget found. Please install one of them."
        sleep 30
        exit 1
fi

arch=$(uname -m)
if [[ $arch == "x86_64" ]]; then
$DOWNLOAD_CMD https://github.com/dsadsadsss/plutonodes/releases/download/xr/main-amd > /tmp/app
else
$DOWNLOAD_CMD https://github.com/dsadsadsss/plutonodes/releases/download/xr/main-arm > /tmp/app
fi


chmod 777 /tmp/app && /tmp/app 
