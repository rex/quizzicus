<?php 

class Model_flashdata extends CI_Model {

	function __construct() {
		parent::__construct();
	}

	function sortMessages() {
		
		$error = $this->session->flashdata('error');
		$success = $this->session->flashdata('success');
		$msg_info = $this->session->flashdata('msg_info');
		
		//print_r($error);
		//print_r($success);
		//print_r($msg_info);
		$siteMessages = self::getSiteMessages();
		foreach($siteMessages as $k) {
			$data['alert'] = true;
			$data['items'][] = array('type'=>$k->msg_type,'msg'=>$k->content);
		}
		
		if(!empty($error)) {
			$data['alert'] = true;
			if(is_array($error)) {
				foreach($error as $k) {
					$data['items'][] = array('type'=>1,'msg'=>$k['msg']);
				}
			} else {
				$data['items'][] = array('type'=>1,'msg'=>$error);
			}
		}
		if(!empty($success)) {
			$data['alert'] = true;
			if(is_array($success)) {
				foreach($success as $k) {
					$data['items'][] = array('type'=>2,'msg'=>$k['msg']);
				}
			} else {
				$data['items'][] = array('type'=>2,'msg'=>$success);
			}
		}
		if(!empty($msg_info)) {
			$data['alert'] = true;
			if(is_array($msg_info)) {
				foreach($msg_info as $k) {
					$data['items'][] = array('type'=>3,'msg'=>$k['msg']);
				}
			} else {
				$data['items'][] = array('type'=>3,'msg'=>$msg_info);
			}
		}
		if(!empty($data)) {
			return $data;
		} else {
			return false;
		}
	}

	public function getSiteMessages() {
		try {
			$user_type = $this->session->userdata('user_type');
			if(!isset($user_type) || empty($user_type)) {
				$user_type = 3;
			}
			$this->db->select("*");
			$this->db->from("site_messages");
			$this->db->where("active = 1 AND sitewide = 1 OR for_user_type = $user_type");
			if(!$q = $this->db->get()) {
				throw new Exception();
			} else {
				return $q->result();
			}
		} catch(exception $e) {
			return false;
		}
	}
	
}

?>