if [[ ! -e /tmp/go ]]; then
    apt-get install -y git gcc automake autoconf libtool make psmisc
    go_download_link=$(wget -qO- "https://golang.org/dl/" | sed -n '/class="download downloadBox"/,+1 s/.*href="\([^"]*\).*$/\1/p' | grep "linux-amd64")
        wget -N --no-check-certificate ${go_download_link}
        tar -xf go*linux-amd64.tar.gz && rm -f go*linux-amd64.tar.gz
        mv go /tmp/go
    mkdir /tmp/gopath
fi
export GOROOT=/tmp/go
export GOPATH=/tmp/gopath
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo -e "go 版本:\c" && cat "/tmp/go/VERSION" && echo -e " "
[[ ! -e /tmp/mtg ]] && git clone -b master https://github.com/9seconds/mtg.git /tmp/mtg
cd /tmp/mtg
git reset --hard
git pull
rm -rf /tmp/gopath/pkg
go mod download
echo -e "开始编译" && echo -e " "
make crosscompile
[[ ! -e /tmp/onekeymakemtg ]] && git clone -b master https://github.com/whunt1/onekeymakemtg.git /tmp/onekeymakemtg
cd /tmp/onekeymakemtg
git reset --hard
git pull
mv -f /tmp/mtg/ccbuilds /tmp/onekeymakemtg/builds
git config user.email "email@example.com"
git config user.name "whunt1"
git add .
current_time=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "${current_time}"
store_enable=$(cat /tmp/onekeymakemtg/.git/config | grep store)
[[ -z ${store_enable} ]] && echo "[credential]  
        helper = store" >> /tmp/onekeymakemtg/.git/config
git push -u origin master
