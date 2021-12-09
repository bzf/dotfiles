alias vim='nvim'

export PS1='%~ $ '

function g() {
	if [ "$#" -eq 0 ]; then
		git status
	else
		git "$@"
	fi
}
