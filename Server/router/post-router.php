<?php

function post_router($request){
    switch ($request){
            
        case 'register':

            // 
            if (!(isset($_POST['username']) && $_POST['username'] != ' ')){
                
            }
            break;
    
        case 'login':
            //TODO
            break;
    }
}