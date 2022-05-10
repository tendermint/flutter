#!/usr/bin/env bash

set -eo pipefail

# Define variables
OUT=lib/proto
PROTO=proto
THIRD_PARTY=third_party
COSMOS_VERSION=0.45.4

## Download the Protobuf files
source scripts/get_proto.sh $PROTO $THIRD_PARTY $OUT $COSMOS_VERSION

# Generate the third party Protobuf implementations
PROTOC="protoc --dart_out=grpc:$OUT -I$THIRD_PARTY/proto"
proto_dirs=$(find "$THIRD_PARTY/proto" -path -prune -o -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq)
for dir in $proto_dirs; do
  $PROTOC -I$THIRD_PARTY/proto $(find "${dir}" -maxdepth 1 -name '*.proto')
done
