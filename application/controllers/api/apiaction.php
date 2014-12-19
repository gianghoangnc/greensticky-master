<?php
/**
 * Customer API Controller
 * Sends response according to client requests Customer api management
 * 
 * @package Cubet Board
 * @subpackage WebServices 
 * @category API
 * @copyright (c) 2007 - 2013, Cubet Technologies (http://cubettechnologies.com)
 * @since 29-05-2013
 * @author Robin <robin@cubettech.com>
 */

require APPPATH.'/libraries/REST_Controller.php';

class Apiaction extends REST_Controller    {
    
    function __construct() {
        parent::__construct();
        
        //$this->sitelogin->entryCheck();
        $this->load->library('AuthAPI');
        $this->load->helper('url');
        $this->load->helper('pinterest_helper');
        $this->load->model('api/apiaccount_model');
        $this->load->model('api/apiaction_model');
        $this->load->library('image_lib');
        define('XML_HEADER', 'actions');
    }
    
    /**
     * Like a pin
     * @since 29-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function like_get(){
        
        $key = $this->get('key');
        $token = $this->get('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $pinid = $this->get('pin_id');
        $ownerid = $this->get('owner_id');
        $userid = $this->get('user_id');
        
        if(!$pinid || !$ownerid || !$userid) {
            $this->response(array('error' =>  'Sorry! Some inputs missing!'), 401);
        }
        
        define('XML_KEY', 'like');
        $like = array(  'pin_id' => $pinid,
                        'source_user_id' => $ownerid,
                        'like_user_id' => $userid
        );
        
        if($this->apiaction_model->add_like($like)) {
             $this->response(array('msg' =>  'Pin Liked'), 200);
        } else {
             $this->response(array('msg' =>  'Already liked! '), 200);
        }
    }
    
    /**
     * Remove a like
     * @since 29-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function unlike_get(){
        
        $key = $this->get('key');
        $token = $this->get('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $pinid = $this->get('pin_id');
        $userid = $this->get('user_id');
        
        if(!$pinid || !$userid) {
            $this->response(array('error' =>  'Sorry! Some inputs missing!'), 401);
        }
        
        define('XML_KEY', 'like');
        
        $like = array(  'pin_id' => $pinid,
                        'like_user_id' => $userid
        );
        
        if($this->apiaction_model->remove_like($like)) {
             $this->response(array('msg' =>  'Like Removed'), 200);
        } else {
             $this->response(array('msg' =>  'No Like exits!'), 200);
        }
    }
    
    /**
     * Add new pin
     * @since 31-05-2013
     * @author Robin <robin@cubettech.com>
     */
    function uploadPin_post()
    {
         
        $key = $this->post('key');
        $token = $this->post('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
         
        $image_data = $this->post('image_data');        
        
        $insert['description']     = $this->post('description') ? $this->post('description') : '';
        $insert['user_id']         = $user_id = $this->post('user_id');
        $insert['board_id']        = $boardId = $this->post('board_id');
        $insert['type']            = $this->post('type') ? $this->post('type') : 'image';
        $insert['source_url']      = $this->post('link') ? $this->post('link') : ''; 
        $insert['gift']            = $this->post('gift') ? $this->post('gift') : ''; 

        
        if($image_data) { 
            
            $imageData = base64_decode($image_data);

            $image = time().'_'.$image.'.jpg';
            $image = str_replace(' ', '_', $image); 
            $dir = getcwd()."/application/assets/pins/$user_id";

            if(! file_exists($dir) || !is_dir($dir))
            {
                $oldmask = umask(0);
               mkdir(getcwd()."/application/assets/pins/$user_id",0777);
               umask($oldmask);
            }

            $fp = fopen(getcwd()."/application/assets/pins/$user_id/" . $image, 'w');
            fwrite($fp, $imageData);
            fclose($fp); 

            $img = $image;
            $image = site_url("/application/assets/pins/$user_id/".$image);

             //creat ethumnail function by Robin
            $th_dir = getcwd()."/application/assets/pins/$user_id/thumb";
            if(file_exists($th_dir) && is_dir($th_dir))
            {

            }
            else{

                $oldmask = umask(0);
                mkdir(getcwd()."/application/assets/pins/$user_id/thumb",0777);
                umask($oldmask);
            }

            $config['image_library'] = 'gd2';
            $config['source_image']	= getcwd()."/application/assets/pins/$user_id/" . $img;
            $config['new_image'] = getcwd()."/application/assets/pins/$user_id/thumb/" . $img;
            $config['maintain_ratio'] = TRUE;
            $config['width']	 = 100;
            $config['height']	= 100;

            try {
                $this->image_lib->initialize($config);
                $this->image_lib->resize();
            } 
            catch (Exception $e)
            {
                die($e->getMessage());
            }

            $insert['pin_url']      = $image;

            $id= $this->board_model->saveUploadPin($insert);
            if($id)
            {
                $this->response(array('success' =>  'Pin Uploaded!'), 200);
            } else {
                $this->response(array('error' =>  'Something wrong!'), 200);
            }
            
        } else {
             $this->response(array('error' =>  'Give me the inputs!'), 200);
        }

     }
    
    /**
     * Repin function
     * @since 31-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function repin_post()
    {
        $key = $this->post('key');
        $token = $this->post('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $pin_id = $this->post('pin_id');
        $user_id = $this->post('user_id');
        $board_id = $this->post('board_id');
        
        if(!$pin_id || !$user_id || !$board_id )
        {
            $this->response(array('error' =>  'Give me the inputs!'), 200);
        }
        
        $pinDetails = getPinDetails($pin_id);
        
        $value = array( 'user_id'=> $user_id,
                        'pin_url'=> $pinDetails->pin_url,
                        'source_url'=> $pinDetails->source_url,
                        'board_id'=> $board_id,
                        'type'    => $pinDetails->type,
                        'description'=> $this->get('description') ? $this->get('description') : $pinDetails->description,
        );
        
        $id = $this->board_model->saveNewPin($value);

        $value['insertId']      = $id;
        $activity['user_id']    = $user_id;
        $activity['log']        =  "Repined a pin";
        $activity['type']       =  "repin";
        $activity['action_id']  =  $id;
        $activity['link']       =  $pinDetails->pin_url;
        activityList($activity);

        $saveRepin = array( 'repin_user_id' => $user_id,
                            'owner_user_id' => $pinDetails->user_id,
                            'from_pin_id'   => $pin_id,
                            'new_pin_id'    => $id
        );
        $this->board_model->saveRepin($saveRepin);
        
        $this->response(array('success' =>  'Succesfully Repined'), 200);
     }
     
    /**
     * Delete pin function
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com>
     */
    public function deletePin_get(){
       
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $pin_id = $this->get('pin_id');
        $board_id = $this->get('board_id');
        
        if(!$pin_id || !$board_id) {
           $this->response(array('error' =>  'Give me all the inputs !'), 401); 
        }
        
        if($this->board_model->deletePin($pin_id, $board_id)) {
            $this->response(array('success' => 'Pin Deleted!'), 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
    
   /**
    * Function to a insert comments for each pins
    * @since 31 May 2013
    * @author Robin <robin@cubettech.com>
    */
    function addComment_post() {
        
        $key = $this->post('key');
        $token = $this->post('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $array['user_id'] = $this->post('user_id');
        $array['pin_id'] = $this->post('pin_id');
        $array['comments'] = $this->post('comment');
        
        if(!$array['user_id'] || !$array['pin_id'] || !$array['comments'] ) {
           $this->response(array('error' =>  'Give me all the inputs !'), 400); 
        }
       
        if($lastInsertId = $this->board_model->insertPinComments($array)){
            $this->response(array('success' => 'Commented!'), 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
        
    }
    
    /**
     * Function to delete a comment of a pin
     * @param  :
     * @author : Vishal
     * @since  : 02-04-2012
     * @return
     */
    function deleteComment_get() {
        
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $commentId = $this->get('comment_id');
        
        if(!$commentId) {
           $this->response(array('error' =>  'Give me all the inputs !'), 401); 
        }
       
        if($this->board_model->deleteComment($commentId)){
            $this->response(array('success' => 'Comment deleted!'), 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
}
 
/* End of file apiaction.php */ 
/* Location: ./application/controllers/api/apiaction.php */