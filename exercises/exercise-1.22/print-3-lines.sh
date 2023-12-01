#!/bin/sh
racket $(dirname $0)/index.rkt | grep -F "***" | head -n 3
