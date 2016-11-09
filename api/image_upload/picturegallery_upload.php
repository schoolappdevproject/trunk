<?php 


include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();

$data            = $_POST['data'];
$school_id       = $_POST['school_id'];
$ext    	     = $_POST['ext'];

try
{
	//create a directory with name of school id then start pushing file there 
// file name format picture_random_number.png 
	//$targetPath = $_SERVER['DOCUMENT_ROOT'] . $_REQUEST['folder'] . '/';
    $folder = ".//imageGallery//images//$school_id//";
    
    if(false == file_exists($folder))
    {
        if (!mkdir($folder, 0777, true)) {
            $log->info("unable to create directory $folder ");
        }
    }

    $filename = 'picture_'.rand(0,20000).'.'.$ext;
    $log->info("filename : ".$filename);
    
    $filepath = $folder."//".$filename;   
    
    $log->info("saving in the path $filepath");

   if(false ==  file_put_contents($filepath, base64_encode($data)))  
   {
	$result['code'] = -1;
       $log->info("failed to save file ");
   }
   else
   {
       $log->info("Successfully saved image ".$data);
	$result['code'] = 0;
   }      
    
   echo json_encode($result);
    
} 
catch(Exception $ex)
{
       $log->info(" Error : ".$ex->getMessage());
}

?>
