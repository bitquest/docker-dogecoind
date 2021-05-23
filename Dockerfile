FROM ubuntu:groovy
EXPOSE 44556
EXPOSE 22556
EXPOSE 22555
EXPOSE 44555
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y install git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev
WORKDIR /
ADD http://download.oracle.com/berkeley-db/db-5.1.29.NC.tar.gz /
RUN tar xzvf db-5.1.29.NC.tar.gz
ENV BDB_PREFIX=/db5
RUN mkdir -p ${BDB_PREFIX}
WORKDIR /db-5.1.29.NC/build_unix
RUN sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' /db-5.1.29.NC/src/dbinc/atomic.h
RUN ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=${BDB_PREFIX}
RUN make install
WORKDIR /
RUN git clone https://github.com/dogecoin/dogecoin.git
WORKDIR /dogecoin
RUN ./autogen.sh
RUN ./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/"
RUN make
RUN make install
CMD dogecoind -printtoconsole