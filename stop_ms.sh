sshpass -p "cps@123" ssh  -o StrictHostKeyChecking=no cps@172.27.80.51 "kill -l SIGKILL $(lsof -t -i:8000)"
echo "Killed"
