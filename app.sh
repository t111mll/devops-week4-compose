#!/usr/bin/env bash

set -e

echo "App starting..."
echo "DB host: $DB_HOST"
echo "DB name: $POSTGRES_DB"
echo "App connected successfully (simulated)"

# Keep container alive so we can inspect it
sleep 3600
