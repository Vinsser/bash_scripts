#!/bin/bash

cat ./topics-list | while read topic
do
   # do something with $line here
   kafka-topics --zookeeper <zk_node:port> --topic $topic --describe  | head -n 1
   ## adding new line
done
