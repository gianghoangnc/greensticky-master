<?php
/**
 * Board API Controller
 * Sends response according to client requests
 * 
 * @package Cubet Board
 * @subpackage WebServices 
 * @category API
 * @copyright (c) 2007 - 2013, Cubet Technologies (http://cubettechnologies.com)
 * @since 29-05-2013
 * @author Robin <robin@cubettech.com>
 */

require APPPATH.'/libraries/REST_Controller.php';

class Board extends REST_Controller    {

    function __construct() {
        parent::__construct();
        //$this->sitelogin->entryCheck();
        $this->load->library('AuthAPI');
        $this->load->helper('url');
        $this->load->helper('pinterest_helper');
        $this->load->model('board_model');
        $this->load->model('api/apiaction_model');
        $this->load->model('api/apiaccount_model');
        define('XML_HEADER', 'boards');
        $this->load->library('image_lib');
    }
    
    /**
     * List all pins
     * @since 29 May 2013
     * @author Robin <robin@cubettech.com>
     */
    public function index_get(){    
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        //$config['base_url'] = site_url().'test/getAllpins';
        //$config['uri_segment']          = $this->uri->segment(3,2);

        $filter = $this->get('filter');
        $user_id = $this->get('user_id') ? $this->get('user_id') : false;
        $board_id = $this->get('board_id') ? $this->get('board_id') : false;
        $limit = $this->get('limit') ? $this->get('limit') : 15;
        $offset = $this->get('offset') ? $this->get('offset') : 0;

        if(! $filter || $filter == 'all') {
            $result = $this->apiaction_model->get_pins($user_id, $board_id, $order, $limit, $offset);
            if (empty($result)) {
                $this->response(array('error' => 'Sorry No results here!'), 200);
            }
        } else if ($filter == 'liked') {
            $result = $this->apiaction_model->get_most_liked($limit, $nextOffset);
            if (empty($result)) {
                $this->response(array('error' => 'Sorry No results here!'), 200);
            }
        } else if ($filter == 'repin') {
            $result = $this->apiaction_model->get_most_repinned($limit, $nextOffset);
            if (empty($result)) {
                $this->response(array('error' => 'Sorry No results here!'), 200);
            }
        } else {
            $this->response(array('error' => 'Invalid Filter!'), 200);
        }
        //send response
        define('XML_KEY', 'item');
        foreach($result as $key => $pin){
            $owner = $this->apiaccount_model->get_user($pin['user_id']);
            $board = $this->apiaction_model->get_board($pin['board_id']);
            //$result[$key]['board_images'] = $this->board_model->getEachBoardPins($pin['board_id'], 4);
            $repin = $this->apiaction_model->get_repin_source($pin['id']);
            if($repin) {
                 $result[$key]['repined'] = true;
                 $result[$key]['repined_from'] = $repin['from_pin_id'];
            } else {
                 $result[$key]['repined'] = false;
            }
            $result[$key]['owner_name'] = $owner['first_name'].' '.$owner['last_name'];
            $result[$key]['owner_img'] = $owner['image'];
            //get thumb image
            $img_name = basename($pin['pin_url']);
            $dir_url = str_replace($img_name, "", $pin['pin_url']);
            $result[$key]['pin_url'] = $dir_url . 'thumb/' . $img_name;
            
            $result[$key]['board_name'] = $board['board_name'];
            $result[$key]['likes'] = $this->board_model->getPinLikeCount($pin['id']);
            $result[$key]['repins'] = $this->board_model->getRepinCount('from_pin_id',$pin['id']);
        }
        
        $this->response($result, 200);
    }
    
    /**
     * Create New board
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com>
     */
    public function createBoard_get(){
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $user_id = $this->get('user_id');
        $board_name = $this->get('board_name');
        $desc = $this->get('description');
        $category = $this->get('category');
        
        if(!$user_id || !$board_name) {
           $this->response(array('error' =>  'Give me some inputs !'), 200); 
        }
        
        $board = array( 'board_name' => $board_name,
                        'board_title' => $board_name,
                        'category' => $category,
                        'description' => $desc,
                        'who_can_tag' => 'me',
                        'user_id' => $user_id,
        );
        
        if($id = $this->apiaction_model->create_board($board)) {
            $this->response(array('id' => $id), 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
    
     /**
     * Get all boards of auser
     * @since 06 June 2013
     * @author Robin <robin@cubettech.com>
     */
    public function getUserBoards_get(){
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $user_id = $this->get('user_id');
        
        if(!$user_id) {
           $this->response(array('error' =>  'Give me some inputs !'), 200); 
        }
        
        define('XML_KEY', 'board');
        if($results = $this->apiaction_model->getUserBoards($user_id)) {
            foreach ($results as $key => $result) {
                $results[$key]['pins'] = $this->board_model->getEachBoardPins($result['id'], 4);
            }
            $this->response($results, 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
    
    /**
     * Get a board by id
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com>
     */
    public function getBoard_get(){
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $board_id = $this->get('board_id');
        
        if(!$board_id) {
           $this->response(array('error' =>  'Give me some inputs !'), 401); 
        }
        
        if($result = $this->board_model->getBoardDetails($board_id)) {
            $this->response($result, 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
    
     /**
     * Delete board
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com>
     */
    public function deleteBoard_get(){
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $board_id = $this->get('board_id');
        
        if(!$board_id) {
           $this->response(array('error' =>  'Give me some inputs !'), 401); 
        }
        
        if($this->board_model->deleteBoard($board_id)) {
            $this->response(array('success' => 'Board Deleted!'), 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
    
    /**
     * Get pins details
     * @since 11 June 2013
     * @author Robin <robin@cubettech.com>
     */
    public function getPinsDetails_get(){
        $key = $this->get('key');
        $token = $this->get('token');
        
        $is_authenticated = $this->authapi->authenticate($key, $token);
            
        //Check if user is authenticated, if not, return error response
        if($is_authenticated == 0) 
        {
            $this->response(array('error' =>  'Authentication Failed'), 401);
        }
        
        $board_id = $this->get('board_id') ? $this->get('board_id') : NULL;
        $pin_id = $this->get('pin_id');
        $user_id = $this->get('user_id');
        
        if(!$pin_id) {
           $this->response(array('error' =>  'Give me all inputs !'), 401); 
        }
        
        if($result['pin'] = $this->board_model->getPinDetails($pin_id, $board_id)) {
            $result['comments'] = $this->board_model->getPinComments($pin_id);
            $result['owner'] = $this->apiaccount_model->get_user($result['pin']->user_id);
            $result['board'] = $this->apiaction_model->get_board($result['pin']->board_id);
            $result['board_images'] = $this->board_model->getEachBoardPins($result['pin']->board_id, 4);
            $result['like'] = $this->board_model->isLiked($pin_id, $user_id);
            $result['repined'] = $this->apiaction_model->get_repin_source($pin_id);
            $this->response($result, 200);
        } else {
            $this->response(array('error' => 'Something wrong!'), 200);
        }
    }
}

/* End of file board.php */ 
/* Location: ./application/controllers/api/board.php */