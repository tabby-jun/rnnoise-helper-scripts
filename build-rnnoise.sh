#!/usr/bin/env bash

(
  cd rnnoise
  ./autogen.sh
  ./configure
  make
)
