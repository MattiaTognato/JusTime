<?php

require_once'./db_connect.php';

function db_select_by_property($db_property, $value){
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
    if(db_select_by_property('username', $username)){
        http_response_code(400);
        echo 'Username already exists';
        exit();
    }
    if(db_select_by_property('email', $email)){
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

function login_user($username, $email, $password){
    if(isset($username) and !empty($username)){
        //login with username
        $result = db_select_by_property('username', $username);
    }
    if(isset($email) and !empty($email)){
        //login with email
        $result = db_select_by_property('email', $email);
    }

    if(!$result){
        // user not found
        http_response_code(400);
        echo 'user not found';
        exit();
    }
    
    if ($result['pwd'] == $password){
        $_SESSION['userID'] = $result['id'];
        http_response_code(200);
        echo 'User successfully logged in';
        exit();
    }

}

function get_user_info(){
    global $db;
    $id = $_SESSION['userID'];

    if (!isset($id)){
        // there isn't a session file for this user
        http_response_code(401);
        echo 'User not logged';
        exit();
    }
    // get user info from db
    $sql = "SELECT username, email from Users where id=$id ";
    $result = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
    
    http_response_code(200);
    echo json_encode($result);
    exit();   
}
function delete_user(){
    global $db;
    $id = $_SESSION['userID'];

    if (!isset($id)){
        // there isn't a session file for this user
        http_response_code(401);
        echo 'User not logged';
        exit();
    }
    // get user info from db
    $sql = "DELETE from Users where id=$id";
    $result = $db->query($sql)->fetch();
    
    if ($result){
        http_response_code(200);
        echo 'User successfully deleted';
    }
    else {
        http_response_code(400);
        echo 'User not deleted';
    }
    exit();   
}