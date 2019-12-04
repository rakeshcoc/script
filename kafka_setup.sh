i=172.27.80.61
sshpass -p "cps@123" ssh -o StrictHostKeyChecking=no -X cps@$i "cd Documents/kafka_2.12-2.3.0 && ./setup.sh"