<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Auth Library
 * Libray creates objects and stores complete user data to respective objects
 * 
 * @package Cubet Board
 * @subpackage WebServices 
 * @category API
 * @copyright (c) 2007 - 2013, Cubet Technologies (http://cubettechnologies.com)
 * @since 29-05-2013
 * @author Robin <robin@cubettech.com>
 */
    
class AuthAPI {
    //Declare variables and objects
    var $CI;
    protected $is_authenticated;

    //Declare global helpers, library etc.
    public function __construct() {
        $this->CI=& get_instance();
    }

    /**
     * Check if, user is authenticated
     * @param type $api_key username
     * @param type $api_token api key
     * @return boolean
     */
    public function authenticate($api_key, $api_token) {
        $key = $this->CI->config->item('api_key');
        $token = $this->CI->config->item('api_token');
 
        if($api_key == $key && $api_token == $token) {
            $this->is_authenticated = 1;
        }
        else {
            $this->is_authenticated = 0;
        }

        return $this->is_authenticated;
    }

    /**
     * Return user authentication Status
     * @return int Authentication Status
     */
    public function is_authenticated() {
        return $this->is_authenticated;
    }

}

/* End of file AuthAPI.php */ 
/* Location: ./application/library/AuthAPI.php */