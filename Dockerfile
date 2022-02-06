FROM almalinux:8

# install tools
RUN dnf -y upgrade && \
    dnf install -y curl httpd yum-utils && \
    dnf clean all && \
    rm -rf /var/cache/yum

# expose repositories from apache
RUN ln -s /repos /var/www/html/repos

# save devtoolset-8-i386
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-8-i386 \
        --repofrompath=devtoolset-8-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-8-i386/custom-1-i386/
RUN curl -fsSLo /repos/devtoolset-8-i386-pubkey.gpg https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-8-i386/pubkey.gpg

# save devtoolset-10-i386
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-10-i386 \
        --repofrompath=devtoolset-10-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/custom-1-i386/
RUN curl -fsSLo /repos/devtoolset-10-i386-pubkey.gpg https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-10/pubkey.gpg

# save devtoolset-11-i386
RUN reposync \
        --download-metadata --remote-time --download-path=/repos \
        --repo=devtoolset-11-i386 \
        --repofrompath=devtoolset-11-i386,https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-11/custom-1-i386/
RUN curl -fsSLo /repos/devtoolset-11-i386-pubkey.gpg https://download.copr.fedorainfracloud.org/results/mayeut/devtoolset-11/pubkey.gpg

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]

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
