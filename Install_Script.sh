set -exu 
sudo apt-get -qq update
sudo apt-get -qq install npm
sudo npm install -g @bazel/bazelisk
sudo apt-get -qq install python3-pip python3-dev python3-setuptools
pip3 install --upgrade pip
pip3 install selenium
if [ ! -d ./onos ]; then
	    sudo git clone https://gerrit.onosproject.org/onos
	        cd onos
	else
		    cd onos
		        sudo git checkout master
			    sudo git pull
		    fi
		    sudo git fetch
		    sudo git checkout 2.5.0
		    #retry (bazel)
		    sudo bazel build onos 
		    #sudo bazel run onos-local -- clean debug &>/dev/null &
		    #sleep 1m
		    #./tools/test/bin/onos onos@localhost
		    sudo apt-get -qq install mininet
		    sudo apt-get -qq update
		    sudo apt-get -qq install -y lsb-release
		    sudo apt-get -qq clean all
		    sudo apt-get -qq install apt-transport-https ca-certificates curl gnupg lsb-release
		    if [ ! -f /usr/share/keyrings/docker-archive-keyring.gpg ]; then
			        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
			fi
			echo \
				  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
				    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
			sudo apt-get -qq update
			sudo apt-get -qq install docker-ce docker-ce-cli containerd.io
			cd
			if [ ! -d ./SDN_2021_Summer_Research ]; then
				    sudo git clone https://github.com/coalvoltage/SDN_2021_Summer_Research
				        cd SDN_2021_Summer_Research
				else
					    cd SDN_2021_Summer_Research
					        git pull
					fi
					sudo apt-get -qq install sshpass
					cp -R config ~/config
					cp -R configAuto ~/configAuto
					cd scripts
					sudo chmod u+x multiNode.sh

