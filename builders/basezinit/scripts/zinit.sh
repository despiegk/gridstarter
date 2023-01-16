#!/bin/sh

if zinit list; then
    echo 'ZINIT ALREADY ACTIVE'
else
    echo 'ZINIT STARTS'
    zinit init &
fi

echo "ZINIT OK"

sh