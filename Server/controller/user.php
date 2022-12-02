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
        $_SESSION['email'] = $email;
        exit();
    }
    else{
        http_response_code(400);
        echo 'failed to register';
    }
       
}

function login_user($identifier, $password){
    
    $is_email = filter_var($identifier, FILTER_VALIDATE_EMAIL);

    if($is_email){
        //login with email
        $result = db_select_by_property('email', $identifier);
    }
    else{
        //login with username
        $result = db_select_by_property('username', $identifier);
    }

    if(!$result){
        // user not found
        http_response_code(400);
        echo 'user not found';
        exit();
    }
    
    if ($result['pwd'] == $password){
        $_SESSION['userID'] = $result['id'];
        $_SESSION['email'] = $result['email'];
        http_response_code(200);
        echo 'User successfully logged in';
        exit();
    }
    else{
        http_response_code(400);
        echo 'Wrong password';
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
        session_unset();
        session_destroy();
        http_response_code(200);
        echo 'User successfully deleted';
    }
    else {
        http_response_code(400);
        echo 'User not deleted';
    }
    exit();   
}