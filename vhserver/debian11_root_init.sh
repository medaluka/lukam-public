#!/bin/bash
sudo dpkg --add-architecture i386; sudo apt update;sudo apt install -y git bc binutils bsdmainutils bzip2 ca-certificates cpio curl distro-info file gzip hostname jq lib32stdc++6 libc6-dev libsdl2-2.0-0:i386 netcat python3 tar tmux unzip util-linux wget xz-utils 

useradd -m -s /bin/bash vhserver

wget -O /home/vhserver/linuxgsm.sh https://linuxgsm.sh && chmod +x /home/vhserver/linuxgsm.sh

mkdir /home/vhserver/.ssh

cat <<EOF > /home/vhserver/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAnghrl8VxtZyCizvEv6dBvm8xG2cnF/1lHIWUfV7kuiyLaql5
DywDYNyGXQ2N6iwyDUEIOfSWMwIMKkVC058w7dOljsgRDUpU+/jGoIzCkDqrAdL4
7GwkQSmwAPk8MCHRzJFQgxsCi+XRYitdM6tPy5lbQtcJNhs5ype+uqVrFtEkywA9
5oxbx+nKWzxVSHWBTiAN48zbq/XOPb/+uAjo+duzSk0EOaGnmIXc2s/3EchCCUct
GDqq4a+gOtQeAKqLMdGuBkRzYpt7mqeW+Op4l8NxA9MKxh9I0qSOU7MGo18eHhlw
rBxgXA7gqg7jjvu7u5AjPy9952hsqdfHNu208wIDAQABAoIBAHoDtk6wO2MlPAWU
WAxBbxlBcIDf2+dB1dd3q3ZA1giIa/wmbTmxmconefZOiMvM47goBdn5Zh5r7kiU
wUvzFSwKxUDAZ6oDQippobJD+9Sv92ipI1gnBrbpIOMfi8D926Y+bBNNv2GUR12s
bYF/O1TPSw8ISCxmSPCKyNAC9/PcwAxJSNINPPXjtp4pHJcZRtQF2zUDkaRgxCAf
fnIJf8FEA7h1ATohnJbQCzEwwpGr2tZN3Uh55jWJbvf0/a2BdtBI+t/hpDfLNgu3
nymrJZkV7unxBaay2+GW+54eq6RsBzcmQNxwYJOvH5TM0xHTR4ixZNWUCJf09OSg
L0UqFEECgYEAzRZRaUWvY0W7YTyQRFYZuL1cfhXJ4ClCNd3pIqEs8EHaRXGDgSpf
DMCccR6OgUASUw1heVZ2Mbd4lJSPN/1IIfHT0g8MNs+u8Qnse00cECiN59zoVgsD
Wqf4FedwdL6yyi/0JjnGRII+p/SrMA/4Z4+ONYXjdO+On1BtnH/fe78CgYEAxUO2
X5mrJuBSNSQtke/w3F7/TkMmhpSeliTPN6JqOsyg32Ul/LrQ//yO3qK8pR8Qp3R3
ePTE7NfkX8nd0ohOb3lin9EHkNWMLtDF5nDdL03CbUQPA3RwOatTuXB1McBJ1eCP
IY3P6TzGSe5GJ9N9wbc8BZGBodwjZn79WioTo80CgYEAh8NWcVHoINdwi5YECrjU
ni78o5rY4MNvSSl1w67eiM2PKJlUbJUYBuEarueDfpxjhQc+l4xdAdxqvjD5/h51
OcNUbaH4e/BP5tCi85zADxJJnkvmoc74kXLQD+/9ycrToHTOMt/cGE4AHD8jc9We
oy+s/FF9mVNcHqqnZQphbxECgYEAnz+hvB3HQNQ5KXNyYm0sqgr62oh1UpIqUJWY
v5YbYiqN+Kqkdxmt3epawDrqRfcFL9pjFL+tNnK3h+jkbbDieTWqO9C45eCvkZ+z
E+yrcyO4QRN/d0+JxdSc+4hg4/AS61mk0va0ENuiTE7SThZ7YGZ3SxuDZlLcNUNx
blenkUUCgYEAzNstaeDiOcVEXAWc5mkou+kFvrSWnw0RK1utYUrwjkizJpP06kaf
S5FKvFJkBtnMsAXiRNuULbozq40hN7iX61BzReWT8wS9c8r9ujzCY7GwnMSzMSdL
39ob+mPWhlq0oTybR7WjMNQ+s+0/s37bLR6jjwHKD3lR7hdEZIXaqag=
-----END RSA PRIVATE KEY-----
EOF

cat <<EOF > /home/vhserver/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeCGuXxXG1nIKLO8S/p0G+bzEbZycX/WUchZR9XuS6LItqqXkPLANg3IZdDY3qLDINQQg59JYzAgwqRULTnzDt06WOyBENSlT7+MagjMKQOqsB0vjsbCRBKbAA+TwwIdHMkVCDGwKL5dFiK10zq0/LmVtC1wk2GznKl766pWsW0STLAD3mjFvH6cpbPFVIdYFOIA3jzNur9c49v/64COj527NKTQQ5oaeYhdzaz/cRyEIJRy0YOqrhr6A61B4Aqosx0a4GRHNim3uap5b46niXw3ED0wrGH0jSpI5TswajXx4eGXCsHGBcDuCqDuOO+7u7kCM/L33naGyp18c27bTz vhserver@$(hostname)
EOF

chmod 600 /home/vhserver/.ssh/id_rsa*
chown -R vhserver:vhserver /home/vhserver

ln -sf /home/vhserver/vhserver /usr/bin/vhserver

