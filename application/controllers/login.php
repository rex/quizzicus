<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	
	public function index()
	{
		$data['title']		=	'Log In';
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$data['session']	=	$this->session->all_userdata();
		$this->pageload->load('login/landing',$data);
	}
	
	public function logout() {
		$this->session->sess_destroy();
		redirect('/login/');
	}
	
	public function go() {
		
		$info->user = $this->input->post('log_user');
		$info->pass = sha1($this->input->post('log_pass') . $this->config->item('encryption_key'));
		
		$this->session->set_userdata('username',$info->user);
		
		$errors = array();
		
		try {
			if(empty($info->user)) {
				$error = true;
				$errors[] = array('msg'=>"Username field required to log in. Please try again!");
			}
			
			if(empty($_POST['log_pass'])) {
				$error = true;
				$errors[] = array('msg'=>"Password field required to log in. Please try again!");
			}
			
			if(empty($errors)) {
				$result = $this->model_login->doLogin($info->user,$info->pass);
				if($result['success'] != true) {
					$error = true;
					$errors[] = array('msg'=>"The Log In process has failed. " . $result['msg']);
				}	
			}
			
			$this->session->set_userdata('quizzes',$this->model_quiz->fetchQuizzesForUser($this->session->userdata('id')));
			
			if(!$error) {
				redirect('/home/landing/');
			} else {
				throw new exception();
			}
		} catch(exception $e) {
			$this->session->set_flashdata('error',$errors);
			redirect('/login/');
		}
	}
}