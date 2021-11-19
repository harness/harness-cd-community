#!/usr/bin/env bash

SHARE_DIR="/shared"
DELEGATE_PROPS_FILE="$SHARE_DIR/delegate.env"

function checkForAccount() {
  mongo mongo:27017/harness --quiet --eval 'db.getCollection("accounts").findOne({"_id": {$ne: "__GLOBAL_ACCOUNT_ID__"}}, {"_id": 1, "accountKey": 1})'
}

MONGO_ACCOUNT=$(checkForAccount)
while [ $(grep -c "_id" <<< "$MONGO_ACCOUNT") -eq "0" ]; do
  echo "No account found, will continue to poll for account..."
  sleep 5
  MONGO_ACCOUNT=$(checkForAccount)
done

ACCOUNT_ID=$(echo $MONGO_ACCOUNT | grep _id | cut -d '"' -f 4)
ACCOUNT_SECRET=$(echo $MONGO_ACCOUNT | grep accountKey | cut -d '"' -f 8)

echo "Found account in database with id $ACCOUNT_ID"

echo "ACCOUNT_ID=$ACCOUNT_ID" > $DELEGATE_PROPS_FILE
echo "ACCOUNT_SECRET=$ACCOUNT_SECRET" >> $DELEGATE_PROPS_FILE
