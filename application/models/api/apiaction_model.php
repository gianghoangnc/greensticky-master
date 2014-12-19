<?php
/**
 * User Actions section

 * @package pinterest clone model
 * @subpackage WebServices 
 * @category API
 * @since 29-05-2013
 * @author Robin <robin@cubettech.com>
 * @copyright Copyright (c) 2007-2010 Cubet Technologies. (http://cubettechnologies.com)
 */
class Apiaction_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    
    /**
     * Like a pin
     * @param array $like like data
     * @since 29-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function add_like($like){
        $this->db->where('pin_id', $like['pin_id']);
        $this->db->where('like_user_id', $like['like_user_id']);
        $query = $this->db->get('likes');
        
        if($query->num_rows() == 0) {
            $this->db->insert('likes', $like);
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Remove like
     * @param array $like like data
     * @since 29-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function remove_like($like){
        $this->db->where('pin_id', $like['pin_id']);
        $this->db->where('like_user_id', $like['like_user_id']);
        $this->db->delete('likes');
        
        if($this->db->affected_rows() !=0 ){
            return true;
        } else {
            return false;
        }
    }
    
    
    /**
     * Function to get all pins (Params are optional)
     * @param type $userID User id to filter
     * @param type $board_id Board id to filter
     * @param type $order order by
     * @param type $limit limit
     * @param type $offset offset
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com>
     */
    public function get_pins($userID=false, $board_id, $order=false, $limit, $offset) {

        if ($userID) {
            $this->db->where('user_id', $userID);
        }
        
        if ($board_id) {
            $this->db->where('board_id', $board_id);
        }
        
        if ($order) {
            $this->db->order_by($order);
        } else {
            $this->db->order_by('time', 'DESC');
        }

        $query = $this->db->get('pins', $limit, $offset);


        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return false;;
        }
    }
    
    /**
     * Function to get all repins
     * @param type $limit
     * @since 30 May 2013
     * @author Robin <robin@cubettech.com> 
     */
    public function get_most_repinned($limit, $nextOffset) {
        
        $this->db->select('pins.*, COUNT(`repin`.`from_pin_id`) AS count');
        $this->db->order_by('count', 'DESC');
        $this->db->group_by('repin.from_pin_id');
        $this->db->join('pins', 'pins.id=repin.from_pin_id');
        
        $query = $this->db->get('repin',$limit, $nextOffset);
    
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            return $result;
        } else {
            return false;
        }
    }
    
    /**
     * Function to get most liked pins
     * @param type $limit
     * @param type $nextOffset
     * @since 30 May 2013
     * @author Robin <robin@cubettech.com> 
     */
    function get_most_liked($limit, $nextOffset) {

        $this->db->select('pins.*, COUNT(`likes`.`pin_id`) AS count');
        $this->db->order_by('count', 'DESC');
        $this->db->group_by('likes.pin_id');
        $this->db->join('pins', 'pins.id=likes.pin_id');
        
        $query = $this->db->get('likes', $limit, $nextOffset);
       
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            return $result;
        } else {
            return false;
        }
    }    
    
    /**
     * Get the source of repin
     * @param int $pinid New Pin Id
     * @return int source pin details
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com> 
     */
    function get_repin_source($pinid){
        $this->db->select('repin.*, user.first_name as owner_first_name, user.middle_name as owner_middle_name,
             user.last_name as owner_last_name, user.image as owner_img');
        
        $this->db->where('new_pin_id', $pinid);
        $this->db->join('user', 'user.id=repin.owner_user_id', 'left');
        $query = $this->db->get('repin');
        
        if($query->num_rows() != 0) {
            return $query->row_array();
        } else {
            return false;
        }
    }
    
    /**
     * Create new board
     * @param array $board Board data
     * @since 31-05-2013
     * @author Robin <robin@cubettech.com>
     */
    public function create_board($board) {
        if($this->db->insert('board', $board)) {
            return mysql_insert_id();
        } else {
            return false;
        }
        
    }
    
    /**
     * Get board details by board Id
     * @param int $board_id Board Id
     * @return array
     * @since 31 May 2013
     * @author Robin <robin@cubettech.com> 
     */
    function get_board($board_id) {
        $this->db->where('id', $board_id);
        $query = $this->db->get('board');
        
        if($query->num_rows() != 0) {
            return $query->row_array();
        } else {
            return false;
        }
    }
    
     /**
     * Function to a get boards of a user
     * @param  : <int> $id
     * @author : Robin
     * @since  : 06-06-2013
     * @return : array
     */
    function getUserBoards($id)
    {
        $sql    = "SELECT 
                        *
                    FROM
                        board
                    WHERE
                        user_id = $id
                    ORDER BY
                        board_position ASC";
        $query  = $this->db->query($sql);
        
        return $query->result_array();
    }
}

/* End of file apiaction_model.php */ 
/* Location: ./application/models/api/apiaction_model.php */