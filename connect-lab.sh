#!/bin/bash
INSTANCE_ID="i-0c8bdcc931012e6af"
KEY_PATH="~/.ssh/academy-labs-key.pem"

echo "Getting instance IP..."
IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

if [ "$IP" == "None" ] || [ -z "$IP" ]; then
echo "Instance is not running or has no IP!"
echo "Start it first with: aws ec2 start-instances --instance-ids $INSTANCE_ID"
exit 1
fi

echo "Connecting to $IP..."
ssh -i ~/.ssh/academy-labs-key.pem ubuntu@$IP
