#!/bin/sh
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.aliases
source $HOME/.local/share/icons-in-terminal/icons_bash.sh

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd 

# build prompt

# icons
icon_prompt=`echo -e $myicons_arch_linux_arrow`
icon_dir=`echo -e $md_folder`
icon_git=`echo -e $oct_git_branch`
icon_git_new=`echo -e $oct_diff_added`
icon_git_rem=`echo -e $oct_diff_removed`
icon_git_mod=`echo -e $oct_diff_modified`
icon_git_ren=`echo -e $oct_diff_renamed`

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo -ne "\033[38;5;244mon \e[m\e[33m$(tput bold)${icon_git} ${BRANCH}$(tput sgr0)\033[38;5;244m${STAT}\e[m"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "Untracked files:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits="${icon_git_ren} ${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="${icon_git_new} ${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="${icon_git_rem} ${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="${icon_git_mod} ${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

if [ "$EUID" -ne 0 ]
	then export PS1="\[\033[38;5;244m\]╭─[\D{%F %T}]\[\e[m\] \[$(tput bold)\]\[\e[36m\]\u\[\e[m\] \[\033[38;5;244m\]in\[\e[m\] \[$(tput bold)\]\[\e[32m\]$icon_dir  \w\[\e[m\] \`parse_git_branch\`\n\[\033[38;5;244m\]╰─\[\e[m\]\[\e[36m\]\[$(tput bold)\]$icon_prompt \[\e[m\] "
  else PS1="\[\033[38;5;244m\]╭─[\D{%F %T}]\[\e[m\] \[$(tput bold)\]\[\e[31m\]\u\[\e[m\] \[\033[38;5;244m\]in\[\e[m\] \[$(tput bold)\]\[\e[32m\]$icon_dir  \w\[\e[m\] \`parse_git_branch\`\n\[\033[38;5;244m\]╰─\[\e[m\]\[\e[31m\]\[$(tput bold)\]$icon_prompt \[\e[m\] "
fi

xrdb -merge $HOME/.Xresources

# added by travis gem
[ -f /home/kowal/.travis/travis.sh ] && source /home/kowal/.travis/travis.sh
