<?php

class My extends CI_Controller {
	
	function index() {

		redirect(site_url('my/profile'));

	}

	function profile() {
		$data = array('title'=>"My Profile");
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$data['userdata']	=	$this->model_my->fetch();
		$this->pageload->load('my/profile',$data);
	}

}