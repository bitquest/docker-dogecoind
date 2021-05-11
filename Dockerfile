FROM debian:stable
EXPOSE 44556
EXPOSE 22556
EXPOSE 22555
EXPOSE 44555
ENV DEBIAN_FRONTEND noninteractive
ARG VERSION=1.14.3
WORKDIR /
ADD https://github.com/dogecoin/dogecoin/releases/download/v${VERSION}/dogecoin-${VERSION}-i686-pc-linux-gnu.tar.gz /
RUN tar -xzf /dogecoin-${VERSION}-i686-pc-linux-gnu.tar.gz
# RUN mv /dogecoin-${VERSION}/bin/dogecoind /usr/bin/dogecoind
RUN chmod +x /dogecoin-${VERSION}/bin/*
RUN cp -Rv /dogecoin-${VERSION}/bin/* /usr/bin
# CMD /usr/bin/dogecoind -printtoconsole -shrinkdebugfile
WORKDIR /usr/bin/
CMD ./dogecoind