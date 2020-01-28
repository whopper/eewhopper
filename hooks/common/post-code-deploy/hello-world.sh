#!/bin/sh

# Is there a way to check for an existing install and not do this if there is
# one?
cd /var/www/html/eewhopperode14/docroot
pwd
drush site-install --account-name='admin' --account-mail='foo@bar.com' --site-mail='foo@bar.com' --account-pass='randompass' --site-name='Drupal 8'
