<?php 

class IE extends CI_Controller {
	
	public function index() {

		$data['title'] = "Quizzicus :: Coming Soon";
		$data['alerts'] = false;
		$this->load->view('global/ie_view',$data);

	}

}

?>