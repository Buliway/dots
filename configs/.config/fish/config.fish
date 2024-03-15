if status is-interactive
    # Commands to run in interactive sessions can go here
    # Будет активно просто в терминале. При запуске скриптов это работать не будет
	ssh-add ~/.ssh/id_ed25519
end

# Чтоб gitui по ssh работал. После этого конфига надо прописать ssh-add с путём до приватного ключа
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

# Переменные для n, который управляет версиями node. Аналог nvm
set -gx N_PREFIX $HOME/.n
set -gx fish_user_paths $N_PREFIX/bin $fish_user_paths

# Команда ya работает как yazi, но при выходе переносит меня в каталог, где я был в yazi
function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
