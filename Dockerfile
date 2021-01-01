FROM fedora as build

RUN dnf install -y git cmake libgcrypt-devel gcc-c++ libstdc++ yajl-devel boost-devel libcurl-devel expat-devel binutils zlib
RUN git clone https://github.com/vitalif/grive2 /src
RUN cd /src && mkdir build && cd build && cmake .. && make -j4 && make install
RUN ls /usr/local/bin
RUN mkdir /result && cp --parents /usr/local/bin/grive /usr/local/share/man/man1/grive.1 /result

FROM fedora
COPY --from=build /result /