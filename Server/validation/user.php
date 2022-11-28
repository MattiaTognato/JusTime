<?php

function user_registration_validate($data){
    $username = $data['username'];
    $email = $data['email'];
    $password = $data['password'];

    //VALIDATION
    if (!isset($username) || empty($username)){
        http_response_code(400);
        echo 'Bad Request';
        echo "\nUsername required";
        exit();       
    }
    if (!(isset($email) || empty($email))){
        http_response_code(400);
        echo 'Bad Request';
        echo "\nEmail required";
        exit();       
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
        http_response_code(400);
        echo 'Bad Request';
        echo "\nInvalid email";
        exit();
    }
    if (!(isset($password) || empty($password))){
        http_response_code(400);
        echo 'Bad Request';
        echo "\nPassword required";
        exit();
    }
    // Validate password strength
    $uppercase = preg_match('@[A-Z]@', $password);
    $lowercase = preg_match('@[a-z]@', $password);
    $number    = preg_match('@[0-9]@', $password);
    if(!$uppercase || !$lowercase || !$number || strlen($password) < 8) {
        http_response_code(400);
        echo 'Bad Request';
        echo "\nPassword should be at least 8 characters and should include at least one upper case letter and one number";
        exit();
    }
}