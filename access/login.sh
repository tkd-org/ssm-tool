export AWS_PROFILE=$1

# Path: access/login.sh
target=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=*-bation" | jq -r '[.Reservations[].Instances[] | .InstanceId] | join(" ")')
echo $target

ssh_ec2 ec2-user $target
