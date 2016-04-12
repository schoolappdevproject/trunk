<?php

require 'vendor/autoload.php';

$database = new medoo([
    'database_type' => 'mysql',
    'database_name' => 'db_name',
    'server' => 'localhost',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8'
]);

?>
