#!/bin/bash -x

echo "Checking if ssm-admin exists.."

id -u ssm-admin

if [[ $? != 0 ]]
then
  echo "ssm-admin doesn't exist"
else
  echo "ssm-admin already exists"
  userdel ssm-admin
fi

echo "Checking if ssm-basic exists.."

id -u ssm-basic

if [[ $? != 0 ]]
then
  echo "Creating ssm-basic user account."
  useradd -m ssm-basic
  passwd -d ssm-basic
  usermod -a -G adm ssm-basic
else
  echo "ssm-basic already exists"
fi
