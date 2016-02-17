FROM alpine:3.3

# see https://github.com/coreos/etcd/issues/4234
ENV _ETCD_VERSION=2.2.5

RUN apk add --no-cache --update ca-certificates openssl tar &&\
    wget -q -O - "https://github.com/coreos/etcd/releases/download/v${_ETCD_VERSION}/etcd-v${_ETCD_VERSION}-linux-amd64.tar.gz" | \
    tar xzv --strip-components 1 -C /bin/ etcd-v${_ETCD_VERSION}-linux-amd64/etcd \
                                          etcd-v${_ETCD_VERSION}-linux-amd64/etcdctl && \
    apk del --purge tar

VOLUME      /data
EXPOSE      2379 2380 4001 7001
ADD         run.sh /bin/run.sh
ENTRYPOINT  ["/bin/run.sh"]
