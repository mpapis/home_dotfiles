#!/usr/bin/env bash

\curl -sSL http://healme.zohosites.com/download-meditations.html |
  \grep -e 'href=".*mp3.*"' |
  \sed -Ee 's#^.*href="(.*)".*$#\1#' | 
  while read f
  do
    echo "$f"
    curl -#LJO -C - "$f"
  done