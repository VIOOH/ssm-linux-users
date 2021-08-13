#!/bin/bash -x

echo "Checking if ssm-admin exists.."

id -u ssm-admin

if [[ $? != 0 ]]
then
  echo "Creating ssm-admin user account."
  useradd -m ssm-admin
  passwd -d ssm-admin
  usermod -a -G sudo ssm-admin
else
  echo "ssm-admin already exists"
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
