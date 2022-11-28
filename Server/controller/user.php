<?php

require_once'./db_connect.php';
function register_user($username, $email, $password){
    global $db;
    
    $sql = "INSERT INTO Users (username, email, pwd) VALUES ('$username', '$email', '$password')";
    $result = $db->query($sql);
    
    if($result){
        http_response_code(201);
        echo 'User successfully registered';
        $_SESSION['userID'] = $db->lastInsertId();
        exit();
    }
    else{
        echo 'failed to register';
    }
       
}

