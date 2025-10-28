#!/bin/bash
INSTANCE_ID="i-0c8bdcc931012e6af"


echo "Starting your academy lab..."
aws ec2 start-instances --instance-ids $INSTANCE_ID

echo "Waiting for instance to start (30 seconds)..."
sleep 30

echo "Getting IP address..."
aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text

echo ""
echo "To connect, use the IP above with"
echo "ssh -i ~/.ssh/academy-labs-key.pem ubuntu@<IP>"
