# eewhopper
Employee Site

Migration PoC

Process:

1) A cloud task is triggered by the UI which creates a new `migration` branch in the customer repo. It then writes `acquia-pipelines.yml` and `settings.php` to that otherwise empty branch, commits and pushes.

This will trigger a pipelines job which currently does the following:
* Given a composer.json (which will be retrieved by the module replacement API, hardcoded for now) download Drupal 8 and dependencies.
* Add the `settings.php` modified to know how to find the proper database credential file in the hosting platform.
* Create an ODE and deploy the result of this build to it. Pipelines automatically creates a new branch for the output of the build, something like `migrate-pipelines-build`. This branch
  will have all of the Drupal code and dependencies in it.
  
2) Remaining work
* It seems we can't `drush site-install` inside of pipelines, so the conclusion of this script needs to trigger an event in the hosting API which:
  - Runs `drush site-install` in the docroot with sane defaults to get the site installed.
  - Migrates the databases and files from the old site into the appropriate locations for this site.
