#!/usr/bin/env bash

useradd -m -G docker -s /bin/rbash dave
passwd -d dave

mv -v /tmp/sshd_config /etc/ssh/sshd_config
mv -v /tmp/issue.net /etc/issue.net

systemctl restart sshd

echo "flag{`openssl rand -hex 64`}" > /flag.txt
chmod 400 /flag.txt
cat /flag.txt
