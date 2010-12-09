#!/bin/sh

self=$$
TOPLEVEL="$(cd $(dirname $0)/.. && pwd)"
LIBEXEC="${ASP_DEBUG_DIR:-${TOPLEVEL}/libexec}"

source "${LIBEXEC}/constants.sh"
source "${LIBEXEC}/libexec-funcs.sh"

check_isis
set_lib_paths "${TOPLEVEL}/lib"

PROGRAM="${LIBEXEC}/$(basename $0)"
if ! test -f "${PROGRAM}"; then
    msg "Could not find ${PROGRAM}"
    die "Is your stereo pipeline install incomplete?"
fi
exec "${PROGRAM}" $*
