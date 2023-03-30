#!/bin/bash

printf "Identificando o SecurityGroup do projeto"
aws ec2 describe-security-groups --filters Name=group-name,Values=*$C9_PID* --query "SecurityGroups[*].[GroupName]" --output table

# Definindo o SECURITY GROUP atual
CURRENT_SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values=*$C9_PID* --query "SecurityGroups[*].[GroupId]" --output text)

printf "Liberando acesso entre a IDE o SG Default"

for GROUP_ID in $(aws ec2 describe-security-groups --filters Name=group-name,Values=default --query "SecurityGroups[*].[GroupId]" --output text)
do

aws ec2 authorize-security-group-ingress --group-id $GROUP_ID --protocol tcp --port 0-65535 --source-group $CURRENT_SG
aws ec2 authorize-security-group-ingress --group-id $GROUP_ID --protocol icmp --port -1 --source-group $CURRENT_SG

done

}