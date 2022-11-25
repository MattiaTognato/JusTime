<?php

error_reporting(-1);
ini_set( 'display_errors', 1 );
require_once'db_connect.php';
require_once'./router/get-router.php';
require_once'./router/post-router.php';
require_once'./router/delete-router.php';

session_start();

$request = $_SERVER['REQUEST_URI'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	// POST
	post_router($request);
}
else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	// GET
	get_router($request);
}
else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	// DELETE
	delete_router($request);
}
