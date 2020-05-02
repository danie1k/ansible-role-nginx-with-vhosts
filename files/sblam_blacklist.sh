#!/usr/bin/env bash
set -e

blacklist=$(wget -qO- https://sblam.com/blacklist.txt | sed -E 's/(^[0-9])/deny \1/' | sed -e 's/$/;/')

echo "${blacklist}"
