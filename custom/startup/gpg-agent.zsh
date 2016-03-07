
GPG_AGENT_COUNT=$(ps -All | grep gpg-agent | wc -l)

if [[ ${GPG_AGENT_COUNT} -eq 0 ]]
then
        gpg-agent --disable-scdaemon --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info"
fi

if [ -f "${HOME}/.gpg-agent-info" ]; then
        . "${HOME}/.gpg-agent-info"
        export GPG_AGENT_INFO
        export SSH_AUTH_SOCK
fi

GPG_TTY=$(tty)
export GPG_TTY


