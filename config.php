<?php
define('ROOT_BON_FOLDER', 'projects/bon/');
// HTTP
define('HTTP_SERVER', 'http://localhost/'.ROOT_BON_FOLDER);//http://192.168.0.25

// HTTPS
define('HTTPS_SERVER', 'http://localhost/'.ROOT_BON_FOLDER);

// DIR
define('DIR_APPLICATION', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'catalog/');
define('DIR_SYSTEM', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/');
define('DIR_IMAGE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'image/');
define('DIR_LANGUAGE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'catalog/language/');
define('DIR_TEMPLATE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'catalog/view/theme/');
define('DIR_CONFIG', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/config/');
define('DIR_CACHE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/cache/');
define('DIR_DOWNLOAD', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/download/');
define('DIR_LOGS', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/logs/');
define('DIR_MODIFICATION', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/modification/');
define('DIR_UPLOAD', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'opencart_2.30');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');

// HTTP
/*define('HTTP_SERVER', 'http://connectivelinkstechnology.com/demo/bon6-2017/');

// HTTPS
define('HTTPS_SERVER', 'http://connectivelinkstechnology.com/demo/bon6-2017/');

// DIR
define('DIR_APPLICATION', '/home/connectivelinks/public_html/demo/bon6-2017/catalog/');
define('DIR_SYSTEM', '/home/connectivelinks/public_html/demo/bon6-2017/system/');
define('DIR_IMAGE', '/home/connectivelinks/public_html/demo/bon6-2017/image/');
define('DIR_LANGUAGE', '/home/connectivelinks/public_html/demo/bon6-2017/catalog/language/');
define('DIR_TEMPLATE', '/home/connectivelinks/public_html/demo/bon6-2017/catalog/view/theme/');
define('DIR_CONFIG', '/home/connectivelinks/public_html/demo/bon6-2017/system/config/');
define('DIR_CACHE', '/home/connectivelinks/public_html/demo/bon6-2017/system/storage/cache/');
define('DIR_DOWNLOAD', '/home/connectivelinks/public_html/demo/bon6-2017/system/storage/download/');
define('DIR_LOGS', '/home/connectivelinks/public_html/demo/bon6-2017/system/storage/logs/');
define('DIR_MODIFICATION', '/home/connectivelinks/public_html/demo/bon6-2017/system/storage/modification/');
define('DIR_UPLOAD', '/home/connectivelinks/public_html/demo/bon6-2017/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'connecti_bonclt');
define('DB_PASSWORD', '06Z+)IfWAl.H');
define('DB_DATABASE', 'connecti_clt_bonclt_new1');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');*/
