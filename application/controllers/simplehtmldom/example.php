<?php
// example of how to use basic selector to retrieve HTML contents
include('simple_html_dom.php');
 
// get DOM from URL or file
// Fetch Title 
$url = $_GET['url'];

$html = file_get_html($url);
//$html = file_get_html('http://youhack.me');
$title = trim($html->find('title', 0)->plaintext);

// Fetch Description 
foreach($html->find('meta[name=description]') as $e) ;
$description =  $e->content ;



//Fetch image links 
$images_url = array ();
foreach($html->find('img') as $e){
     //  echo $e->src . '<br>'; 
       $images_url[]=$e->src ;
}

    
    
    
//Some tidy up :)
 $html->clear();
unset($html);
    
    
    



?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $title  ?></title>
</head>

<body>


<?php

echo $description . '</br>' ;

//var_dump($images_url);
echo $images_url['5'];

?>

</body>
</html>







<?php

exit();










// find all image with full tag
foreach($html->find('img') as $e)
    echo $e->outertext . '<br>';
?>

