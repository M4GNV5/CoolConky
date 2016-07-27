#!/bin/bash

for x in /home/jakob/.conky/conky_*; do
	conky -c $x &
done

conky -c /home/jakob/.conky/conky.conf &
