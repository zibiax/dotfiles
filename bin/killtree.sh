#!/bin/bash

killtree() {
    local _pid=$1
    local _sig=${2:-TERM}
    for _child in $(pgrep -P $_pid); do
        killtree $_child $_sig
    done
    kill -$_sig $_pid
}

