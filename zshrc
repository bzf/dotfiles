alias vim='nvim'

function g() {
	if [ "$#" -eq 0 ]; then
		git status
	else
		git "$@"
	fi
}
