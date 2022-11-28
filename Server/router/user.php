<?php

require_once('./controller/user.php');
require_once('./validation/user.php');

function user_router($request){
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);

        switch ($request){
            
            case 'register':        
                //validate request
                user_registration_validate($data);

                //get data from post request
                $username = $data['username'];
                $email = $data['email'];
                $password = $data['password'];              
                
                register_user($username, $email, $password);
                break;
        
            case 'login':
                //TODO
                break;
    
            default:
                http_response_code(404);
                echo 'Not Found';
                exit();       
        }
    }

    
}