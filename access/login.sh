export AWS_PROFILE=$1
user_name=ec2-user

# Path: access/login.sh
target=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=*-bation" | jq -r '[.Reservations[].Instances[] |select(.State.Name == "running")|.InstanceId] | join(" ")')
echo $target

ssh_ec2 ${user_name} $target
