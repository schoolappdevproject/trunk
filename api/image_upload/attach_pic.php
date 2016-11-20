<?php 


include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();



      /*    picName           : "pic_"+review_id+"_"+_inc,
                                picData           : reviewPicArray[pic].picData
                };*/

$file_name = $_POST['picName'];
$type      = $_POST['type'];
$data      = $_POST['picData'];
$review_id = $_POST['review_id'];

try
{
    $filepath = 'attach_pic/'.$file_name.'.'.$type;
    $result = [];
    
    $data = explode(',',$data);
    
   if(false ==  file_put_contents($filepath, base64_decode($data[1])))  
   {
       
           $log->info("failed to save file ");
   }
   else
   {
       
        $log->info("Successfully saved image $filepath");
       
           $ret = $database->insert('tbl_review_attachment', [
            'attachment_path'     => $filepath,
            'attachment_type'    =>$type,
            'id_review'         => $review_id   
        ]);

        if ($ret) {   
            $result['code'] =1;
           $log->info("Profile Pictorial uploaded succesfully at path ".$filepath);       
        } else {
            $result['code'] =0;
           $log->info("Profile Pictorial uploaded failed at path ".$filepath);       
        }

       
	   
   } 

    //database save 
 
     echo json_encode($result);
} 
catch(Exception $ex)
{
       $log->info(" Error : ".$ex->getMessage());
}
       $log->info("image updated ");

?>
