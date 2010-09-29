<?php
/** 
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information by
 * visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'nickmbai_WordPress');

/** MySQL database username */
define('DB_USER', 'nickmbai_default');

/** MySQL database password */
define('DB_PASSWORD', 'default');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/ WordPress.org secret-key service}
 *
 * @since 2.6.0
 */
define('AUTH_KEY',        '<MHbTgFkf=Ncrad@)G2.U/ZM?%![7pt-PV@;C{Ev(p{A>|Fm&|VFLlR|>z_Y9k#1');
define('SECURE_AUTH_KEY', 'AhF* fgSWO/WPv+hcvl^gber.0JxO`Ym&IG.CXETWV`!zZdF~bP/mqT|A:n+,d!;');
define('LOGGED_IN_KEY',   'jb21bfI+xw=Ll}^+PP-`iSGA6<Xm6}ZuM)(E10+}8qf<qjsNy+4}p(eFBS?IJb}H');
define('NONCE_KEY',       '-a+%Q%$@q2{zDgp|!!eHAIR+6m/=E&ukVA-A# o@&pFA+3ukjB9k|[/Wfk,9F#s{');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress.  A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de.mo to wp-content/languages and set WPLANG to 'de' to enable German
 * language support.
 */
define ('WPLANG', '');

/* That's all, stop editing! Happy blogging. */

/** WordPress absolute path to the Wordpress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
?>
