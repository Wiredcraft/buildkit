<?php

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 * An array of modules to enable.
 */
function buildkit_profile_modules() {
  $modules = array(
     // Drupal core.
    'block',
    'book',
    'comment',
    'contact',
    'dblog',
    'filter',
    'help',
    'menu',
    'node',
    'path',
    'system',
    'taxonomy',
    'upload',
    'user',
    // Build kit.
    'admin',
    'openid',
    'openidadmin',
    'content',
    'optionwidgets',
    'text',
    'context',
    'context_ui',
    'ctools',
    'date_api',
    'date_timezone',
    'date',
    'date_popup',
    'features',
    'strongarm',
    'views',
    'views_ui',
  );
  return $modules;
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 * An array with keys 'name' and 'description' describing this profile,
 * and optional 'language' to override the language selection for
 * language-specific profiles.
 */
function buildkit_profile_details() {
  return array(
    'name' => 'Build kit',
    'description' => 'Get started fast on a site build.'
  );
}

/**
 * Perform any final installation tasks for this profile.
 *
 * @param $task
 * The current $task of the install system. When hook_profile_tasks()
 * is first called, this is 'profile'.
 * @param $url
 * Complete URL to be used for a link or form action on a custom page,
 * if providing any, to allow the user to proceed with the installation.
 *
 * @return
 * An optional HTML string to display to the user. Only used if you
 * modify the $task, otherwise discarded.
 */
function buildkit_profile_tasks(&$task, $url) {
  // This is where features are usually being enabled.
  $features = array(
  );
  drupal_install_modules($features);

  // Rebuild key tables/caches.
  drupal_flush_all_caches();

  // Enabe rubik as default theme.
  buildkit_enable_theme('rubik');
}

/**
 * Enable a theme that lives in a profile.
 *
 * @param $theme_name
 *   The name of the theme to be enabled.
 * @param $profile_name
 *   The name of the profile that contains the theme.
 */
function buildkit_enable_theme($theme_name, $profile_name = 'buildkit') {
  // Set default theme. This must happen after drupal_flush_all_caches(), which
  // will run system_theme_data() without detecting themes in the install
  // profile directory.
  _buildkit_system_theme_data($profile_name);
  db_query("UPDATE {blocks} SET status = 0, region = ''"); // disable all DB blocks
  db_query("UPDATE {system} SET status = 0 WHERE type = 'theme' and name ='%s'", 'garland');
  db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name ='%s'", $theme_name);
  variable_set('theme_default', $theme_name);
}

/**
 * Reimplementation of system_theme_data().
 *
 * The core function's static cache is populated during install prior to active
 * install profile awareness. This workaround makes enabling themes in
 * profiles/[profile]/themes possible.
 */
function _buildkit_system_theme_data($profile_name) {
  global $profile;
  $profile = $profile_name;

  $themes = drupal_system_listing('\.info$', 'themes');
  $engines = drupal_system_listing('\.engine$', 'themes/engines');

  $defaults = system_theme_default();

  $sub_themes = array();
  foreach ($themes as $key => $theme) {
    $themes[$key]->info = drupal_parse_info_file($theme->filename) + $defaults;

    if (!empty($themes[$key]->info['base theme'])) {
      $sub_themes[] = $key;
    }

    if (isset($themes[$key]->info['engine'])) {
      $engine = $themes[$key]->info['engine'];
      if (isset($engines[$engine])) {
        $themes[$key]->owner = $engines[$engine]->filename;
        $themes[$key]->prefix = $engines[$engine]->name;
        $themes[$key]->template = TRUE;
      }
    }

    // Give the stylesheets proper path information.
    $pathed_stylesheets = array();
    foreach ($themes[$key]->info['stylesheets'] as $media => $stylesheets) {
      foreach ($stylesheets as $stylesheet) {
        $pathed_stylesheets[$media][$stylesheet] = dirname($themes[$key]->filename) .'/'. $stylesheet;
      }
    }
    $themes[$key]->info['stylesheets'] = $pathed_stylesheets;

    // Give the scripts proper path information.
    $scripts = array();
    foreach ($themes[$key]->info['scripts'] as $script) {
      $scripts[$script] = dirname($themes[$key]->filename) .'/'. $script;
    }
    $themes[$key]->info['scripts'] = $scripts;

    // Give the screenshot proper path information.
    if (!empty($themes[$key]->info['screenshot'])) {
      $themes[$key]->info['screenshot'] = dirname($themes[$key]->filename) .'/'. $themes[$key]->info['screenshot'];
    }
  }

  foreach ($sub_themes as $key) {
    $themes[$key]->base_themes = system_find_base_themes($themes, $key);
    // Don't proceed if there was a problem with the root base theme.
    if (!current($themes[$key]->base_themes)) {
      continue;
    }
    $base_key = key($themes[$key]->base_themes);
    foreach (array_keys($themes[$key]->base_themes) as $base_theme) {
      $themes[$base_theme]->sub_themes[$key] = $themes[$key]->info['name'];
    }
    // Copy the 'owner' and 'engine' over if the top level theme uses a
    // theme engine.
    if (isset($themes[$base_key]->owner)) {
      if (isset($themes[$base_key]->info['engine'])) {
        $themes[$key]->info['engine'] = $themes[$base_key]->info['engine'];
        $themes[$key]->owner = $themes[$base_key]->owner;
        $themes[$key]->prefix = $themes[$base_key]->prefix;
      }
      else {
        $themes[$key]->prefix = $key;
      }
    }
  }

  // Extract current files from database.
  system_get_files_database($themes, 'theme');
  db_query("DELETE FROM {system} WHERE type = 'theme'");
  foreach ($themes as $theme) {
    $theme->owner = !isset($theme->owner) ? '' : $theme->owner;
    db_query("INSERT INTO {system} (name, owner, info, type, filename, status, throttle, bootstrap) VALUES ('%s', '%s', '%s', '%s', '%s', %d, %d, %d)", $theme->name, $theme->owner, serialize($theme->info), 'theme', $theme->filename, isset($theme->status) ? $theme->status : 0, 0, 0);
  }
}
