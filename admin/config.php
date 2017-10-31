<?php
define('ROOT_BON_FOLDER', 'bon/');
// HTTP
define('HTTP_SERVER', 'https://localhost/'.ROOT_BON_FOLDER.'admin/');
define('HTTP_CATALOG', 'https://localhost/'.ROOT_BON_FOLDER);

// HTTPS
define('HTTPS_SERVER', 'https://localhost/'.ROOT_BON_FOLDER.'admin/');//http://192.168.0.25
define('HTTPS_CATALOG', 'https://localhost/'.ROOT_BON_FOLDER);

// DIR
define('DIR_APPLICATION', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'admin/');
define('DIR_SYSTEM', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/');
define('DIR_IMAGE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'image/');
define('DIR_LANGUAGE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'admin/language/');
define('DIR_TEMPLATE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'admin/view/template/');
define('DIR_CONFIG', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/config/');
define('DIR_CACHE', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/cache/');
define('DIR_DOWNLOAD', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/download/');
define('DIR_LOGS', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/logs/');
define('DIR_MODIFICATION', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/modification/');
define('DIR_UPLOAD', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'system/storage/upload/');
define('DIR_CATALOG', $_SERVER['DOCUMENT_ROOT'].'/'.ROOT_BON_FOLDER.'catalog/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'opencart_2.30');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');


// HTTP
/*define('HTTP_SERVER', 'http://connectivelinkstechnology.com/demo/bon2/admin/');
define('HTTP_CATALOG', 'http://connectivelinkstechnology.com/demo/bon2/');

// HTTPS
define('HTTPS_SERVER', 'http://connectivelinkstechnology.com/demo/bon2/admin/');
define('HTTPS_CATALOG', 'http://connectivelinkstechnology.com/demo/bon2/');

// DIR
define('DIR_APPLICATION', '/home/connectivelinks/public_html/demo/bon2/admin/');
define('DIR_SYSTEM', '/home/connectivelinks/public_html/demo/bon2/system/');
define('DIR_IMAGE', '/home/connectivelinks/public_html/demo/bon2/image/');
define('DIR_LANGUAGE', '/home/connectivelinks/public_html/demo/bon2/admin/language/');
define('DIR_TEMPLATE', '/home/connectivelinks/public_html/demo/bon2/admin/view/template/');
define('DIR_CONFIG', '/home/connectivelinks/public_html/demo/bon2/system/config/');
define('DIR_CACHE', '/home/connectivelinks/public_html/demo/bon2/system/storage/cache/');
define('DIR_DOWNLOAD', '/home/connectivelinks/public_html/demo/bon2/system/storage/download/');
define('DIR_LOGS', '/home/connectivelinks/public_html/demo/bon2/system/storage/logs/');
define('DIR_MODIFICATION', '/home/connectivelinks/public_html/demo/bon2/system/storage/modification/');
define('DIR_UPLOAD', '/home/connectivelinks/public_html/demo/bon2/system/storage/upload/');
define('DIR_CATALOG', '/home/connectivelinks/public_html/demo/bon2/catalog/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'connecti_bonclt');
define('DB_PASSWORD', '06Z+)IfWAl.H');
define('DB_DATABASE', 'connecti_clt_bonclt_new1');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');*/
