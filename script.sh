#!/bin/bash -x

echo "Checking if ssm-admin exists.."

id -u ssm-admin

if [[ $? != 0 ]]
then
  echo "ssm-admin doesn't exist"
  useradd -m ssm-admin
  usermod -a -G sudo ssm-admin
  usermod -a -G wheel ssm-admin
  echo "ssm-admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ssm-agent-users
  chmod 0440 /etc/sudoers.d/ssm-agent-users
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
