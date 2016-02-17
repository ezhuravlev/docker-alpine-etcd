#!/bin/sh

ETCD_CMD="/bin/etcd -data-dir=/data $*"

$ETCD_CMD
