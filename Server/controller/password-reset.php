<?php

const SENDER_EMAIL_ADDRESS = '6190097@itisrossi.vi.it';

require_once'./db_connect.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require './mailer/Exception.php';
require './mailer/PHPMailer.php';
require './mailer/SMTP.php';


function email_setup() {
    $mail = new PHPMailer(true);
    $mail->SMTPDebug = 0;
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Port = 587;
    $mail->SMTPSecure = 'tls';
    $mail->Username = 'projectworklibrary@gmail.com';
    $mail->Password = 'ProjectWorkLibrary2022!';

    $mail->isHTML(true);  // Set email format to HTML
    return $mail;
}
$mail = email_setup();

function check_password($old_password_received, $new_password_received){
    global $db;
    //get old password
    $id = $_SESSION["userID"];
    if (!isset($id)){
        // there isn't a session file for this user
        http_response_code(401);
        echo 'User not logged';
        exit();
    }
    $sql = "SELECT * from Users where id= $id";
    $result = $db->query($sql)->fetch();
    $old_password = $result['pwd'];


    if ($old_password != $old_password_received){
        http_response_code(400);
        echo "old password not matching";
        exit();
    }
    if ($old_password == $new_password_received){
        http_response_code(400);
        echo "new password can't be the same as old password";
        exit();
    }
    // Validate password strength
    $uppercase = preg_match('@[A-Z]@', $new_password_received);
    $lowercase = preg_match('@[a-z]@', $new_password_received);
    $number    = preg_match('@[0-9]@', $new_password_received);
    if(!$uppercase || !$lowercase || !$number || strlen($new_password_received) < 8) {
        http_response_code(400);
        echo 'Bad Request';
        echo "\nPassword should be at least 8 characters and should include at least one upper case letter and one number";
        exit();
    }   
}
function change_password($new_password_received){
    global $db;
    $id = $_SESSION['userID'];

    $sql = "UPDATE Users SET pwd='" . $new_password_received . "' WHERE id=$id";
    $result = $db->query($sql);
    
    if ($result) {
        http_response_code(200);
        echo "User password has been successfully changed";
    }
    else {
        http_response_code(400);
        echo "Cannot change user password";
    }
}

function generate_token(): string
{
    return bin2hex(random_bytes(4));
}
/*
function send_token_reset(){
    global $mail;
    $token= generate_token(); //generate token
    $_SESSION['token'] = $token;

    $mail->From = 'projectworklibrary@gmail.com';
    $mail->addCC($_SESSION['email']);     // Add a recipient
    
    // set email subject & body
    $subject = 'Please activate your account';
    $message = <<<MESSAGE
            Hi,
            Please click the following link to activate your account:
            $token
            MESSAGE;
    $mail->Subject = $subject;
    $mail->Body    = $message;
    
    if(!$mail->send()) {
        http_response_code(400);
        echo 'Message could not be sent.';
        echo 'Mailer Error: ' . $mail->ErrorInfo;
    } else {
        http_response_code(200);
        echo 'Message has been sent to ' . $_SESSION['email'];
    }
    exit();
}*/