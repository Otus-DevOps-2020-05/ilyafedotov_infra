#!/bin/bash

case $1 in

    "--list")
	cd ../terraform/stage > /dev/null
        DB_IP=$(terraform show | grep external_ip_address_db | awk '{print $3}')
        APP_IP=$(terraform show | grep external_ip_address_app | awk '{print $3}')

	cd - > /dev/null
	echo -e "{\n" \
		    "    \"_meta\": {\n" \
		    "        \"hostvars\": {\n" \
		    "            \"appserver\": {\n" \
		    "                \"ansible_host\": $APP_IP\n" \
		    "            },\n" \
		    "            \"dbserver\": {\n" \
		    "                \"ansible_host\": $DB_IP\n" \
		    "            }\n" \
		    "        }\n" \
		    "    },\n" \
		    "    \"all\": {\n" \
		    "        \"children\": [\n" \
		    "            \"app\",\n" \
		    "            \"db\",\n" \
		    "            \"ungrouped\"\n" \
		    "        ]\n" \
		    "    },\n" \
		    "    \"app\": {\n" \
		    "        \"hosts\": [\n" \
		    "            \"appserver\"\n" \
		    "        ]\n" \
		    "    },\n" \
		    "    \"db\": {\n" \
		    "        \"hosts\": [\n" \
		    "            \"dbserver\"\n" \
		    "        ]\n" \
		    "    }\n" \
		    "}\n"
	;;

    *)
	echo "Usage: $0 --list [hostname]"
	exit 1
	;;
esac

exit 0
