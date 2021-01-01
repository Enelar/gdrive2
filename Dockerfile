FROM fedora as build

RUN dnf install -y git cmake libgcrypt-devel gcc-c++ libstdc++ yajl-devel boost-devel libcurl-devel expat-devel binutils zlib
RUN git clone https://github.com/vitalif/grive2 /src
RUN cd /src && mkdir build && cd build && cmake .. && make -j4 && make install
RUN ls /usr/local/bin
RUN mkdir /result && cp --parents /usr/local/bin/grive /usr/lib64/libyajl.so* /result

FROM fedora as deps
RUN dnf install -y boost libgcrypt-devel libcurl expat yajl \
  	&& dnf clean all \
  	&& rm -rf /var/cache/yum

FROM deps as test
COPY --from=build /result /result
COPY --from=build /result /
RUN if [[ ! $(grive -h) ]]; then exit 1; fi

FROM deps
ENTRYPOINT ["/usr/local/bin/grive"]
COPY --from=test /result /