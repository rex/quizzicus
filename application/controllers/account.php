<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Account extends CI_Controller {

	
	public function index()
	{
		$this->model_login->checkLogin();
		
		$data['title']		=	'My Account';
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$data['session']	=	$this->session->all_userdata();
		$this->pageload->load('home/landing',$data);
	}
	
}

?>