arr=( 172.27.80.55 )
# arr=(1 2 3 4 5)
j = 1
for i in "${arr[@]}"
do
ping -c 1 $i
STATUS=$?
if [ $STATUS -ne 0 ]; then
   echo "$i is down -------------------------------------------------------------------------------------->"
else
    xterm -hold -e sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no cps@$i "sudo -S kill -9 $(lsof -t -i:27017)" &
    sleep 5
    xterm -hold -e sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no cps@$i "cd Desktop/py3CS/dbState && sudo -S ./mongoReplicSetup.sh" &
    sleep 5
    xterm -hold -e sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no cps@$i "cd Desktop/py3CS && python3 wrapperkafka.py" &
    echo "$i  with $j is up ------------------------------------------------------------------------------------------->"
    ((j=j+1))
    # sshpass -p "cps@123" ssh -o StrictHostKeyChecking=no cps@172.27.80.61 
fi;

done
# && sudo -S kill -9 $(lsof -t -i:27017) 
# while [ $i -lt ${arr[@]}]
# do 
#  echo $arr[$i] 
#  $i = $i + 1
# done

# ping -c 1 172.27.80.51
# STATUS=$?
# if [ $STATUS -ne 0 ]; then
#    echo "The host is down"
# else
#     sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no cps@172.27.80.51 "cd Downloads/Not_Imp/BitBucket/blockchain-ms/ && python3 manage.py runserver 0:8000"
#     echo "MS is up"
#     # sshpass -p "cps@123" ssh -o StrictHostKeyChecking=no cps@172.27.80.61 
# fi

# rm -r /tmp/zookeeper
# rm -r /tmp/kafka-logs
# echo "deleted tm"
# xterm -e bin/zookeeper-server-start.sh config/zookeeper.properties &
# sleep 10
# xterm -e bin/kafka-server-start.sh config/server.properties &
# sleep 10
# #rm topicstodel.txt
# bin/kafka-topics.sh --list --bootstrap-server localhost:9092 >> topicstodel.txt
# #cat a.txt

# input="topicstodel.txt"
# while IFS= read -r line
# do
#         if [ -z "$line" ]
#         then
#       echo "Is empty"
#       break
#         else
#       bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic "$line" &
#         fi
#         sleep 10
# done < "$input"
