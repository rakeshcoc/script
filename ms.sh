ping -c 1 172.27.80.51
STATUS=$?
if [ $STATUS -ne 0 ]; then
   echo "The host is down"
else
    sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no cps@172.27.80.51 "cd Downloads/Not_Imp/BitBucket/blockchain-ms/ && python3 manage.py runserver 0:8000"
    echo "MS is up"
    # sshpass -p "cps@123" ssh -o StrictHostKeyChecking=no cps@172.27.80.61 
fi


