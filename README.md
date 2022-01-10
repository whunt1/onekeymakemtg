
# 编译安装最新版 mtproxy-go 一键脚本   
因为go版mtproxy代码更新了抗重放攻击等功能后，原作者没有直接放出编译好的程序，所以根据逗比原版一键脚本魔改，直接拉取最新代码进行编译，**最新版已经支持 TLS 伪装**
   
* 脚本说明: Mtproto Proxy Go版 一键编译安装管理脚本
* 系统支持: CentOS6+ / Debian7+ / Ubuntu14+
* 使用参考: https://doubibackup.com/es5fj9se.html
   
下载安装:

```bash
wget -N --no-check-certificate https://github.com/whunt1/onekeymakemtg/raw/master/mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh
```

> 配置文件在 `/usr/local/mtproxy-go/mtproxy.conf` ，可以手动修改，配置项详细介绍参见 [mtg 文档](https://github.com/9seconds/mtg#environment-variables)
>    
> go 安装目录在 `/tmp/go` ，可以手动删除

------

# 编译安装最新go版mtproxy教程

有空的话我会更新编译好的文件到 [builds](https://github.com/whunt1/onekeymakemtg/tree/master/builds) 
    
使用如下命令下载安装（以 linux-amd64 为例）
    
```bash
# Ubuntu/Debian
apt-get install -y psmisc
wget -O mtg --no-check-certificate https://raw.githubusercontent.com/whunt1/onekeymakemtg/master/builds/mtg-linux-amd64
mv mtg /usr/local/bin/mtg
chmod +x /usr/local/bin/mtg
# CentOS
yum install -y psmisc
wget -O mtg --no-check-certificate https://raw.githubusercontent.com/whunt1/onekeymakemtg/master/builds/mtg-linux-amd64
mv mtg /usr/local/bin/mtg
chmod +x /usr/local/bin/mtg
```

下载完成后直接参考[使用方法](#运行)，以下为详细手动安装步骤

## 安装基础环境 

选择对应系统执行以下命令

```bash
# Ubuntu/Debian
apt-get install -y git gcc automake autoconf libtool make psmisc
# CentOS
yum install -y git gcc automake autoconf libtool make psmisc
```

## 安装 go

下载安装go语言编译环境

```bash
wget -N --no-check-certificate https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz 
tar -xvf go1.13.4.linux-amd64.tar.gz && rm -rf go1.13.4.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/mtg/tmp
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
cd $HOME
```

## 编译安装

拉取 mtproxy-go 源码并编译安装，编译完成过后，输出在当前目录，文件名为 mtp

```bash
git clone -b master https://github.com/9seconds/mtg.git $HOME/mtg
cd $HOME/mtg
go mod download
go build
mv $HOME/mtg/mtg /usr/local/bin/mtg
chmod +x /usr/local/bin/mtg
```

## 运行

直接输入 `mtg` 即可调用

查看帮助：`mtg -h`

查看生成密钥帮助：`mtg help generate-secret`

查看运行帮助：`mtg help run`

生成普通密钥：`mtg generate-secret simple`

生成普通安全密钥：`generate-secret secured`

生成TLS伪装密钥（以 `itunes.apple.com` 为例）：`mtg generate-secret -c itunes.apple.com tls`

运行示例：

```bash
mtg run -b 0.0.0.0:443 --cloak-port=443 ee055a9b283c6ef2fbea89a374df31e7966974756e65732e6170706c652e636f6d
```

后台运行：

```bash
nohup mtg run -b 0.0.0.0:443 --cloak-port=443 ee055a9b283c6ef2fbea89a374df31e7966974756e65732e6170706c652e636f6d >> /tmp/mtg.log 2>&1 &
```
查看日志：`cat /tmp/mtg.log`

结束进程：`killall mtg`

更多运行参数参见 [mtg 文档](https://github.com/9seconds/mtg#environment-variables)

# [Merged]一键编译安装最新的 MTProxy-Go（修复版）

## 修复记录

- **2021/06/22:** 修复 MTProxy-Go 升级至 v2 版本后，仓库分支名变更
- **2020/12/05:** 修复 Golang 下载地址错误

## 如何使用

```bash
wget -N --no-check-certificate https://github.com/if1y/MTProxy-GO_OnekeyMake/raw/master/mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh
```

## 其它信息

- **系统支持:** CentOS6+ / Debian7+ / Ubuntu14+
- **配置路径:** `/usr/local/mtproxy-go/mtproxy.conf`
- **Golang路径:** `/tmp/go`
- **原版作者:** https://github.com/whunt1/onekeymakemtg
