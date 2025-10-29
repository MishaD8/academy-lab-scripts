#!/bin/bash
INSTANCE_ID="i-0c8bdcc931012e6af"


echo "Starting your academy lab..."
aws ec2 start-instances --instance-ids $INSTANCE_ID

echo "Waiting for instance to start (30 seconds)..."
sleep 30

echo "Getting IP address..."
IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' ->
echo "New IP: $IP"

echo ""
echo "Updating SSH configs..."

# Update WSL SSH config
sed -i "s/^   HostName .*$/   HostName $IP/" ~/.ssh/config

# Update Windows SSH config using PowerShell script
powershell.exe -ExecutionPolicy Bypass -File "C:\\Users\\mihae\\update-ssh-config.ps1" -IP "$IP"

echo ""
echo "SSH configs updated - WSL and Windows"
echo "You can now:"
echo "  - From WSL: ssh academy-lab"
echo "  - From VS Code: Connect to 'academy-lab'"
echo ""
echo "Or connect directly with:"
echo "ssh -i ~/.ssh/academy-labs-key.pem ubuntu@$IP"