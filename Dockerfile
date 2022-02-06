FROM almalinux:8
RUN dnf -y upgrade && \
    dnf install -y yum-utils curl && \
    dnf clean all && \
    rm -rf /var/cache/yum
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-8-i386 \
        --repofrompath=devtoolset-8-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-8-i386/custom-1-i386/
RUN curl -fsSLo /repos/devtoolset-8-i386-pubkey.gpg https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-8-i386/pubkey.gpg
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-10-i386 \
        --repofrompath=devtoolset-10-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/custom-1-i386/
RUN curl -fsSLo /repos/devtoolset-10-i386-pubkey.gpg https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/pubkey.gpg
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-11-i386 \
        --repofrompath=devtoolset-11-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-11/custom-1-i386/
RUN curl -fsSLo /repos/devtoolset-11-i386-pubkey.gpg https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-11/pubkey.gpg

#[copr:copr.fedorainfracloud.org:mayeut:devtoolset-10]
#name=Copr repo for devtoolset-10 owned by mayeut
#baseurl=https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/custom-1-$basearch/
#type=rpm-md
#skip_if_unavailable=True
#gpgcheck=1
#gpgkey=https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/pubkey.gpg
#repo_gpgcheck=0
#enabled=1
#enabled_metadata=1
