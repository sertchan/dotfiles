#!/bin/bash

apex_tux_command="apex-tux"
settings_file="settings.toml"

main() {
    cd "$(dirname "$0")"
    if [ ! -e "$settings_file" ] || [ ! -r "$settings_file" ]; then
        exit 1
    fi
    $apex_tux_command --config "$settings_file"
}
main

