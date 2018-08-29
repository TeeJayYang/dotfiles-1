#!/usr/bin/env bash

__twoline() {
  ps1() {
    # Check the exit code of the previous command and display different
    # colors in the prompt accordingly.
    if [ $? -eq 0 ]; then
      local FG_EXIT="$FG_GREEN"
    else
      local FG_EXIT="$FG_RED"
    fi

    __twoline_virtual_env="$(__venv_info)"
    __twoline_git_info="$(__git_info)"

    if [ $(id -u) -eq 0 ]; then
      __twoline_formatted_path="$FG_COLOR_4$(__path_info)$RESET"
    else
      __twoline_formatted_path="$FG_COLOR_3$(__path_info)$RESET"
    fi

    if [[ ! -z "${__twoline_virtual_env// }" ]]; then
      __twoline_virtual_env=" with $FG_COLOR_3${__twoline_virtual_env}$RESET"
    fi

    if [[ ! -z "${__twoline_git_info// }" ]]; then
      __twoline_git_info=" on $RESET$FG_COLOR_3${__twoline_git_info}$RESET"
    fi

    PS1="\n$__twoline_formatted_path$__twoline_git_info$__twoline_virtual_env\n"
    PS1+="$FG_EXIT➤ $RESET"
    PS2="$FG_EXIT➤ $RESET"
  }
  source ~/.bash_symbols.sh
  source ~/.bash_colors.sh
  source ~/.bash_info.sh
  PROMPT_COMMAND=ps1
}

__twoline
unset __twoline
