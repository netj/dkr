[[ $# -eq 0 ]] || { export DKR_CONTAINER=$1; shift; }
[[ -n ${DKR_CONTAINER:-} ]] || eval $(
        : ${PS3:="$(sed 's/^dkr-/dkr /' <<<"${0##*/}") CONTAINER#? "}
        PS3=$PS3 dkr-choose "$@"
    )
[[ -n ${DKR_CONTAINER:-} ]] ||
    error "No container available"
