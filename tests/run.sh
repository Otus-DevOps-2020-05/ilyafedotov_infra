#!/bin/bash

docker exec hw-test bash -c './tests/packer.sh'
docker exec hw-test bash -c './tests/terraform.sh'
docker exec hw-test bash -c './tests/ansible.sh'
