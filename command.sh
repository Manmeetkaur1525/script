#!/bin/bash

# Function to read user input with a prompt
read_input() {
    local prompt="$1"
    local input
    read -p "$prompt" input
    echo "$input"
}

# Clear the screen
clear

echo "Welcome to the junctiond transaction script!"

# Collect input for 'tx bank multisend'
echo "Bank Multi-Send Transaction"
from_key_or_address=$(read_input "Enter 'from' address or key: ")
to_addresses=$(read_input "Enter 'to' addresses separated by spaces: ")
amount=$(read_input "Enter amount: ")

# Convert space-separated addresses into a format suitable for the command
to_addresses_formatted=$(echo "$to_addresses" | tr ' ' ',')

echo "Running command: junctiond tx bank multi-send $from_key_or_address $to_addresses_formatted $amount"
junctiond tx bank multi-send $from_key_or_address $to_addresses_formatted $amount

# Collect input for 'tx bank send'
echo "Bank Send Transaction"
from_key_or_address=$(read_input "Enter 'from' address or key: ")
to_address=$(read_input "Enter 'to' address: ")
amount=$(read_input "Enter amount: ")
echo "Running command: junctiond tx bank send $from_key_or_address $to_address $amount"
junctiond tx bank send $from_key_or_address $to_address $amount

# Collect input for 'tx staking create-validator'
echo "Staking Create-Validator Transaction"
validator_json_path=$(read_input "Enter path to validator.json: ")
from_keyname=$(read_input "Enter keyname for 'from': ")
echo "Running command: junctiond tx staking create-validator $validator_json_path --from $from_keyname"
junctiond tx staking create-validator $validator_json_path --from $from_keyname

# Collect input for 'tx staking delegate'
echo "Staking Delegate Transaction"
validator_addr=$(read_input "Enter validator address: ")
amount=$(read_input "Enter amount: ")
from_private_key=$(read_input "Enter private key for 'from': ")
echo "Running command: junctiond tx staking delegate $validator_addr $amount --from $from_private_key"
junctiond tx staking delegate $validator_addr $amount --from $from_private_key

# Collect input for 'tx staking edit-validator'
echo "Staking Edit-Validator Transaction"
account_num=$(read_input "Enter account number: ")
echo "Running command: junctiond tx staking edit-validator -a $account_num"
junctiond tx staking edit-validator -a $account_num

# Collect input for 'tx staking redelegate'
echo "Staking Redelegate Transaction"
src_validator_addr=$(read_input "Enter source validator address: ")
dst_validator_addr=$(read_input "Enter destination validator address: ")
amount=$(read_input "Enter amount: ")
account_number=$(read_input "Enter account number: ")
echo "Running command: junctiond tx staking redelegate $src_validator_addr $dst_validator_addr $amount --a $account_number"
junctiond tx staking redelegate $src_validator_addr $dst_validator_addr $amount --a $account_number

# Collect input for 'tx staking cancel-unbond'
echo "Staking Cancel-Unbond Transaction"
validator_addr=$(read_input "Enter validator address: ")
amount=$(read_input "Enter amount: ")
creation_height=$(read_input "Enter creation height: ")
from_keyname=$(read_input "Enter keyname for 'from': ")
echo "Running command: junctiond tx staking cancel-unbond $validator_addr $amount $creation_height --from $from_keyname"
junctiond tx staking cancel-unbond $validator_addr $amount $creation_height --from $from_keyname

echo "All commands executed."

