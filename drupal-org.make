; $Id$

api = 2
core = 7.x

; Modules =====================================================================

projects[admin][subdir] = contrib
projects[admin][version] = 2.0-beta2

projects[context][subdir] = contrib
projects[context][version] = 3.0-alpha2

projects[ctools][subdir] = contrib
projects[ctools][type] = module
projects[ctools][download][type] = git
projects[ctools][download][url] = git://github.com/sdboyer/ctools.git

projects[devel][subdir] = contrib
projects[devel][type] = module
projects[devel][download][type] = cvs
projects[devel][download][module] = contributions/modules/devel
projects[devel][download][date] = 2010-09-17

projects[diff][subdir] = contrib
projects[diff][version] = 2.0-beta2

projects[features][subdir] = contrib
projects[features][version] = 1.0-alpha2

projects[openidadmin][subdir] = contrib
projects[openidadmin][version] = 1.0

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.0-beta2

projects[views][subdir] = contrib
projects[views][type] = module
projects[views][download][type] = cvs
projects[views][download][module] = contributions/modules/views
projects[views][download][revision] = DRUPAL-7--3
projects[views][download][date] = 2010-09-20

projects[views][subdir] = contrib
projects[views][type] = module
projects[views][download][type] = cvs
projects[views][download][module] = contributions/modules/views
projects[views][download][revision] = DRUPAL-7--3
projects[views][download][date] = 2010-09-20

; Field formatter
; http://drupal.org/node/884730
projects[views][patch][] = http://drupal.org/files/issues/884730-formatter_settings_2.patch

; Taxonomy handlers
; http://drupal.org/node/917402
projects[views][patch][] = http://drupal.org/files/issues/d7_views_taxonomy_handlers.patch

; Field filter
; http://drupal.org/node/921144
http://drupal.org/files/issues/921144_field_filter.1_0_0.patch

; Themes ======================================================================

projects[tao][version] = 3.0-beta1
projects[rubik][version] = 4.0-beta2
