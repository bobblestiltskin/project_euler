#!/bin/bash
#for d in pe001 pe002 pe003 pe004 pe005 pe006 pe007 pe008 pe009 pe010 pe011 pe012 pe013 pe014 pe015 pe016 pe017 pe018 pe019 pe020 pe021 pe022 pe023 pe024 pe025
for d in pe001 pe002 pe003 pe004 pe005 pe006 pe007 pe008 pe009 pe010 pe011 pe012 pe013 pe014 pe015 pe016 pe017 pe018 pe019 pe021 pe022 pe023 pe024
do
	dune init proj $d
	cd $d/bin
	rm main.ml
	ln -sf ../../$d.ml main.ml
	cd ..
	dune build
	cd ..
done
