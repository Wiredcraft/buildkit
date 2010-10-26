; This file describes the core project requirements for BuildKit 7.x. Several
; patches against Drupal core and their associated issue numbers have been
; included here for reference.
;
; Use this file to build a full distro including Drupal core (with patches) and
; the BuildKit install profile using the following command:
;
;     $ drush make distro.make [directory]

api = 2
core = 7.x

projects[drupal][type] = core
projects[drupal][version] = "7.0-beta2"

; Make system directories configurable to allow tests in profiles/[name]/modules to be run.
; http://drupal.org/node/911354
projects[drupal][patch][911354] = http://drupal.org/files/issues/911354.43.patch

; Missing drupal_alter() for text formats and filters 
; http://drupal.org/node/903730
projects[drupal][patch][903730] = http://drupal.org/files/issues/drupal.filter-alter.82.patch

; Update.php disables modules with no files[]
; http://drupal.org/node/912700
projects[drupal][patch][912700] = http://drupal.org/files/issues/update_remove_files_check.diff

projects[buildkit][type] = profile
projects[buildkit][download][type] = cvs
projects[buildkit][download][module] = contributions/profiles/buildkit
projects[buildkit][download][revision] = DRUPAL-7--2
