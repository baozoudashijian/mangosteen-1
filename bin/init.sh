apt-get update


function title {
  echo
  echo "###############################################################################"
  echo "## $1"
  echo "###############################################################################"
  echo
}

title 'apt-get install'
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

title 'mkdir -p'
mkdir -p /etc/apt/keyrings

title 'curl -fsSL'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

title 'echo deb'
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

title 'apt-get update'
apt-get update

title 'apt-get install docker-ce'
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

title 'docker run hello-world'
docker run hello-world

title '将mangosteen加入docker用户组'
usermod -a -G docker mangosteen

title '设置mangosteen用户可以登录服务器'
cd /home/mangosteen

mkdir .ssh

cp /root/.ssh/authorized_keys /home/mangosteen/.ssh

chown -R mangosteen:mangosteen .ssh