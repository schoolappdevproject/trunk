<?php 


include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();


$school_id       = $_POST['school_id'];
try
{
    $folder = "imageGallery//images//$school_id//";
    
    if(false == file_exists($folder))
    {
        return ;
    }

   $pictureNames = []; 
   $files = scandir($folder, 1);

   $i = 0;
   foreach($files as $pic)
   {
       if($pic =="." || $pic =="..")
       {
           continue;
       }

        $pictureNames[$i] = "api//image_upload//".$folder.$pic;
        $i = $i +1;
   }
   echo json_encode($pictureNames);
    
} 
catch(Exception $ex)
{
       $log->info(" Error : ".$ex->getMessage());
}

?>
