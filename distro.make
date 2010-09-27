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
projects[drupal][download][type] = git
projects[drupal][download][url] = git://git.drupalcode.org/project/drupal.git

; Boolean field patch
; http://drupal.org/node/913528
projects[drupal][patch][] = http://drupal.org/files/issues/happy_hacking.patch

; Exportability of vocabularies is ruined by taxo field 'allowed vocabs' settings
; http://drupal.org/node/881530
projects[drupal][patch][] = http://drupal.org/files/issues/881530_vocabulary_field_machine_names.5.patch

; Tests in profiles/[name]/modules cannot be run
; http://drupal.org/node/911354
projects[drupal][patch][] = http://drupal.org/files/issues/911354-host-profile.1.patch

projects[buildkit][type] = profile
projects[buildkit][download][type] = cvs
projects[buildkit][download][module] = contributions/profiles/buildkit
projects[buildkit][download][revision] = DRUPAL-7--2
