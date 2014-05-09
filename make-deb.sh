#!/bin/bash

PREFIX=/opt/logstash-forwarder
VERSION=0.3.1

fpm -s dir -t deb -n logstash-forwarder -v ${VERSION} \
                --replaces lumberjack \
                --exclude '*.a' --exclude 'lib/pkgconfig/zlib.pc' \
                --description "a log shipping tool" \
                --url "https://github.com/elasticsearch/logstash-forwarder" \
                build/bin/logstash-forwarder=${PREFIX}/bin/ \
                build/bin/logstash-forwarder.sh=${PREFIX}/bin/ \
                logstash-forwarder.init=/etc/init.d/logstash-forwarder \
                build/etc/logstash-forwarder.crt=${PREFIX}/etc/ \
                build/etc/logstash-forwarder.key=${PREFIX}/etc/ \
                build/etc/lumberjack.conf=${PREFIX}/etc/
