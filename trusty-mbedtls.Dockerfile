FROM ethomson/libgit2-trusty:latest
RUN git clone --branch mbedtls-2.6.1 https://github.com/ARMmbed/mbedtls.git /tmp/mbedtls
RUN (cd /tmp/mbedtls && CFLAGS=-fPIC cmake -DENABLE_PROGRAMS=OFF -DENABLE_TESTING=OFF -DUSE_SHARED_MBEDTLS_LIBRARY=OFF -DUSE_STATIC_MBEDTLS_LIBRARY=ON .)
RUN (cd /tmp/mbedtls && cmake --build .)
RUN (cd /tmp/mbedtls && make install)
RUN rm -rf /tmp/mbedtls
