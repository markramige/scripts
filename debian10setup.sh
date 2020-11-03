#!/bin/bash

cd $HOME
#sudo sed -i 's/$/ contrib non-free/' /etc/apt/sources.list ##gcloud
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y build-essential curl wget whois git nmap tmux gron \
                 bash-completion python python3 python3-pip python3-venv \
                 unzip p7zip docker.io docker-compose net-tools ufw jq sqlmap \
                 masscan zmap dirb figlet rustc rename ruby-full parallel \
                 findutils grc fzf htop strace silversearcher-ag \
                 libnet-ssleay-perl
sudo apt -t buster-backports install -y golang-go tor npm
sudo gpasswd -a $USER docker
sudo ufw limit 22/tcp
sudo ufw --force enable

###C###########################################################################
#massdns
git clone https://github.com/blechschmidt/massdns $HOME/bin/massdns
cd $HOME/bin/massdns
make
cd $HOME
mv $HOME/bin/massdns/bin/massdns $HOME/.local/bin/

###DOCKER######################################################################
#witnessme
docker pull byt3bl33d3r/witnessme
mkdir $HOME/witnessme
# docker run --name=witnessme -it --entrypoint=/bin/sh -v $HOME/witnessme:/transfer IMAGEID

###GO##########################################################################
# amass
GO111MODULE=on go get -u -v github.com/OWASP/Amass/v3/...

# dnsprobe
GO111MODULE=on go get -u -v github.com/projectdiscovery/dnsprobe

# ffuf
go get -u github.com/ffuf/ffuf

# gf
go get -u github.com/tomnomnom/gf

#gofingerprint
git clone https://github.com/Static-Flow/gofingerprint $HOME/bin/gofingerprint
go build $HOME/bin/gofingerprint/cmd/gofingerprint/gofingerprint.go
mv gofingerprint $HOME/bin/gofingerprint/

# gospider
go get -u github.com/jaeles-project/gospider

# hakrawler
go get -u github.com/hakluke/hakrawler

#httprobe
go get -u github.com/tomnomnom/httprobe

# meg
go get -u github.com/tomnomnom/meg

# metabigor
go get -u github.com/j3ssie/metabigor

# nuclei
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
$HOME/go/bin/nuclei -update-templates

# pathbrute
git clone https://github.com/milo2012/pathbrute $HOME/bin/pathbrute
go get -u github.com/mkideal/cli
go get -u github.com/badoux/goscraper
go get -u github.com/fatih/color
go get -u github.com/hashicorp/go-version
go get -u github.com/xrash/smetrics
go get -u github.com/ti/nasync
go get -u github.com/mattn/go-sqlite3
go build $HOME/bin/pathbrute/pathBrute.go
mv pathBrute $HOME/bin/

# shosubgo
wget https://github.com/incogbyte/shosubgo/releases/download/1.1/shosubgo_linux_1_1 -O $HOME/bin/shosubgo
chmod +x $HOME/bin/shosubgo

#shuffledns
GO111MODULE=on go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns

# subfinder
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# subover
go get github.com/Ice3man543/SubOver

# unfurl
go get -u github.com/tomnomnom/unfurl

#waybackurls
go get -u github.com/tomnomnom/waybackurls

###LISTS#######################################################################
mkdir $HOME/lists
git clone --depth 1 https://github.com/danielmiessler/SecLists.git $HOME/lists/seclists
wget https://gist.github.com/nullenc0de/96fb9e934fc16415fbda2f83f08b28e7/raw/146f367110973250785ced348455dc5173842ee4/content_discovery_nullenc0de.txt -O $HOME/lists/content_discovery_nullenc0de.txt
wget https://gist.github.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt -O $HOME/lists/content_discovery_all.txt
wget https://gist.github.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt -O $HOME/lists/all.txt
diff -u $HOME/lists/content_discovery_nullenc0de.txt $HOME/lists/content_discovery_all.txt > $HOME/lists/content_discovery.txt
wget https://gist.github.com/jhaddix/78cece26c91c6263653f31ba453e273b/raw/a4869d58a5ce337d1465c2d1b29777b9eecd371f/cloud_metadata.txt -O $HOME/lists/cloud_metadata.txt
wget https://gist.github.com/jhaddix/77253cea49bf4bd4bfd5d384a37ce7a4/raw/ca20c5d8543ef3404b6032938162790636f89241/Github%2520bash%2520generated%2520search%2520links%2520(from%2520hunter.sh) -O $HOME/lists/github_search.txt

