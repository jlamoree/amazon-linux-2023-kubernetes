FROM amazonlinux:2023.2.20231113.0

ARG KUBERNETES_VERSION="1.27"

COPY <<EOF /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v${KUBERNETES_VERSION}/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v${KUBERNETES_VERSION}/rpm/repodata/repomd.xml.key
EOF

RUN dnf update -y && dnf install -y awscli-2 kubectl git tar vi bash-completion && \
    dnf clean all

RUN groupadd -g 1000 user && useradd -u 1000 -g 1000 -m user

RUN git clone https://github.com/ahmetb/kubectx /opt/kubectx && \
    chmod 755 /opt/kubectx/kubectx && ln -s /opt/kubectx/kubectx /usr/bin/kubectx && \
    ln -s /opt/kubectx/completion/kubectx.bash /etc/bash_completion.d/kubectx && \
    echo 'complete -C /usr/bin/aws_completer aws' >> /home/user/.bash_profile && \
    chown user:user /home/user/.bash_profile

WORKDIR /home/user

USER user:user

CMD /bin/bash --login
