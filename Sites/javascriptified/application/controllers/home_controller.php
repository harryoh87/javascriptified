<?php

/**
 * 
 *
 * @package default
 * @version 1.0
 * @author Hyun Seok Oh
 */
class Home_controller extends CI_Controller {

    /**
     * 
     *
     * @since 1.0
     * @author Hyun Seok Oh
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 
     *
     * @return void
     *
     * @since 1.0.0
     * @author Hyun Seok Oh
     */
    public function index()
    {
        $this->load->view('template', array('main_content' => 'home/home'));
    }
}

/* End of file home_controller.php */
/* Location ./applications/controllers/home_controller.php */