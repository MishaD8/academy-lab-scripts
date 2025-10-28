#!/bin/bash
INSTANCE_ID="i-0c8bdcc931012e6af"

echo "Stopping your academy lab instance..."
aws ec2 stop-instances --instance-ids $INSTANCE_ID
echo "Instance stopped! Saving you money"
