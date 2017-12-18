#!/bin/bash

cd /home/ubuntu/
source run.sh

R_PATH=/home/ubuntu/project/sj/sampledGraph
mkdir $R_PATH
for number in 0 1 2 3 4 5 
#for number in 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99

do
  mkdir $R_PATH/$number
  echo "$number"
  for ratio in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
  do
    mkdir $R_PATH/$number/$ratio
    for method in random randomEdge randomWalk
    do
      INAME=hdfs://10.254.0.111:8020/project/$number
      ONAME=$R_PATH/$number/$ratio/$method
      mkdir $ONAME
      cd $ONAME
      echo "input path $INAME"
      echo "output path $ONAME"
      START=$(date +%s)
      /home/ubuntu/software/spark-2.0.0-bin-hadoop2.6/bin/spark-submit   --class "GraphSample"  --master spark://10.254.0.111:7077  /home/ubuntu/project/sj/sampling/target/scala-2.11/question1_2.11-1.0.jar $method $ratio $INAME graph 
      END=$(date +%s)
      DIFF=$(( $END - $START ))
      echo "Data: $number $method $ratio Program run time : $DIFF"
      echo "Data: $number $method $ratio Runtime: $DIFF" >> /home/ubuntu/project/sj/sampling/runtime

    done
  done
done

echo "Done"
