<?php

class My extends CI_Controller {
	
	function index() {

		redirect(site_url('my/profile'));

	}

	function profile() {
		$id = $this->session->userdata('id');

		if( !empty( $id ) ) {
			$data = array('title'=>"My Profile");
			$data['alerts']		=	$this->model_flashdata->sortMessages();
			$data['userdata']	=	$this->model_my->fetch();
			$this->pageload->load('my/profile',$data);
		} else {
			redirect(site_url('login'));
		}
	}

	public function dashboard() {
		$this->model_login->checkLogin();
		$data['title'] = $this->session->userdata('name_first') . ' ' . $this->session->userdata('name_last') . ' : Landing : Quizzicus';
		$quizzes = $this->session->userdata('quizzes');
		$data['quizzes']	=	$quizzes['data'];
		$data['session']	=	$this->session->all_userdata();
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$this->pageload->load('home/landing',$data);
	}

}