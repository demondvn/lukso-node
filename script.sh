#!/bin/bash
lukso -v 
echo $NODE_NAME | lukso network init --chain l16
lukso network start
