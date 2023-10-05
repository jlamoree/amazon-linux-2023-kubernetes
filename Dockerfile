FROM amazonlinux:2023.2.20230920.1

COPY <<EOF /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.27/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.27/rpm/repodata/repomd.xml.key
EOF

RUN dnf install -y awscli-2 kubectl git tar vi bash-completion

WORKDIR /root

RUN git clone https://github.com/ahmetb/kubectx .kubectx && \
    chmod 755 .kubectx/kubectx && \
    ln -s .kubectx/completion/kubectx.bash /etc/bash_completion.d/kubectx && \
    echo -e '\nexport PATH=/root/.kubectx:$PATH' >> .bash_profile && \
    echo 'complete -C /usr/bin/aws_completer aws' >> .bash_profile

CMD /bin/bash --login
