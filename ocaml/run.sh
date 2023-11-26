#!/bin/bash
for d in pe001 pe002 pe003 pe004 pe005 pe006 pe007 pe008 pe009 pe010 pe011 pe012 pe013 pe014 pe015 pe016 pe017 pe018 pe019 pe020 pe021 pe022 pe023 pe024 pe025
do
	cd $d
	dune exec $d
	cd -
done
