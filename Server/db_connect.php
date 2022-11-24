<?php
    const DB_HOST = 'localhost';
    const DB_USER = 'root';
    const DB_PASS = '';
    const DB_NAME = 'jusTime';
    // Establish database connection.
    try
    {
        $db = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS);
    }
    catch (PDOException $e)
    {
        exit("Error: " . $e->getMessage());
    }
?>