[[ $# -eq 0 ]] || { export DKR_IMAGE=$1; shift; }
[[ -n ${DKR_IMAGE:-} ]] || eval $(
        : ${PS3:="$(sed 's/^dkr-/dkr /' <<<"${0##*/}") IMAGE#? "}
        PS3=$PS3 dkr-choose-image
    )
