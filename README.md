# 一键编译安装最新的 MTProxy-Go（修复版）

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
