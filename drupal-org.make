; $Id$

core = "6.x"

; Modules

projects[admin][version] = "2.0-beta4"
projects[admin][subdir] = "buildkit"

projects[cck][version] = "2.7"
projects[cck][subdir] = "buildkit"

projects[ctools][version] = "1.6"
projects[ctools][subdir] = "buildkit"

projects[date][type] = "module"
projects[date][download][type] = "cvs"
projects[date][download][module] = "contributions/modules/date"
projects[date][download][revision] = "DRUPAL-6--2:2010-05-02"
projects[date][subdir] = "buildkit"

projects[devel][version] = "1.20"
projects[devel][subdir] = "buildkit"

projects[features][version] = "1.0-beta10"
projects[features][subdir] = "buildkit"

projects[context][version] = "3.0-beta5"
projects[context][subdir] = "buildkit"

projects[openidadmin][version] = "1.2"
projects[openidadmin][subdir] = "buildkit"

projects[strongarm][version] = "2.0-rc1"
projects[strongarm][subdir] = "buildkit"

projects[views][type] = "module"
projects[views][download][type] = "cvs"
projects[views][download][module] = "contributions/modules/views"
projects[views][download][revision] = "DRUPAL-6--3:2010-05-11"
projects[views][subdir] = "buildkit"

; Themes
projects[rubik][download][type] = "get"
projects[rubik][download][url] = "http://code.developmentseed.org/sites/code.developmentseed.org/files/fserver/rubik-6.x-1.0-beta5.tgz"
projects[rubik][directory_name] = "rubik"
projects[rubik][type] = "theme"
projects[tao][download][type] = "get"
projects[tao][download][url] = "http://code.developmentseed.org/sites/code.developmentseed.org/files/fserver/tao-6.x-1.10.tgz"
projects[tao][directory_name] = "tao"
projects[tao][type] = "theme"

; Patches

; http://drupal.org/node/865454
projects[features][patch][] = "http://drupal.org/files/issues/865454_menu_links_fix_v2.patch"

; http://drupal.org/node/830730
projects[cck][patch][] = http://drupal.org/files/issues/cck_views_default_argument_plugin.patch

; http://drupal.org/node/518816
projects[date][patch][] = http://drupal.org/files/issues/518816-5.date_format_date_warnings.patch

; http://drupal.org/node/792184
projects[views][patch][] = http://drupal.org/files/issues/views-3-plugin_display-option_defaults-792184.patch

; http://drupal.org/node/789674
projects[views][patch][] = http://drupal.org/files/issues/789674-3_vocabulary_module.patch
