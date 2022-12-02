<?php

require_once('./controller/user.php');
require_once('./controller/password-reset.php');
require_once('./validation/user.php');

function user_router($request){
    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        switch ($request){
            case 'info':
                get_user_info();
                break;
            default:
                http_response_code(404);
                echo 'Not Found';
                exit();
        }

    }

    if($_SERVER['REQUEST_METHOD'] == 'PUT'){
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);

        switch ($request){
            case 'change-password':
                
                $new_password = $data['new_password'];  
                $old_password = $data['old_password'];  

                check_password($old_password, $new_password);
                change_password($new_password);
                break;
            default:
                http_response_code(404);
                echo 'Not Found';
                exit();
        }
    }

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
                user_login_validate($data);

                $identifier = $data['identifier'];
                $password = $data['password'];

                login_user($identifier, $password);
                break;

            case 'logout':
                session_unset();
                session_destroy();
                http_response_code(200);
                echo 'User successfully logged out';
                break;
            
            default:
                http_response_code(404);
                echo 'Not Found';
                exit();       
        }

    }
 
    if($_SERVER['REQUEST_METHOD'] == 'DELETE'){

        switch($request){

            case 'delete':
                delete_user();
                break;

            default:
                http_response_code(404);
                echo 'Not Found';
                exit();       
        }
        
    }
    
}