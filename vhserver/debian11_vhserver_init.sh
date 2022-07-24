#!/bin/bash
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

git config --global user.email "medaluka@gmail.com"
git config --global user.name "Luka Medic"


git clone git@github.com:medaluka/valheim_Hellheim_server.git


./linuxgsm.sh vhserver

vhserver auto-install

cat <<EOF > ~/lgsm/config-lgsm/vhserver/vhserver.cfg
##################################
####### Instance Settings ########
##################################
# PLACE INSTANCE SETTINGS HERE
## These settings will apply to a specific instance.
servername="Playground"
# Minimum password length is 5.
serverpassword="123valheim123"
gameworld="Hellheim"
EOF

mkdir -p /home/vhserver/.config/unity3d/IronGate/Valheim/worlds_local/

tar -xvzf /home/vhserver/valheim_Hellheim_server/backup_latest/Hellheim.tar.gz -C /home/vhserver/.config/unity3d/IronGate/Valheim/worlds_local/

vhserver start

sleep 30

vhserver details
