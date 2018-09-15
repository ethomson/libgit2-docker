FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install -y curl apt-transport-https
RUN curl -sSL "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" | apt-key add -
RUN echo "deb https://dl.bintray.com/libgit2/ci-dependencies trusty libgit2deps" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git cmake libssl-dev libcurl3 libcurl3-gnutls libcurl4-gnutls-dev libssh2-1-dev valgrind openssh-client openssh-server openjdk-7-jre
RUN mkdir /var/run/sshd
