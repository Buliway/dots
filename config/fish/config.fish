if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Чтоб gitui по ssh работал. После этого конфига надо прописать ssh-add с путём до приватного ключа
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end
