<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
  pin controller to display all pins of a user

 * @package pinterest clone controller
 * @subpackage
 * @uses : To handle all pins of a user irrespective of boards
 * @version $id:$
 * @since 13-04-2012
 * @author Vishal Vijayan
 * @copyright Copyright (c) 2007-2010 Cubet Technologies. (http://cubettechnologies.com)
 */
class Pins extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->sitelogin->entryCheck();
        $this->load->library('image_lib');
    }

    /**
     * Function to load each board induvidualy and displays the pins in it
     * @param
     * @author : Vishal
     * @since  : 22-03-2012
     * @return
     */
    public function index($id = false) {
        $data['title'] = "All pins";
        $data['id'] = ($id) ? $id : $this->session->userdata('login_user_id'); //logged user id
        $data['userDetails'] = $userDetails = userDetails($data['id']); //logged user details from user id

        if (empty($userDetails))
            redirect();

        $this->load->view('allpins_view', $data);
    }

    /**
     * Function to save the likes of a pin
     * @param
     * @author : Vishal
     * @since  : 22-03-2012
     * @return
     */
    function saveLikes() {
        $like = $_POST;
        $id = $this->board_model->saveLikes($like);
        $activity = array(
            'user_id' => $this->session->userdata('login_user_id'),
            'log' => "Liked a pin  ",
            'type' => "like",
            'action_id' => $like['pin_id']
        );
        activityList($activity);
        $count = getPinLikeCount($like['pin_id']);
        echo json_encode($count);
    }

    /**
     * Function to save the un likes of a pin
     * @param
     * @author : Vishal
     * @since  : 22-03-2012
     * @return
     */
    function unLike() {
        $like = $_POST;
        $id = $this->board_model->unLikes($like);

        $activity = array(
            'user_id' => $this->session->userdata('login_user_id'),
            'log' => "Un liked a pin  ",
            'type' => "like",
            'action_id' => $like['pin_id']
        );
        activityList($activity);
        $count = getPinLikeCount($like['pin_id']);
        echo json_encode($count);
    }

    /**
     * Function list all pins that comes under same source irrespective of user and board
     * @param  : $source
     * @author : Vishal
     * @since  : 26-04-2012
     * @return
     */
    function source($source = false) {
        $data['title'] = 'Source pins';
        $source = base64_decode($source);
        $data['source'] = $source ? $source : '';
        $data['id'] = (isset($id)) ? $id : $this->session->userdata('login_user_id'); //logged user id
        $data['userDetails'] = $userDetails = userDetails($data['id']); //logged user details from user id
        $this->load->view('source_pins', $data);
    }

    /**
     * Function list all pins that comes under same type irrespective of user and board
     * @param  : $source
     * @author : Vishal
     * @since  : 26-04-2012
     * @return
     */
    function videos($id = false) {
        $data['title'] = 'Videos';
        $data['id'] = $id = $id ? $id : $this->session->userdata('loged_in_user');
        $data['userDetails'] = $userDetails = userDetails($data['id']); //logged user details from user id

        $this->load->view('videopins_view', $data);
    }

    /**
     * Function load the confirm delete pin pop up page
     * @param  : $_POST
     * @author : Vishal
     * @since  : 10-05-2012
     * @return :
     */
    function confirmDelete($boardId, $pinId) {
        $data['boardId'] = $boardId;
        $data['pinId'] = $pinId;
        $this->load->view('deletePin_popup', $data);
    }

    /**
     * Function to delete a pin based on pin id and board id
     * @param  : $_POST
     * @author : Vishal
     * @since  : 10-04-2012
     * @return :
     */
    function deletePin() {
        $pinId = $this->input->post('pinId');
        $boardId = $this->input->post('boardId');

        $pin = $this->board_model->getPinDetails($pinId, $boardId);

        if ($this->board_model->getPinCountByField('pin_url', $pin->pin_url) == 1) {
            $explode = explode("/", $pin->pin_url);
            $count = count($explode);
            if (file_exists(getcwd() . "/application/assets/pins/" . $explode[$count - 2] . "/" . $explode[$count - 1]))
                unlink(getcwd() . "/application/assets/pins/" . $explode[$count - 2] . "/" . $explode[$count - 1]);
        }
        $this->board_model->deletePin($pinId, $boardId);
        echo json_encode(true);
    }

    function uploadPins() {
        $data['title'] = 'upload a pin';
        $this->load->view('upload_pin_view', $data);
    }

    /**
     * For add pin view
     * @param  :
     * @author : Aneesh T
     * @since  : 19-02-2013
     * @return :
     */
    function addPins() {
        $data['title'] = 'add a pin';
        $this->load->view('add_pin_view', $data);
    }

    /**
     * Function save the new uploaded an pin
     * @param  :
     * @author : Vishal,Vishnu <vishnu@cubettech.com>
     * @since  : 23-05-2012
     * @return :
     */
    function saveUploadPin() {
        $insert['description'] = $this->input->post('description');
        $insert['user_id'] = $user_id = $this->session->userdata('login_user_id');
        $insert['board_id'] = $boardId = $this->input->post('board_id');
        $insert['type'] = $this->input->post('type');
        $insert['source_url'] = $this->input->post('link');


        if ($_FILES["pin"]["name"] != '') {
            if ((($_FILES["pin"]["type"] == "image/gif") || ($_FILES["pin"]["type"] == "image/jpeg") || ($_FILES["pin"]["type"] == "image/pjpeg") || ($_FILES["pin"]["type"] == "image/png") || ($_FILES["pin"]["type"] == "image/PNG") || ($_FILES["pin"]["type"] == "image/GIF") || ($_FILES["pin"]["type"] == "image/JPG") || ($_FILES["pin"]["type"] == "image/JPEG"))) {
                if ($_FILES["pin"]["error"] > 0) {
                    echo "Return Code: " . $_FILES["pin"]["error"] . "<br />";
                } else {
                    $image = $_FILES["pin"]["name"];
                    $ext = explode('/', $_FILES["pin"]["type"]);
                    $image = time() . '_' . $image;
                    $image = str_replace(' ', '_', $image);
                    $dir = getcwd() . "/application/assets/pins/$user_id";
                    if (file_exists($dir) && is_dir($dir)) {
                        
                    } else {

                        $oldmask = umask(0);
                        mkdir(getcwd() . "/application/assets/pins/$user_id", 0777);
                        umask($oldmask);
                    }
                    move_uploaded_file($_FILES["pin"]["tmp_name"], getcwd() . "/application/assets/pins/$user_id/" . $image);

                    $img = $image;

                    $image = site_url("/application/assets/pins/$user_id/" . $image);

                    //creat ethumnail function by Robin
                    $th_dir = getcwd() . "/application/assets/pins/$user_id/thumb";
                    if (file_exists($th_dir) && is_dir($th_dir)) {
                        
                    } else {

                        $oldmask = umask(0);
                        mkdir(getcwd() . "/application/assets/pins/$user_id/thumb", 0777);
                        umask($oldmask);
                    }

                    //Modification by vishnu@cubettech.com on 27-09-2013 starts here
                    $config['image_library'] = 'gd2';
                    $config['source_image'] = getcwd() . "/application/assets/pins/$user_id/" . $img;
                    //$config['create_thumb'] = TRUE;
                    $config['new_image'] = getcwd() . "/application/assets/pins/$user_id/thumb/" . $img;
                    $config['maintain_ratio'] = TRUE;
                    $config['width'] = 200;
                    $config['height'] = 200;

                    try {
                        $this->image_lib->initialize($config);
                        $this->image_lib->resize();
                    } catch (Exception $e) {
                        die($e->getMessage());
                    }

                    //Modification by vishnu@cubettech.com on 27-09-2013 ends here
                }
                $insert['pin_url'] = $image;
                //$insert['source_url']      = '';
                $id = $this->board_model->saveUploadPin($insert);
                
                $like = $_POST;
                $like = array(
                		'pin_id' => $id,
                		'source_user_id' => 	$user_id,
                		'like_user_id' => $user_id
                );
                $id_like = $this->board_model->saveLikes($like);
                $activity = array(
                		'user_id' => $this->session->userdata('login_user_id'),
                		'log' => "Liked a pin  ",
                		'type' => "like",
                		'action_id' => $like['pin_id']
                );
                activityList($activity);
                $count = getPinLikeCount($like['pin_id']);
                echo json_encode($count);
                
                if ($id) {
                    redirect('board/pins/' . $boardId . '/' . $id);
                }
            } else {
                redirect('board/index/' . $boardId);
            }
        }
    }

    /**
     * Function save the new add pin
     * @param  :
     * @author : Aneesh T ,Vishnu <vishnu@cubettech.com>
     * @since  : 19-02-2013
     * @return :
     */
    function saveAddPin() {
        
        $insert['description'] = $this->input->post('description');
        $insert['user_id'] = $user_id = $this->session->userdata('login_user_id');
        $insert['board_id'] = $boardId = $this->input->post('board_id');
        $insert['type'] = 'image';
        $insert['source_url'] = $this->input->post('link');
        $remoteUrl = $this->input->post('current_img_src');
        if ($remoteUrl) {
            $dir = getcwd() . "/application/assets/pins/$user_id";
            if (!file_exists($dir) || !is_dir($dir)) {
                mkdir(getcwd() . "/application/assets/pins/$user_id", 0777);
            }

            $url_arr = explode('/', $remoteUrl);
            $ct = count($url_arr);
            $image = str_replace(' ', '_', time() . '_' . $url_arr[$ct - 1]);

            file_put_contents(getcwd() . "/application/assets/pins/$user_id/" . $image, file_get_contents($remoteUrl));

            $insert['pin_url'] = site_url("/application/assets/pins/$user_id/" . $image);

            //Modification by vishnu@cubettech.com on 27-09-2013 starts here
            $config['image_library'] = 'gd2';
            $config['source_image'] = getcwd() . "/application/assets/pins/$user_id/" . $image;
            //$config['create_thumb'] = TRUE;
            $config['new_image'] = getcwd() . "/application/assets/pins/$user_id/thumb/" . $image;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = 200;
            $config['height'] = 200;

            try {
                $this->image_lib->initialize($config);
                $this->image_lib->resize();
            } catch (Exception $e) {
                die($e->getMessage());
            }
            //Modification by vishnu@cubettech.com on 27-09-2013 ends here

            $id = $this->board_model->saveUploadPin($insert);
            
            
            if ($id) {
                redirect('board/pins/' . $boardId . '/' . $id);
            }
        }
    }

    private function InternetCombineUrl($absolute, $relative) {
        $p = parse_url($relative);
        if ($p["scheme"])
            return $relative;

        extract(parse_url($absolute));

        $path = dirname($path);

        if ($relative{0} == '/') {
            $cparts = array_filter(explode("/", $relative));
        } else {
            $aparts = array_filter(explode("/", $path));
            $rparts = array_filter(explode("/", $relative));
            $cparts = array_merge($aparts, $rparts);
            foreach ($cparts as $i => $part) {
                if ($part == '.') {
                    $cparts[$i] = null;
                }
                if ($part == '..') {
                    $cparts[$i - 1] = null;
                    $cparts[$i] = null;
                }
            }
            $cparts = array_filter($cparts);
        }
        $path = implode("/", $cparts);
        $url = "";
        if ($scheme) {
            $url = "$scheme://";
        }
        if ($user) {
            $url .= "$user";
            if ($pass) {
                $url .= ":$pass";
            }
            $url .= "@";
        }
        if ($host) {
            $url .= "$host/";
        }
        $url .= $path;
        return $url;
    }

    /*
     * Code added by Ansa<ansa@cubettech.com> on 08/10/2013.
     * Function to add pin by Url.
     */

    function pinsFromUrl() {
        $body_elemnt = array('h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p', 'div', 'ul', 'span', 'center', 'table', 'ol', 'li', 'body');
        set_time_limit(0); // Do not let the script time out

        include (getcwd() . '/application/controllers/simplehtmldom/simple_html_dom.php'); // include  the parser library
       //Code added by Ansa<ansa@cubettech.com> on 08/10/2013..code starts here.
        //To get last segment from url
        $url = $_GET['url'];
        $url = rtrim($url, '/');
        preg_match('/([^\/]*)$/', $url, $match);
        $val = explode(".", $match[0]);

        //To display selected image in div 
        if (!empty($val[1])) {
            //To check given input is image or not.
            if (!empty($val[2])) {
                 $jArray = array('description' => '', 'content' => '');
                 echo json_encode($jArray);
            } else {
               $size = getimagesize($url);
               if (!empty($size['mime'])) {
                    $div .= '<div class="images">';
                    $div .= '<img  src="' . $url . '" id="1" width="150"/>';
                    $div .= '<input name="total_images" id="total_images" value="' . 1 . '" type="hidden"/>';
                    $div .= '</div>';

                    $jArray = array('description' => 'test', 'content' => $div);
                    echo json_encode($jArray);
                } else {
                    $jArray = array('description' => '', 'content' => '');
                    echo json_encode($jArray);
                }
            }
        } else {
          //Code added by Ansa<ansa@cubettech.com> on 08/10/2013..code ends here. 
            //URL received via ajax
            $html = @file_get_html($url);
            // get DOM from URL fetched by ajax
            
            foreach ($html->find('base') as $e)
                ;
            $baseUrl = $e->href;

            //Fetch images url and add it to an array
            $images_url = array();
            foreach ($html->find('img') as $e) {
                //$imgSrc = $e->src;
                if ($baseUrl) {
                    $imgSrc = $baseUrl . $e->src;
                } else {
                    $imgSrc = self::InternetCombineUrl($url, $e->src);
                }
               
                // Loop through all images and make sure only appropriate image size is fetched
                // This will neglect icons , images from webpage layout etc
                if (substr($imgSrc, 0, 7) == 'http://' || substr($imgSrc, 0, 8) == 'https://') { // Make sure image url starts by either http or https
                    $ImgSize = @getimagesize($imgSrc);
                   // print_r($ImgSize);
                    // Get the size of current image
                    if ($ImgSize) {
                        if ($ImgSize[0] >= 100 && $ImgSize[1] >= 100) {
                        // echo "test";
                            $images_url[] = $imgSrc;
                            // Add image to array stack
                        }
                    }
                }
            }
         
     
            if (!empty($images_url)) {
                //echo $images_url;
                foreach ($html->find('meta[name=description]') as $e)
                    ; // Fetch Description from meta description of page
                $description = $e->content;
               //die;
                //Fetch  Description from body of page
                if (empty($description)) {
                    foreach ($body_elemnt as $elm) {
                        $description = trim($html->find($elm, 0)->plaintext);
                        if (strlen($description) > 50) {
                            break;
                        }
                    }
                }
            }
            //Some tidy up :)
            $html->clear();
            unset($html);

            if (!empty($images_url)) {

                if (count($images_url) > 1) {
                    // If there's more than 1 image fetched , display the next and previous button
                    $div = '<div><img src="' . base_url() . 'application/assets/images/prev.png" id="prev" alt=""/><img src="' . base_url() . 'application/assets/images/next.png" id="next" alt=""/></div>';
                    $div .= '<div id="totalimg">1 of ' . count($images_url) . '</div>';
                    // display total no. of images retrieved
                }



                // If image array contains images
                $div .= '<div class="images">';
                for ($i = 0; $i < count($images_url); $i++) {
                    // Loop through each image and add appropriate image tag
                    $y = $i + 1;

                    $div .= '<img style="display: none;" src="' . $images_url[$i] . '" id="' . $y .
                            '" width="150"/>';
                }
                $div .= '<input name="total_images" id="total_images" value="' . count($images_url) . '" type="hidden"/>';
                //Add the total no. of images to this hidden input.It will be used later when user press next/previous button
                $div .= '</div>';
            }

            $jArray = array('description' => $description, 'content' => $div);
            echo json_encode($jArray);
        }
    }

}

/* End of file pins.php */
/* Location: ./application/controllers/pins.php */