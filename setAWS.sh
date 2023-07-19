#!/bin/bash
# AWS EC2 Instance Configuration
instance_type="t2.micro"
image_id="ami-06ca3ca175f37dd66"  # Specify the desired AMI ID
key_name="veeksha"
security_group_id="sg-07bd983369d5f3325"  # Specify the security group ID
subnet_id="subnet-01f316c5dffa306e6"  # Specify the subnet ID
tag_name="amma"
# Provision EC2 instance
instance_id=$(aws ec2 run-instances \
  --image-id "$image_id" \
  --instance-type "$instance_type" \
  --key-name "$key_name" \
  --security-group-ids "$security_group_id" \
  --subnet-id "$subnet_id" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tag_name}]" \
  --query "Instances[0].InstanceId" \
  --output text)
# Check if instance creation was successful
if [ -n "$instance_id" ]; then
  echo "EC2 instance created with ID: $instance_id"
else
  echo "Failed to create EC2 instance."
fi
