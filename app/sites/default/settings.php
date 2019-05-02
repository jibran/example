<?php

use Drupal\Core\Config\BootstrapConfigStorageFactory;
use Drupal\Core\Database\Database;

require_once __DIR__ . '/settings.skpr.php';

$cli = (php_sapi_name() == 'cli');

if ($cli) {
  require_once __DIR__ . '/settings.cli.php';
}

$settings['container_yamls'][] = __DIR__ . '/services.yml';

// Disables installing modules via browser.
$settings['allow_authorize_operations'] = FALSE;

$databases['default']['default'] = array(
  'driver' => 'mysql',
  'database' => skpr_config('mysql.default.database') ?: 'local',
  'username' => skpr_config('mysql.default.username') ?: 'drupal',
  'password' => skpr_config('mysql.default.password') ?: 'drupal',
  'host' => skpr_config('mysql.default.hostname') ?: 'mysql',
);

$settings['hash_salt'] = skpr_config('salt') ?: '';

$config_directories[CONFIG_SYNC_DIRECTORY] = __DIR__ . '/../../../config-export';

$config['cron_safe_threshold'] = '0';
$settings['file_public_path'] = 'sites/default/files';
$config['system.file']['path']['temporary'] = skpr_config('mount.temporary') ?: '/tmp';
$settings['file_private_path'] = skpr_config('mount.private') ?: 'sites/default/files/private';

$settings['install_profile'] = 'demo_umami';

$settings['trusted_host_patterns'][] = '^127\.0\.0\.1$';
$settings['trusted_host_patterns'][] = '^localhost$';
$settings['trusted_host_patterns'][] = '(.*)\.skpr\.dev$';
