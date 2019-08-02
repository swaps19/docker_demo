#!/bin/bash
set -e

echo 'starting the server'
# Remove a potentially pre-existing server.pid for Rails.
rm -f /docker_demo/tmp/pids/server.pid

# Start the main process
bundle exec rails s -b 0.0.0.0
