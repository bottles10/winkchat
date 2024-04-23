#!/usr/bin/env bash
# exit on error
set -o errexit

curl --create-dirs -o $HOME/.postgresql/root.crt 'https://cockroachlabs.cloud/clusters/e5c15974-91ae-4499-99ba-c5e1cb243f14/cert'

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
