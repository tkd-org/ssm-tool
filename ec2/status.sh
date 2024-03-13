export AWS_PROFILE=$1
user_name=ec2-user

# Path: access/login.sh
target=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=*-bation" | jq -r '[.Reservations[].Instances[] |.InstanceId] | join(" ")')
echo $target

aws ec2 start-instances --instance-ids $target && aws ec2 wait instance-running --instance-ids $target
