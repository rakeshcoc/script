arr=( 172.27.80.53 172.27.80.55 172.27.80.60 172.27.80.62)
for i in "${arr[@]}"
do
ping -c 1 $i
STATUS=$?
if [ $STATUS -ne 0 ]; then
   echo "$i is down -------------------------------------------------------------------------------------->"
else
 xterm -hold -e sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no root@$i "cd /home/cps/Desktop/py3CS && python3 wrapperkafka.py" &
 fi;
done