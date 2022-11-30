<?php
session_start();

error_reporting(-1);
ini_set( 'display_errors', 1 );
require_once('./router/user.php');

$path = $_SERVER['REQUEST_URI'];
$path = explode('/', $path);
//not logged requests
if (isset($path[2]) && $path[2] == 'user' && isset($path[3])) {
	user_router($path[3]);
}
else{
	http_response_code(200);
	echo 'Togna API';
	exit();
}