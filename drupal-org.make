; $Id$

core = "6.x"

projects[admin][version] = "2.0-beta3"
projects[admin][subdir] = "kit"

projects[cck][version] = "2.6"
projects[cck][subdir] = "kit"

projects[ctools][version] = "1.3"
projects[ctools][subdir] = "kit"

projects[date][version] = "2.4"
projects[date][subdir] = "kit"

projects[devel][version] = "1.20"
projects[devel][subdir] = "kit"

projects[features][version] = "1.0-beta6"
projects[features][subdir] = "kit"

projects[context][version] = "3.0-beta4"
projects[context][subdir] = "kit"

projects[openidadmin][version] = "1.2"
projects[openidadmin][subdir] = "kit"

projects[strongarm][version] = "2.0-rc1"
projects[strongarm][subdir] = "kit"

projects[views][type] = "module"
projects[views][download][type] = "cvs"
projects[views][download][module] = "contributions/modules/views"
projects[views][download][revision] = "DRUPAL-6--3:2010-05-11"
projects[views][subdir] = "kit"

; Patches

; http://drupal.org/node/670344
projects[cck][patch][] = http://drupal.org/files/issues/cck-views-3.patch

; http://drupal.org/node/786542
projects[context][patch][] = http://drupal.org/files/issues/php53clonefailpatchfail.patch

; http://drupal.org/node/789556
projects[features][patch][] = http://drupal.org/files/issues/789556-5_taxonomy.patch

; http://drupal.org/node/789674
projects[views][patch][] = http://drupal.org/files/issues/789674-3_vocabulary_module.patch
