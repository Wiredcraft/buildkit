; $Id$

api = 2
core = 7.x

; Modules =====================================================================

projects[admin][subdir] = contrib
projects[admin][version] = 2.0-beta2

projects[context][subdir] = contrib
projects[context][version] = 3.0-alpha2

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.0-alpha1

projects[devel][subdir] = contrib
projects[devel][type] = module
projects[devel][download][type] = cvs
projects[devel][download][module] = contributions/modules/devel
projects[devel][download][date] = 2010-10-20

projects[diff][subdir] = contrib
projects[diff][version] = 2.0-beta2

projects[features][subdir] = contrib
projects[features][version] = 1.0-alpha3

projects[openidadmin][subdir] = contrib
projects[openidadmin][version] = 1.0

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.0-beta2

projects[views][subdir] = contrib
projects[views][type] = module
projects[views][download][type] = cvs
projects[views][download][module] = contributions/modules/views
projects[views][download][revision] = DRUPAL-7--3
projects[views][download][date] = 2010-10-20

; Field formatter
; http://drupal.org/node/884730
projects[views][patch][] = http://drupal.org/files/issues/views_formatter_settings-884730-43.patch

; Themes ======================================================================

projects[tao][version] = 3.0-beta3
projects[rubik][version] = 4.0-beta4
