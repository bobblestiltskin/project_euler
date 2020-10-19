#!/bin/bash
for file in pe0??
do
  INDEX=${file/pe}
  ../scripts/time1 rust ./pe $INDEX 
done
