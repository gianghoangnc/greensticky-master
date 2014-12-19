<?php
/**
 * User Account API Controller
 * Sends response according to client requests related to account section
 * 
 * @package Cubet Board
 * @subpackage WebServices 
 * @category API
 * @copyright (c) 2007 - 2013, Cubet Technologies (http://cubettechnologies.com)
 * @since 29-05-2013
 * @author Robin <robin@cubettech.com>
 */

require APPPATH.'/libraries/REST_Controller.php';

class Account extends REST_Controller    {
    
    function __construct() {
        parent::__construct();
        //$this->sitelogin->entryCheck();
        $this->load->library('AuthAPI');
        $this->load->helper('url');
        $this->load->helper('pinterest_helper');
        $this->load->model('api/apiaccount_model');
        $this->load->model('action_model');
        define('XML_HEADER', 'account');
        define('XML_KEY', 'user');
    }
    
    /**
     * Login function
     * @since 29-05-2013
     * @author Robin <robin@cubettech.com>
     */
    function login_post()
    {
        $key = $this->post('key');
        $token = $this->post('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $username  = $this->post('username');
        $password  = md5($this->post('password'));
        $login     = $this->apiaccount_model->authenticate($username ,$password);

        if($login)
        {
            if($login['verification'] != 'done'){
                $this->response(array('error' =>  'Please verify your email address'), 401);
            }
            if($login['status'] == 0) {
                 $this->response(array('error' =>  'Sorry Your account has been disabled !'), 401);
            }
            $this->response(array('user' =>  $login), 200);
        } else{
            $this->response(array('error' =>  'Invalid Login'), 200);
        }  
    }
    
    /**
     * Get user details
     * @since 05-06-2013
     * @author Robin <robin@cubettech.com>
     */
    public function user_get(){
        $key = $this->get('key');
        $token = $this->get('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $user_id  = $this->get('user_id');
        
        $userDetails = $this->apiaccount_model->userDetails($user_id);
        $userDetails['followers'] = $this->action_model->getUserFollowersCount($userDetails['id']);
        $userDetails['following'] = $this->action_model->getUserFollowingCount($userDetails['id']);
        
        $this->response($userDetails, 200);
    }
    
    /**
     * Check for email uniqueness
     * @since 06-06-2013
     * @author Robin <robin@cubettech.com>
     */
    public function confirmEmail_post(){
        $key = $this->post('key');
        $token = $this->post('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $email  = $this->post('email');
        
        $userDetails = $this->apiaccount_model->check_email($email);
        
        $this->response($userDetails, 200);
    }
    
    /**
     * Check username uniqueness
     * @since 06-06-2013
     * @author Robin <robin@cubettech.com>
     */
    public function confirmUsername_post(){
        $key = $this->post('key');
        $token = $this->post('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $user_id  = $this->post('username');
        
        $userDetails = $this->apiaccount_model->check_username($user_id);
        
        $this->response($userDetails, 200);
    }
    
    /**
     * Register function
     * @since 29-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function register_post(){
        $key = $this->post('key');
        $token = $this->post('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $username = $this->post('username');
        $firstname = $this->post('first_name');
        $middle_name = $this->post('middle_name');
        $last_name = $this->post('last_name');
        $location = $this->post('location');
        $email = $this->post('email');
        $password = md5($this->post('password'));
        $connect_by = $this->post('connect_by');
        $desc = $this->post('description') ? $this->post('description') : '';
        $image = $this->post('image_url') ? $this->post('image_url') : false;
        
        if($image) {
            $image_path = getcwd()."/application/assets/images/{$username}.jpg";
            copy($image, $image_path);
            $imagename = $username . '.jpg';
        } else {
            $imagename = 'User.png';
        }
        
        $imagename = site_url('application/assets/images/'.$imagename);  
        
        $data = array(  'username' => $username,
                        'first_name' => $firstname,
                        'middle_name' => $middle_name,
                        'last_name' => $last_name,
                        'location' => $location,
                        'connect_by' => $connect_by,
                        'description' => $desc,
                        'email' => $email,
                        'image' => $imagename,
                        'password' => $password,
                        'status' => 1,
                        'verification' => 'done'
        );
        
        if($userId =$this->apiaccount_model->register($data)){
            //create default board
            $this->load->model('board_model');
            $boardArray =  array(
                       'user_id'       => $userId,
                       'board_name'    => 'My collections',
                       'who_can_tag'   => 'me',
                       'board_title'   => 'My collections',
                       'category'      => 'collection',
                       'collaborator'  => 'Name or Email Address'
                       );
            $this->board_model->createBoard($boardArray);

            $this->response(array('success' =>  'Registration Success'), 200);
        } else {
            $this->response(array('error' =>  'Registration failed'), 200);
        }
    }
    
    /**
     * user update function
     * @since 30-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function useredit_get(){
        $key = $this->get('key');
        $token = $this->get('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $id = $this->get('id');
        
        if(!$id) {
           $this->response(array('error' =>  'Edit who ? Input a user id!'), 401); 
        }
        
        $username = $this->get('username');
        $firstname = $this->get('first_name');
        $middle_name = $this->get('middle_name');
        $last_name = $this->get('last_name');
        $location = $this->get('location');
        $email = $this->get('email');
        $password = md5($this->get('password'));
        
        $data = array(  'username' => $username,
                        'first_name' => $firstname,
                        'middle_name' => $middle_name,
                        'last_name' => $last_name,
                        'location' => $location,
                        'email' => $email,
        );
        
        if($this->apiaccount_model->edit_user($id, $data)){
             $this->response(array('success' =>  'Updation Success'), 200);
        } else {
             $this->response(array('error' =>  'Updation failed'), 200);
        }
    }
    
    /**
     * change user password function
     * @since 30-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function changepwd_get(){
        $key = $this->get('key');
        $token = $this->get('token');

        $is_authenticated = $this->authapi->authenticate($key, $token);

        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $id = $this->get('id');      
        $oldpassword = $this->get('oldpassword');
        $newpassword = $this->get('newpassword');
        
        if(!$id || !$oldpassword || !$newpassword) {
           $this->response(array('error' =>  'Give me some inputs !'), 401); 
        }
        $oldpassword = md5($oldpassword);
        $newpassword = md5($newpassword);
        
        if($this->apiaccount_model->change_password($id, $oldpassword, $newpassword)){
             $this->response(array('success' =>  'Password changed succesfully'), 200);
        } else {
             $this->response(array('error' =>  'Passwords change failed ! Given password is wrong.'), 200);
        }
    }
}

/* End of file account.php */ 
/* Location: ./application/controllers/api/account.php */
