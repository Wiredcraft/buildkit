api = 2
core = 7.x

; Includes ====================================================================

includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/refs/heads/7.x-2.x:/distro.make

; Disable buildkit ============================================================

projects[buildkit] = NULL

; Other patches ===============================================================

; http://drupal.org/node/972536
projects[drupal][patch][972536] = http://drupal.org/files/issues/972536-24.patch
