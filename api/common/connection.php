<?php

require 'vendor/autoload.php';

$database = new medoo([
    'database_type' => 'mysql',
    'database_name' => 'school_db_test',
    'server' => 'localhost:8889',
    'username' => 'root',
    'password' => 'mysql',
    'charset' => 'utf8'
]);

?>
