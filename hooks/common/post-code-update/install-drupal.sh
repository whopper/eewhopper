#!/bin/bash

set -e
echo "POST CODE UPDATE!!!"
# Is there a way to check for an existing install and not do this if there is
# one?
cd /var/www/html/${1}${2}/docroot
pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
yes | drush site-install --account-name='admin' --account-mail="${1}@acquia.com" --site-mail="${1}@acquia.com" --account-pass="${pass}" --site-name='Drupal 8'
