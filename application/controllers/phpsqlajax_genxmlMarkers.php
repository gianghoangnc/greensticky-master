<?php
$username="root";
$password="root";
$database="cubetboard-master";
$tableAccount="account2";
$tableCallLog="call_logs2";
$tableDangerArea="danger_area";
$tableParameters="parameters2";
$tablePosition="position2";
$tableSms="sms2";


$imei = "222222222222222";
function parseToXML($htmlStr) 
{ 
$xmlStr=str_replace('<','&lt;',$htmlStr); 
$xmlStr=str_replace('>','&gt;',$xmlStr); 
$xmlStr=str_replace('"','&quot;',$xmlStr); 
$xmlStr=str_replace("'",'&#39;',$xmlStr); 
$xmlStr=str_replace("&",'&amp;',$xmlStr); 
return $xmlStr; 
} 

// Opens a connection to a MySQL server
$connection=mysql_connect (localhost, $username, $password);
mysql_query("SET character_set_results=utf8", $connection);
mb_language('uni');
mb_internal_encoding('UTF-8');
if (!$connection) {
  die('Not connected : ' . mysql_error());
}

// Set the active MySQL database
$db_selected = mysql_select_db($database, $connection);
mysql_query("set names 'utf8'",$connection);

if (!$db_selected) {
  die ('Can\'t use db : ' . mysql_error());
}

// Select all the rows in the markers table
$query = "select id, imei, name, comment, radius, latitude, longitude, createdAt from " . $tableDangerArea ." where imei = '$imei'";
$result = mysql_query($query);
if (!$result) {
  die('Invalid query: ' . mysql_error());
}

header("Content-type: text/xml");

// Start XML file, echo parent node
echo '<markers>';

// Iterate through the rows, printing XML nodes for each
while ($row = @mysql_fetch_assoc($result)){
  // ADD TO XML DOCUMENT NODE
  echo '<marker ';
  echo 'id="' . $row['id'] . '" ';
  echo 'imei="' .$row['imei'] . '" ';
  echo 'Name="' . $row['name'] . '" ';
  echo 'Comment="' . $row['comment'] . '" ';
  echo 'Radius="' . $row['radius']. '" ';
  echo 'Latitude="' .$row['latitude'] . '" ';
  echo 'Longitude="' . $row['longitude'] . '" ';
  echo 'createdAt="' . $row['createdAt'] . '" ';
  echo '/>';
}

// End XML file
echo '</markers>';

?>
