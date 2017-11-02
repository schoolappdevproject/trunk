<?php

$school_id = $_GET['school_id'];
$filesoriginal = array();
$dir = 'imageGallery//images//'.$school_id.'//';



if (is_dir($dir)){
    $dhandle_ = opendir($dir);
    if ($dhandle_) {
           while (false !== ($fname = readdir($dhandle_))) {
              $ext = pathinfo($fname, PATHINFO_EXTENSION);

              if (($fname != '.') && ($fname != '..') &&
                  ($fname != basename($_SERVER['PHP_SELF'])) &&
                  (($ext == 'jpg')||($ext == 'gif'))
                  ) {
                  $filesoriginal[] = (is_dir( "./$fname" )) ? "(Dir) {$fname}" : $fname;
              }
           }
           sort($filesoriginal);
           closedir($dhandle_);
    }
}

$_html="";
$i=0;
foreach( $filesoriginal as $fname ){
    

   $image_path = "api/image_upload/imageGallery/images/$school_id/$fname";
   $_html .= "<li>";
   $_html .= "<a href='".$image_path."'>";
   $_html .= "<img title='image' src='".$image_path."' height='150px' width='200px'  class='image'>";  
   $_html .= "</a>";
   $_html .= "</li>";
   $i++;
}
echo $_html;
?>
  
