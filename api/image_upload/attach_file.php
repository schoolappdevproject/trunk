<?php 


include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();

/*
 var formData = {

                        fileName           : "file_"+fees_id,
                        fileData           : fees_file_attach_data.picData,
                        review_id          : fees_id
                 };
*/

$file_name = $_POST['fileName'];
$data      = $_POST['fileData'];
$fees_id   = $_POST['fees_id'];
$type      = $_POST['type'];

try
{
    $result = [];
    $filepath = 'file_upload/'.$file_name.$type; 

    $data = explode(',',$data) ;

    if(false ==  file_put_contents($filepath, base64_decode($data[1])))
    {
	$log->info("unable to save the file ");
    }
    else
    {

    
    //database save 
     $ret = $database->insert('tbl_fees_attachment', [
        'attach_path'     => $filepath,
        'attach_type'     => $type,
        'id_fees'         => $fees_id   
    ]);
    
    if ($ret) {   
        $result['code'] =1;
       $log->info("Attachemnet for fees review added succesfully at path ".$filepath);       
    } else {
        $result['code'] =0;
       $log->info("attachment for fees revies  uploaded failed at path ".$filepath);       
    }

   }
    
    echo json_encode($result);
    
} 
catch(Exception $ex)
{
       $log->info(" Error : ".$ex->getMessage());
}
       $log->info("image updated ");

?>
