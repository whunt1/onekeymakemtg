# 编译安装最新版 mtproxy-go 一键脚本   
因为go版mtproxy代码更新了抗重放攻击等功能后，原作者没有直接放出编译好的程序，所以根据逗比原版一键脚本魔改，直接拉取最新代码进行编译
   
* 脚本说明: Mtproto Proxy Go版 一键编译安装管理脚本
* 系统支持: CentOS6+ / Debian7+ / Ubuntu14+
* 使用参考: https://doubibackup.com/es5fj9se.html
   
下载安装:
```bash
wget -N --no-check-certificate https://github.com/whunt1/onekeymakemtg/raw/master/mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh
```

------

# 编译安装最新go版mtproxy教程
安装基础环境   
```bash
# Ubuntu/Debian
apt-get install -y git gcc
# CentOS
yum install -y git gcc
```
安装原版逗比一键脚本   
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh
```
安装完成后执行 `bash mtproxy_go.sh` 停止mtp   
然后下载安装go语言编译环境   
```bash
wget -N --no-check-certificate https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && tar -xvf go1.10.1.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/mtg
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
cd $HOME
```
拉取 mtproxy-go 源码   
```bash
go get github.com/9seconds/mtg
cd $HOME/mtg/src/github.com/9seconds/mtg
```
只编译本机，编译完成过后，在当前目录，文件名为 mtp   
```bash
make
mv mtg /usr/local/mtproxy-go/mtg
```
>跨平台编译，编译完成过后在 ccbuilds 目录   
>```bash
>make crosscompile
>cd ccbuilds/
>```
>移动对应编译好的程序覆盖旧版程序   
>```bash
>mv mtg-linux-amd64 /usr/local/mtproxy-go/mtg
>```
修改文件权限并重新运行   
```bash
chmod +x /usr/local/mtproxy-go/mtg
```
执行 `bash mtproxy_go.sh` 再次启动mtp
