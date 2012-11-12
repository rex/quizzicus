<?php 

class Home extends CI_Controller {
	
	public function index() {
		
		/*
		$data['title'] = "Quizzicus";
		$data['alerts'] = false;
		$this->pageload->loadIndex('index/splash',$data);
		*/
		$this->splash();
	
	}

	public function splash() {

		$data['title'] = "Quizzicus :: Coming Soon";
		$data['alerts'] = false;
		$this->pageload->checkIE();
		$this->load->view('index/comingsoon_view',$data);

	}

}


?>