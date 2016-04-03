<?php

require 'vendor/autoload.php';

$database = new medoo([
    'database_type' => 'mysql',
    'database_name' => 'app_db',
    'server' => 'localhost',
    'username' => 'root',
    'password' => 'mysql',
    'charset' => 'utf8'
]);

?>
