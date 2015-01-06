<?php

/**
  Welcome controller for user invite and register

 * @package pinterest clone controller
 * @subpackage
 * @uses : To handle the user control
 * @version $id:$
 * @since 02-03-2012
 * @author Vishal Vijayan
 * @copyright Copyright (c) 2007-2010 Cubet Technologies. (http://cubettechnologies.com)
 */
class DangerArea extends CI_Controller {

    function __construct() {
        parent::__construct();

        $this->load->helper('url');
        $this->load->helper('pinterest_helper');
        $this->load->library('tank_auth');
        $this->load->model('editprofile_model');
    }

    /**
     * Function handle home and welcome page of a logged user
     * @param   :
     * @author  : Vishal
     * @since   : 01-03-2012
     * @return
     */
    function index() { 
        $this->load->view('dangerArea');
    }

    /*
     * Function to load the underconstruction page
     * @param   :
     * @author  : Vishal
     * @since   : 01-03-2012
     * @return
     */

    function underconstruction() {
        $this->sitelogin->entryCheck();
        $data['title'] = 'Under construction';
        $this->load->view('construction_view', $data);
    }

    /*
     * Function not in use
     * @param   :
     * @author  : Vishal
     * @since   : 01-03-2012
     * @return
     */

    function topsecret() {
        $fb_data = $this->session->userdata('fb_data');
        if ((!$fb_data['uid']) or (!$fb_data['me']))
            redirect('home');
        else {
            $data = array(
                'fb_data' => $fb_data,
            );
            $this->load->view('topsecret', $data);
        }
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>