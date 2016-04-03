<?php
include_once 'connection.php';

$method = $_SERVER['REQUEST_METHOD'];

if($method) {
  if($method == 'GET') {
    $title = trim($_GET['title']);
    if($title){
      $result = $database->select("books", [
        "title",
        "price"
      ], [
        "title[~]" => $title
      ]);
    } else {
      $result = $database->select("books", [
        "title",
        "price"
      ]);
    }
    echo json_encode($result);
  } else if ($method == 'POST') {
    $title = trim($_POST['title']);
    $price = trim($_POST['price']);
    if(empty($title) || empty($price)){
      header("HTTP/1.1 400 Bad Request");
    } else {
      $duplicate_entry = $database->has("books",["title" => $title]);
      if(!$duplicate_entry) {
        $result = $database->insert('books', [
          'title' => $title,
          'price' => $price,
        ]);
      } else {
        header("HTTP/1.1 409 Conflict");
      }
      echo json_encode($result);
    }
  }else if ($method == 'PUT'){
    parse_str(file_get_contents("php://input"),$put_vars);
    $title = trim($put_vars['title']);
    $old_title = trim($put_vars['old_title']);
    $price = trim($put_vars['price']);

    if(empty($title) || empty($price) || empty($old_title)){
      header("HTTP/1.1 400 Bad Request");
    }

    $result = $database->update("books", [
      "title" => $title,
      "price" => $price
    ], [
      "title" => $old_title,
    ]);
    echo json_encode($result);

  } else if ($method == 'DELETE') {
    parse_str(file_get_contents("php://input"),$del_vars);
    $title = $del_vars['title'];
    $database->delete("books", [
      "AND" => [
        "title" => $title
      ]
    ]);
  } else {
    header("HTTP/1.1 405 Method Not Allowed");
  }
}

?>
