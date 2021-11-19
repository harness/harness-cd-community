#!/usr/bin/env bash

SCRIPT_DIR="$(dirname $0)"
SHARE_DIR="/shared"
DELEGATE_PROPS_FILE="$SHARE_DIR/delegate.env"

function getProperty(){
  FILENAME=$1
  PROP_KEY=$2
  PROP_VALUE=$(cat "$FILENAME" | grep "$PROP_KEY" | cut -d '=' -f 2)
  echo $PROP_VALUE
}

while [ ! -s "$DELEGATE_PROPS_FILE" ]; do
  echo "No account details file found, delaying watcher startup until file is available..."
  sleep 5
done

export ACCOUNT_ID=$(getProperty "$DELEGATE_PROPS_FILE" "ACCOUNT_ID")
export ACCOUNT_SECRET=$(getProperty "$DELEGATE_PROPS_FILE" "ACCOUNT_SECRET")

bash $SCRIPT_DIR/stop.sh

if [ "$?" -ne 0 ]; then
  exit 1
fi

source $SCRIPT_DIR/start.sh
