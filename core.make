api = 2
core = 7.x

; Includes ====================================================================

includes[] = "https://github.com/Wiredcraft/buildkit/raw/7.x-2.x/distro.make"

; Disable buildkit ============================================================

projects[buildkit] = NULL

; Other patches ===============================================================

; http://drupal.org/node/93854
projects[drupal][patch][93854] = "http://drupal.org/files/issues/taxonomy_autocomplete_5.patch"

; http://drupal.org/node/972536
projects[drupal][patch][972536] = "http://drupal.org/files/issues/972536-24.patch"
