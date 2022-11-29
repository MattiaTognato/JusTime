<?php

require_once'./db_connect.php';

function db_value_already_exists($db_property, $value){
    // return false if $value is not present in column $db_property
    // otherwise return row where it exists
    global $db;

    $sql = "SELECT * from Users where $db_property='". $value ."'";
    $result = $db->query($sql)->fetch();
    
    return $result;
}
function register_user($username, $email, $password){
    global $db;
    
    // check if username and email already exists
    if(db_value_already_exists('username', $username)){
        http_response_code(400);
        echo 'Username already exists';
        exit();
    }
    if(db_value_already_exists('email', $email)){
        http_response_code(400);
        echo 'Email already exists';
        exit();
    }

    //insert user into database
    $sql = "INSERT INTO Users (username, email, pwd) VALUES ('$username', '$email', '$password')";
    $result = $db->query($sql);
    
    if($result){
        http_response_code(201);
        echo 'User successfully registered';
        $_SESSION['userID'] = $db->lastInsertId();
        exit();
    }
    else{
        http_response_code(400);
        echo 'failed to register';
    }
       
}

function get_user_info(){
    global $db;
    $id = $_SESSION['userID'];

    if (!isset($id)){
        http_response_code(403);
        echo 'user not logged';
    }

    $sql = "SELECT username, email from Users where id=$id ";
    $result = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
    
    http_response_code(200);
    echo json_encode($result);
    exit();   
}