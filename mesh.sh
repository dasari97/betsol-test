#!bin/bash

print() {
    echo -e " $1 "
}

status_check() {
    if [ $1 -eq 0 ];
        then
            echo -e "\e[1;32\Task completed successfully.\e[0m"
        else
            echo -e "\e[1;31\Task Failed.\e[0m"
        exit 2
    fi
}

#Downloading asmcli command into the machine.

print "\e[3;33\Downloading ASMCLI utility into the machine.\e[0m"
curl https://storage.googleapis.com/csm-artifacts/asm/asmcli_1.13 > ./asmcli && chmod +x ./asmcli
status_check $?

print "\e[3;33EEnabling Anthos service mesh for the project.\e[0m"
./asmcli install -p $project_name -l $region -n $cluster_name --fleet_id $fleet_id --managed --verbose --output_dir ~/$direcotry_name --enable-all --channel $release_channel
status_check $?
