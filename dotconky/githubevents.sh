#!/bin/bash

rdata=$(curl -u M4GNV5:d079ce5adc1628d3cebf5a26ed979228775b8c9e https://api.github.com/users/M4GNV5/received_events)
data=$(curl -u M4GNV5:d079ce5adc1628d3cebf5a26ed979228775b8c9e https://api.github.com/users/M4GNV5/events)

for i in {0..7}
do
	evtype=$(echo $data | jq -r ".[$i].type" | rev | cut -c 6- | rev)
	actor=$(echo $data | jq -r ".[$i].actor.display_login")
	repo=$(echo $data | jq -r ".[$i].repo.name")
	printf "%-15s %-15s %s\n" ${evtype:-5} $actor $repo
done

echo ""

for i in {0..7}
do
	evtype=$(echo $rdata | jq -r ".[$i].type" | rev | cut -c 6- | rev)
	actor=$(echo $rdata | jq -r ".[$i].actor.display_login")
	repo=$(echo $rdata | jq -r ".[$i].repo.name")
	printf "%-15s %-15s %s\n" ${evtype:-5} $actor $repo
done
