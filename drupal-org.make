; $Id$

core = 6.x

; Libraries

libraries[profiler][download][type] = get
libraries[profiler][download][url] = http://ftp.drupal.org/files/projects/profiler-6.x-2.0-beta1.tar.gz

libraries[jquery_ui][download][type] = get
libraries[jquery_ui][download][url] = http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/buildkit/jquery_ui

; Modules

projects[admin][version] = 2.0
projects[admin][subdir] = buildkit

projects[cck][version] = 2.8
projects[cck][subdir] = buildkit

projects[context][version] = 3.0
projects[context][subdir] = buildkit

projects[ctools][version] = 1.7
projects[ctools][subdir] = buildkit

projects[date][version] = 2.6
projects[date][subdir] = buildkit

projects[devel][version] = 1.22
projects[devel][subdir] = buildkit

projects[diff][version] = 2.1
projects[diff][subdir] = buildkit

projects[features][version] = 1.0
projects[features][subdir] = buildkit

projects[jquery_ui][version] = 1.3
projects[jquery_ui][subdir] = buildkit

projects[openidadmin][version] = 1.2
projects[openidadmin][subdir] = buildkit

projects[strongarm][version] = 2.0
projects[strongarm][subdir] = buildkit

projects[views][type] = module
projects[views][download][type] = cvs
projects[views][download][module] = contributions/modules/views
projects[views][download][revision] = DRUPAL-6--3:2010-05-11
projects[views][subdir] = buildkit

; Themes

projects[rubik][download][type] = get
projects[rubik][download][url] = http://code.developmentseed.org/sites/code.developmentseed.org/files/fserver/rubik-6.x-3.0-beta1.tgz
projects[rubik][directory_name] = rubik
projects[rubik][type] = theme

projects[tao][download][type] = get
projects[tao][download][url] = http://code.developmentseed.org/sites/code.developmentseed.org/files/fserver/tao-6.x-3.1.tgz
projects[tao][directory_name] = tao
projects[tao][type] = theme

; Patches

; http://drupal.org/node/830730
projects[cck][patch][] = http://drupal.org/files/issues/cck_views_default_argument_plugin.patch

; http://drupal.org/node/792184
projects[views][patch][] = http://drupal.org/files/issues/views-3-plugin_display-option_defaults-792184.patch

; http://drupal.org/node/789674
projects[views][patch][] = http://drupal.org/files/issues/789674-3_vocabulary_module.patch
