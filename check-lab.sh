#!/bin/bash
INSTANCE_ID="i-0c8bdcc931012e6af"

STATE=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].State.Name' --output text)
IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

echo "Academy Lab Status:"
echo "  State: $STATE"

if [ "$STATE" = "running" ]; then
    echo "  IP: $IP"
    echo "  Connect with: ssh academy-lab"
else
    echo "  Instance is not running"
    echo "  Start with: ~/start-lab.sh"
fi