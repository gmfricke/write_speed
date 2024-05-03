#!/bin/bash
# Matthew Fricke <mfricke@carc.unm.edu>, July 17th, 2020 
# Takes two arguments:
if [ "$#" -ne 3 ]
then
  echo "Usage: <output path> <number_of_files> <file_size (K,M,G, etc)>"  >&2
  exit 1
fi

OUTPUT_PATH=$1
NUM=$2
SIZE=$3

echo "This script will use $SIZE RAM"

echo Writing $NUM files of size $SIZE to $OUTPUT_PATH 

n=0
while [ $n -lt $NUM ]
do
  FILE_PATH=$OUTPUT_PATH/test${n}.file
  dd if=/dev/urandom of=$FILE_PATH bs=$SIZE count=1 oflag=dsync iflag=fullblock  
  n=$(( $n + 1 ))
done