###NODE########################################################################
#retire.js
mkdir $HOME/bin/retirejs
cd $HOME/bin/retirejs
npm install retire
cd $HOME
ln -s $HOME/bin/retirejs/node_modules/retire/bin/retire $HOME/bin/

###PERL########################################################################
#nikto
git clone https://github.com/sullo/nikto $HOME/bin/nikto

###PYTHON######################################################################
# aiodnsbrute
python3 -m pip install -U --user aiodnsbrute

#altdns
python3 -m pip install -U --user py-altdns
sed -i 's/from Queue import/from queue import/g' $HOME/.local/lib/python3.7/site-packages/altdns/__main__.py
sed -i 's/if len(result) is 1/if len(result) == 1/g' $HOME/.local/lib/python3.7/site-packages/altdns/__main__.py
sed -i 's/is not/!=/g' $HOME/.local/lib/python3.7/site-packages/altdns/__main__.py

# asnlookup
git clone https://github.com/yassineaboukir/Asnlookup $HOME/bin/asnlookup
python3 -m pip install -U --user -r $HOME/bin/asnlookup/requirements.txt

#brutespray
git clone https://github.com/x90skysn3k/brutespray $HOME/bin/brutespray
python3 -m pip install -U --user -r $HOME/bin/brutespray/requirements.txt

#cloud_enum
git clone https://github.com/initstring/cloud_enum $HOME/bin/cloud_enum
python3 -m pip install -U --user -r $HOME/bin/cloud_enum/requirements.txt

# domlink
git clone https://github.com/vysecurity/DomLink $HOME/bin/domlink
python3 -m pip install -U --user -r $HOME/bin/domlink/requirements.txt

#favfreak
git clone https://github.com/devanshbatham/FavFreak $HOME/bin/favfreak
python3 -m pip install -U --user mmh3

# getrelationship.py
wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/getrelationship.py -O $HOME/bin/getrelationship.py
python3 -m pip install -U --user lxml

# github-search
git clone https://github.com/gwen001/github-search $HOME/bin/github-search
python3 -m pip install -U --user -r $HOME/bin/github-search/requirements3.txt

# httpx
python3 -m pip install -U --user httpx

#jsmon
git clone https://github.com/robre/jsmon $HOME/bin/jsmon
python3 $HOME/bin/jsmon/setup.py install --user

#subdomainizer
git clone https://github.com/nsonaniya2010/SubDomainizer $HOME/bin/subdomainizer
python3 -m pip install -U --user -r $HOME/bin/subdomainizer/requirements.txt

# sublist3r
git clone https://github.com/aboul3la/Sublist3r $HOME/bin/sublist3r
python3 -m pip install -U --user -r $HOME/bin/sublist3r/requirements.txt

#subscraper
git clone https://github.com/m8r0wn/subscraper $HOME/bin/subscraper
python3 $HOME/bin/subscraper/setup.py install --user
python3 -m pip install -U --user ipparser

###RUST########################################################################
# bat
cargo install --locked bat

# rustscan
cargo install --locked rustscan

###SHELL#######################################################################
#dnmasscan
wget https://github.com/rastating/dnmasscan/raw/master/dnmasscan -O $HOME/bin/dnmasscan
chmod +x $HOME/bin/dnmasscan


echo 'done'
