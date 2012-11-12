<?php 

class Model_login extends CI_Model {

	function __construct() {
		parent::__construct();
	}
	
	public function checkLogin() {
		$loggedin = $this->session->userdata('loggedin');
		if(!isset($loggedin) || empty($loggedin) || ($loggedin != true)) {
			redirect('/login/');
		}
	}
	
	public function doLogin($user,$pass) {
		
		$logAttempts = $this->session->userdata('login_attempts');
		if(!isset($logAttempts)) {
			$logAttempts = 1;
		} else {
			$logAttempts = $logAttempts + 1;
		}
		$this->session->set_userdata('login_attempts',($logAttempts));

		try {
			/*
			if($this->session->userdata('login_attempts') >= 3) {
				throw new Exception("You have failed to enter correct login information too many times. Please wait a while and try again.");
			}
			*/
			$this->db->select('*');
			$this->db->from('quizzers');
			$this->db->where(array('username'=>$user,'password'=>$pass));
			$this->db->join('quizzers_info','quizzers_info.id = quizzers.id');
			if(!$q = $this->db->get()) {
				throw new Exception("The database was unable to process your login request at this time. Please try again!");
			}
			
			//print $this->db->last_query();
			if($q->num_rows() == 1) {
				//print 'One row returned!';
				//print_r($q->result());
				$data = $q->result();
				$session = $data[0];
				$this->session->set_userdata($session);
				$this->session->set_userdata('full_name',$session->name_first . ' ' . $session->name_last);
				
				if($session->active != 1) {
					throw new exception('Your account has been disabled by an administrator. Please contact support@quizzic.us if you feel an error has been made.');
				}
				if(self::loginFromBlacklistedIP()) {
					throw new Exception('Your account has been temporarily disabled by an administrator. Please contact support@quizzic.us if you feel an error has been made.');
				}
				if(self::userSuspended()) {
					throw new Exception('You are attempting to access an account which has been suspended. Please check your email for instructions on how to re-enable your account.');
				}
				$update = array(
					'ip_current'		=>	$this->input->ip_address(),
					'last_modified'		=>	date('Y-m-d H:i:s')
				);
				$this->db->where('id',$data->id);
				$this->db->update('quizzers',$update);
				
				$this->session->set_userdata('loggedin',true);
				
				return array('success'=>true,'msg'=>'Login was successful. Thank you for being a Quizzicus user!');
			} else {
				throw new Exception("No users were found with that information. Please try again.");
			}
		} catch( exception $e ) {
			return array('success'=>false,'msg'=>$e->getMessage());
		}
	}

	public function loginFromBlacklistedIP() {
		$ip = $this->input->ip_address();
		try {
			if(!$q = $this->db->get_where('ip_blacklist',array('ip'=>$ip))) {
				throw new Exception();
			}
			if($q->num_rows() > 0) {
				return true;
			} else {
				return false;
			}
		} catch( exception $e ) {
			return false;
		}
	}

	public function userSuspended() {
		$uid = $this->session->userdata('id');
		try {
			if(!$q = $this->db->get_where('suspensions',array('user_id'=>$uid))) {
				throw new Exception();
			}
			if($q->num_rows() > 0) {
				return true;
			} else {
				return false;
			}
		} catch(exception $e) {
			return false;
		}
	}
}

?>