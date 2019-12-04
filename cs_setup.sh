arr=( 172.27.80.53 172.27.80.55 172.27.80.60 172.27.80.62)
for i in "${arr[@]}"
do
ping -c 1 $i
STATUS=$?
if [ $STATUS -ne 0 ]; then
   echo "$i is down -------------------------------------------------------------------------------------->"
else
    # rm port.txt
    # touch port.txt
    sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no root@$i "lsof -t -i:27017"> port.txt 
    input="port.txt"
    sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no root@$i "cd /home/cps/Desktop/py3CS/dbState && ./mongoReplicSetup.sh" &
    while IFS= read -r line
    do
    sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no root@$i "kill -9 "$line" && cd /home/cps/Desktop/py3CS/dbState && ./mongoReplicSetup.sh" 
    done < "$input"

    sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no root@$i "cd /home/cps/Desktop/py3CS/dbState && python3 dbDelta.py" &
    # xterm -hold -e sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no root@$i "cd /home/cps/Desktop/py3CS && python3 wrapperkafka.py" &
    # echo "Hello"
fi;
./try_sh.sh
done