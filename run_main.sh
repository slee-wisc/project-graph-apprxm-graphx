#!/bin/bash

cd /home/ubuntu/
source run.sh

for number in 0 1 2 3 4 5
#for number in 6 7 8 9 10 11
#for number in 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99
do
  echo "$number"
  for ratio in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
  do
    for method in random randomEdge randomWalk snowball
    do
      #START=$(date +%s)
      /home/ubuntu/software/spark-2.0.0-bin-hadoop2.6/bin/spark-submit   --class "ProjectApp"  --master spark://10.254.0.111:7077  /home/ubuntu/project/sj/code/target/scala-2.11/question1_2.11-1.0.jar tc $number $ratio $method --numEPart=20
      #END=$(date +%s)
      #DIFF=$(( $END - $START ))
      #echo "Data: $number $method $ratio Program run time : $DIFF"
      #echo "Data: $number $method $ratio Runtime: $DIFF" >> ./runtime
    done
  done
done

echo "Done"
