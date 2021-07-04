#!/usr/bin/env bash


function ar18.script._import(){


  function ar18.script.import() {
    # Function template 2021-06-12.01
    local LD_PRELOAD_old
    LD_PRELOAD_old="${LD_PRELOAD}"
    LD_PRELOAD=
    local shell_options
    IFS=$'\n' shell_options=($(shopt -op))
    set -eu
    set -o pipefail
    local ret
    ret=0
    set +x
    ##############################FUNCTION_START#################################
    set -x
    local to_import
    to_import="${1}"
    local to_import_transformed
    to_import_transformed="${to_import/ar18./}"
    to_import_transformed="${to_import_transformed/./\/}"
    # Check if lib is installed locally
    if [ ! -d "/home/$(whoami)/.config/ar18/ar18_lib_bash" ]; then
      local target_path
      target_path="${script_dir}/ar18_lib_bash/${to_import_transformed}.sh"
      curl -O "https://raw.githubusercontent.com/ar18-linux/ar18_lib_bash/master/ar18_lib_bash/${to_import_transformed}.sh" -o "${target_path}" 
      . "${target_path}"
    fi
    
    echo "${to_import}"
    
    ###############################FUNCTION_END##################################
    set +x
    for option in "${shell_options[@]}"; do
      eval "${option}"
    done
    LD_PRELOAD="${LD_PRELOAD_old}"
    return "${ret}"
  }
  
   
}

type ar18.script.import > /dev/null 2>&1 || ar18.script._import
