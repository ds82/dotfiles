PIO_BIN_DIR=$HOME/.platformio/penv/bin

if [[ -d $PIO_BIN_DIR ]] && [[ $PATH = *"$PIO_BIN_DIR"* ]]; then
  export PATH=$PATH:$PIO_BIN_DIR
fi
