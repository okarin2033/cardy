#!/bin/bash

# Server details
SERVER_IP="91.103.253.102"
SERVER_USER="root"
SERVER_PASSWORD="VuxNcMMQ2l7i"
REMOTE_DIR="/root/language-app"

# Create a temporary file for sshpass
echo "#!/bin/bash" > temp_script.sh
echo "sshpass -p \"$SERVER_PASSWORD\" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP 'mkdir -p $REMOTE_DIR'" >> temp_script.sh
echo "sshpass -p \"$SERVER_PASSWORD\" scp -r ./* $SERVER_USER@$SERVER_IP:$REMOTE_DIR/" >> temp_script.sh
echo "sshpass -p \"$SERVER_PASSWORD\" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP 'cd $REMOTE_DIR && chmod +x deploy.sh && ./deploy.sh'" >> temp_script.sh

# Make the script executable and run it
chmod +x temp_script.sh
./temp_script.sh

# Clean up
rm temp_script.sh
