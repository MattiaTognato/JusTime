<?php

error_reporting(-1);
ini_set( 'display_errors', 1 );
require_once('./router/user.php');
session_start();

$path = $_SERVER['REQUEST_URI'];
$path = explode('/', $path);

if (isset($path[2]) && $path[2] == 'user' && isset($path[3])) {
	user_router($path[3]);
}
else{
	http_response_code(404);
	echo 'Not Found';
}