FROM ubuntu:19.04
LABEL maintainer="inbox@mrfroll.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV REDUCE_ALGEBRA_SNAPSHOT_VERSION=snapshot_2020-01-01
ENV REDUCE_ALGEBRA_BUILD=5241
ENV GID=1000
ENV UID=1000

RUN apt update \
  && apt install -y wget \
  && wget https://sourceforge.net/projects/reduce-algebra/files/${REDUCE_ALGEBRA_SNAPSHOT_VERSION}/linux64/reduce-complete_${REDUCE_ALGEBRA_BUILD}_amd64.deb/download -O reduce.deb \
  && apt install --no-install-recommends -y ./reduce.deb \
  && rm reduce.deb

RUN addgroup --gid $GID grg-group \
    && adduser -u $UID --disabled-password --gecos "" --force-badname --ingroup grg-group grg-user

RUN wget 'https://reduce-algebra.sourceforge.io/grg32/grg32r6.tar.gz' -O /home/grg-user/grg.tar.gz \
  && cd /home/grg-user/ \
  && mkdir grg \
  && tar xfz grg.tar.gz -C grg

COPY ./bin/install.sh /home/grg-user/grg/install.sh
RUN chmod u+x /home/grg-user/grg/install.sh

RUN cd /home/grg-user/grg/ && ./install.sh && cp /home/grg-user/grg/*.b /usr/lib/reduce/pslbuild/red/

USER grg-user

# WORKDIR /grg

ENTRYPOINT [ "/bin/bash" ]
