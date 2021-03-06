ARG BASE
FROM $BASE

RUN apt-get update
RUN apt-get install -y curl apt-transport-https
RUN curl -sSL "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" | apt-key add -
RUN echo "deb https://dl.bintray.com/libgit2/ci-dependencies trusty libgit2deps" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install clang git cmake libssl-dev libcurl3 libcurl3-gnutls libcurl4-gnutls-dev libssh2-1-dev valgrind openssh-client openssh-server openjdk-7-jre

FROM trusty-openssl AS trusty-mbedtls
RUN git clone --branch mbedtls-2.6.1 https://github.com/ARMmbed/mbedtls.git /tmp/mbedtls
RUN (cd /tmp/mbedtls && CFLAGS=-fPIC cmake -DENABLE_PROGRAMS=OFF -DENABLE_TESTING=OFF -DUSE_SHARED_MBEDTLS_LIBRARY=OFF -DUSE_STATIC_MBEDTLS_LIBRARY=ON .)
RUN (cd /tmp/mbedtls && cmake --build .)
RUN (cd /tmp/mbedtls && make install)
RUN rm -rf /tmp/mbedtls

RUN mkdir /var/run/sshd
