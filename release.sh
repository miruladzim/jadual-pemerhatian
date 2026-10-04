#!/bin/sh
# Selepas push: tunggu GitHub Pages siap bina, kemudian beri isyarat realtime
# supaya semua laman yang sedang terbuka muat semula ke versi baharu.
set -e
cd "$(dirname "$0")"
SHA=$(git rev-parse HEAD)
V=$(sed -n 's/.*"v":"\([^"]*\)".*/\1/p' version.json)
KEY=$(sed -n 's/.*apiKey: "\([^"]*\)".*/\1/p' firebase-config.js)
PROJ=$(sed -n 's/.*projectId: "\([^"]*\)".*/\1/p' firebase-config.js)
echo "Menunggu GitHub Pages membina $SHA ..."
until [ "$(gh api repos/miruladzim/jadual-pemerhatian/pages/builds/latest --jq '.status+" "+.commit')" = "built $SHA" ]; do sleep 5; done
until curl -fs "https://miruladzim.github.io/jadual-pemerhatian/version.json?t=$(date +%s)" | grep -q "\"$V\""; do sleep 3; done
curl -fs -X PATCH -H 'Content-Type: application/json' -d "{\"fields\":{\"v\":{\"stringValue\":\"$V\"}}}" \
  "https://firestore.googleapis.com/v1/projects/$PROJ/databases/(default)/documents/meta/app?key=$KEY" >/dev/null
echo "Versi $V kini live; semua laman yang terbuka sedang dimuat semula."
