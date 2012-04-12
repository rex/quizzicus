<?php 

class Home extends CI_Controller {
	
	public function index() {
		
		$data['title'] = "Quizzicus";
		$data['alerts'] = false;
		$this->pageload->loadIndex('index/splash',$data);
	
	}

	public function splash() {

		$data['title'] = "Quizzicus :: Coming Soon";
		$data['alerts'] = false;
		$this->load->view('index/comingsoon_view',$data);

	}
	
	public function landing() {
		$this->model_login->checkLogin();
		$data['title'] = $this->session->userdata('name_first') . ' ' . $this->session->userdata('name_last') . ' : Landing : Quizzicus';
		$quizzes = $this->session->userdata('quizzes');
		$data['quizzes']	=	$quizzes['data'];
		$data['session']	=	$this->session->all_userdata();
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$this->pageload->load('home/landing',$data);
	}

}


?>