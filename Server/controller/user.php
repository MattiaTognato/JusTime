<?php

require_once'./db_connect.php';
function register_user($username, $email, $password){
    global $db;
    
    $sql = "INSERT INTO user (username, email, password) VALUES ('$username', '$email', '$password')";
    $db->prepare($sql); 
       
}
