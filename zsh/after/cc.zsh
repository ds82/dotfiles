CC=$(fd "^gcc-[0-9]+$" /opt/homebrew/bin)

if [[ ! -z "$CC" ]]; then
  export CC=${CC}
fi
