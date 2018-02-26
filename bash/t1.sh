#!/bin/bash

TMP_DIRECTORY=/test/2

echo TEST 1

cat  << EOF
curl -X GET -d '{"value": "file:///${TMP_DIRECTORY}"}'
EOF

echo TEST 2
