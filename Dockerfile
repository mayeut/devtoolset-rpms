FROM ghcr.io/mayeut/devtoolset-rpms:v22.02.06

# update tools
RUN dnf -y upgrade && \
    dnf clean all && \
    rm -rf /var/cache/yum

# update devtoolset-10-i386
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-10-i386 \
        --repofrompath=devtoolset-10-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/custom-1-i386/

# update devtoolset-11-i386
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-11-i386 \
        --repofrompath=devtoolset-11-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-11/custom-1-i386/

# Example /etc/yum.repos.d/mayeut-devtoolset-8-i386.repo
#[copr:copr.fedorainfracloud.org:mayeut:devtoolset-8-i386]
#name=Copr repo for devtoolset-8-i386 owned by mayeut
#baseurl=http://192.168.1.1:8080/repos/devtoolset-8-i386/
#type=rpm-md
#skip_if_unavailable=True
#gpgcheck=1
#gpgkey=http://192.168.1.1:8080/repos/devtoolset-8-i386-pubkey.gpg
#repo_gpgcheck=0
#enabled=1
#enabled_metadata=1
