#!/usr/bin/env bash

__powerline() {
  ps1() {
    # Check the exit code of the previous command and display different
    # colors in the prompt accordingly.
    if [ $? -eq 0 ]; then
      local BG_EXIT="$BG_COLOR_2"
      local FG_EXIT="$FG_COLOR_2"
    else
      local BG_EXIT="$BG_COLOR_1"
      local FG_EXIT="$FG_COLOR_1"
    fi

    __powerline_git_info=" $(__git_info)"

    if [[ -z "${__powerline_git_info// }" ]]; then
      PS1="$BG_COLOR_11$FG_COLOR_15 \W $RESET$BG_EXIT$FG_COLOR_11$RIGHT_ARROW$RESET"
    else
      PS1="$BG_COLOR_11$FG_COLOR_15 \W $RESET$BG_COLOR_4$FG_COLOR_11$RIGHT_ARROW$RESET"
      PS1+="$BG_COLOR_4$FG_COLOR_15\${__powerline_git_info} $RESET$BG_EXIT$FG_COLOR_4$RIGHT_ARROW$RESET"
    fi
    PS1+="$BG_EXIT$FG_COLOR_15 $PS_SYMBOL $RESET$FG_EXIT$RIGHT_ARROW$RESET "
  }
  source ~/.bash_symbols.sh
  source ~/.bash_colors.sh
  source ~/.bash_info.sh
  PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
