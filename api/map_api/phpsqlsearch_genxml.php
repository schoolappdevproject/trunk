<?php

/**
 * Calculates the great-circle distance between two points, with
 * the Haversine formula.
 * @param float $latitudeFrom Latitude of start point in [deg decimal]
 * @param float $longitudeFrom Longitude of start point in [deg decimal]
 * @param float $latitudeTo Latitude of target point in [deg decimal]
 * @param float $longitudeTo Longitude of target point in [deg decimal]
 * @return float Distance between points in [Km] (same as earthRadius)
 */
function haversineGreatCircleDistance(
  $latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo)
{
  // convert from degrees to radians
  $earthRadius = 6371000;
  $latFrom = deg2rad($latitudeFrom);
  $lonFrom = deg2rad($longitudeFrom);
  $latTo = deg2rad($latitudeTo);
  $lonTo = deg2rad($longitudeTo);

  $latDelta = $latTo - $latFrom;
  $lonDelta = $lonTo - $lonFrom;

  $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
    cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
  return $angle * $earthRadius;
}



// Get parameters from URL
$center_lat = $_GET["lat"];
$center_lng = $_GET["lng"];
$radius = $_GET["radius"];

// Start XML file, create parent node
$dom = new DOMDocument("1.0");
$node = $dom->createElement("markers");
$parnode = $dom->appendChild($node);

// Opens a connection to a mySQL server
$connection=mysql_connect ("localhost", "root", "mysql");
if (!$connection) {
  die("Not connected : " . mysql_error());
}

// Set the active mySQL database
$db_selected = mysql_select_db("school_db_test", $connection);
if (!$db_selected) {
  die ("Can\'t use db : " . mysql_error());
}
                 
$query = "SELECT school_id,address, school_name, latitude, longitude ,city, session_timmings,category,school_type,courses,school_size,board, medium_of_teaching, mobility, small_description,religous_preference,profile_pic_data FROM tbl_school_main_table";

$result = mysql_query($query);
if (!$result) {
  die("Invalid query: " . mysql_error());
}

header("Content-type: text/xml");

while ($row = @mysql_fetch_assoc($result)){
  
  $distanceInKm = haversineGreatCircleDistance($center_lat,$center_lng,$row['latitude'],$row['longitude']);
  
  if($distanceInKm < $radius *1000)
  {  
    $node = $dom->createElement("marker");
    $newnode = $parnode->appendChild($node);
    $newnode->setAttribute("school_id", $row['school_id']);
    $newnode->setAttribute("name", $row['school_name']);
    $newnode->setAttribute("address", $row['address']);
    $newnode->setAttribute("lat", $row['latitude']);
    $newnode->setAttribute("lng", $row['longitude']);
    $newnode->setAttribute("distance", $distanceInKm);
    $newnode->setAttribute("session_timing", $row['session_timmings']);
    $newnode->setAttribute("city", $row['city']);
    $newnode->setAttribute("category", $row['category']);
    $newnode->setAttribute("school_type", $row['school_type']);
    $newnode->setAttribute("courses", $row['courses']);
    $newnode->setAttribute("school_size", $row['school_size']);
    $newnode->setAttribute("board", $row['board']);
    $newnode->setAttribute("medium_of_teaching", $row['medium_of_teaching']);
    $newnode->setAttribute("mobility", $row['mobility']);
    $newnode->setAttribute("religous_preference", $row['religous_preference']);
    $newnode->setAttribute("small_description", $row['small_description']);
    $newnode->setAttribute("profile_pic_data", base64_decode($row['profile_pic_data']));
  }
}

echo $dom->saveXML();
?>

