<?php

/**
 * @file
 * Contains Skipper helper functions.
 */

/**
 * Gets skipper config.
 *
 * @param string $key
 *   The config key.
 *
 * @return bool|string
 *   The config value, or FALSE if not found.
 */
function skpr_config($key) {
  static $confs = [];

  if (empty($confs[$key])) {
    $value = shell_exec(sprintf("skprconfig %s", $key));
    if (!empty($value)) {
      $confs[$key] = str_replace("\n", '', file_get_contents(realpath($file)));
    }
  }

  return !empty($confs[$key]) ? $confs[$key] : FALSE;
}
