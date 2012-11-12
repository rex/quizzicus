<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Quizzes extends CI_Controller {

	public function index() {
		$this->model_login->checkLogin();
		
	}
	
	public function view($qid)
	{
		$this->model_login->checkLogin();
		
		if(empty($qid) || strcmp($qid,'') == 0) {
			$this->session->set_flashdata('error','Invalid Quiz ID Specified');
			redirect($_SERVER['HTTP_REFERER']);
		}
		$info = $this->model_quiz->getQuizInfo($qid);

		print_r($info);
		//print_r($info);
		if(!$info['success']) {
			$this->session->set_flashdata('error',$info['msg']);
			$data['quiz'] = array('name'=>"We're sorry, but there has been an error. Please try again!");
		} else {
			$data['quiz'] = $info['info'];
		}
		$data['title']		=	'My Account';
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$data['session']	=	$this->session->all_userdata();
		$this->pageload->load('quiz/view',$data);
	}
	
	public function take($id)
	{
		$this->output->enable_profiler(TRUE);
		$this->model_login->checkLogin();
		
		$data['title']		=	'My Account';
		$data['alerts']		=	$this->model_flashdata->sortMessages();
		$data['session']	=	$this->session->all_userdata();
		
		$data['quiz']		=	$this->model_quiz->assembleQuiz($id);
		$this->pageload->load('quiz/take',$data);
	}

	public function processAnswer() {



	}
	
}

?>