<?php

require_once __DIR__.'/vendor/autoload.php';

//define
const CLIENT_ID = "your client id here";
const CLIENT_SECRET = "your secret key here";
const REDIRECT_URI = "your redirect uri here";

session_start();

//initializing
$client = new Google_Client();
$client->setClientId(CLIENT_ID);
$client->setClientSecret(CLIENT_SECRET);
$client->setRedirectUri(REDIRECT_URI);
$client->setScopes('email');

$plus = new Google_Service_Plus($client);

//processing
if(isset($_REQUEST['logout'])) {
  session_unset();
}

if(isset($_GET['code'])) {
  $client->authenticate($_GET['code']);
  $_SESSION['access_token'] = $client->getAccessToken();
  $redirect = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];

  header('Location:'.filter_var($redirect,FILTER_SANITIZE_URL));
}

if(isset($_SESSION['access_token']) && $_SESSION['access_token']) {
  $client->setAccessToken($_SESSION['access_token']);

  $me = $plus->people->get('me');
  $id = $me['id'];
  $name = $me['displayName'];
  $email =$me['emails'][0]['value'];
  $profile_pic = $me['image']['url'];

} else {
  $authUrl = $client->createAuthUrl();
}
?>

<div>
  <?php
  if(isset($authUrl)) {
    echo '<a class= "login" href= "'.$authUrl.'"><img src="/googleSocial/google-api-php-client/signin_button.png"</a>';
  } else {
    echo "ID = {$id} <br/>";
    echo "Name = {$name} <br/>";
    echo "Email = {$email} <br />";
    echo '<img src="'.$profile_pic.'" alt="img" />';
    echo '<a class="logout" href="?logout">Logout</a>';
  }
  ?>
</div>
