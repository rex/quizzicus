<?php if(!defined('BASEPATH')) exit("No direct script access allowed.");

final class Mdb {

	// Codeigniter superobject
	private $CI;

	// Utility vars
	private $db;
	private $conn;

	// MongoDB Login Information
	private $mdb_user;
	private $mdb_pass;
	private $mdb_host;
	private $mdb_port;
	private $mdb_db;

	// Public vars
	public $session;
	public $coll;

	function __construct() {

		// Grab the Superobject
		$this->CI = $CI=&get_instance();

		// Grab config information for MongoDB
		$this->mdb_user = 	$this->CI->config->item('mdb_user');
		$this->mdb_pass = 	$this->CI->config->item('mdb_pass');
		$this->mdb_host = 	$this->CI->config->item('mdb_host');
		$this->mdb_port = 	$this->CI->config->item('mdb_port');
		$this->mdb_db 	= 	$this->CI->config->item('mdb_db');
		$this->mdb_coll =	$this->CI->config->item('mdb_default_collection');

		// Set session according to config
		$this->session->enable = $this->CI->config->item('mdb_session_enable');

		// And away we go!
		$this->_init();

		$this->msg("MongoDB Connection Active!");

	}

	private function _init() {

		$this->_connect();
		$this->sessionStart();
		$this->showInfo();

	}

	private function _connect() {

		$this->conn = new Mongo( "{$this->mdb_host}:{$this->mdb_port}" );
		$this->db = $this->conn->{$this->mdb_db};
		$this->coll = $this->db->mdb_coll;

	}

	function msg( $msg , $style = "success" ) {

		print '<div style="width:500px;margin: 20px auto;" class="msg_' . $style . '">' . $msg . '</div>';

	}

	function showInfo() {
		$objToShow = array("coll","conn","db","session");
		foreach( $objToShow as $k=>$v ) {
			$this->msg( "$v: <br />" . print_r( $this->{$v} , true ) , "info" );
		}
		$this->msg( "Class Variables: <br />" . print_r( get_class_vars("Mdb"), true ) , 'info');
		$this->msg( "Functions: <br />" . print_r( get_class_methods("Mdb"), true ) , 'info' );
	}

	// 
	protected function setDb( $newDb ) {

		$this->db = $this->conn->{$newDb};
		$this->msg("Database set to $newDb.");

	}

	protected function setCollection( $newColl ) {

		$this->coll = $this->db->{$newColl};
		$this->msg("Collection set to $newColl.");

	}

	// Let's jump into some session functionality first, shall we?

	protected function enableSession() {

		$this->session->enable = true;

	}

	protected function disableSession() {

		$this->session->enable = false;

	}

	protected function sessionStart() {

		if( !$this->session->enable ) {
			return false;
		} else {
			if( !isset( $_SESSION['session_id'] ) ) {
				$this->buildSession();
			} else {
				//$this
			}
		}
	}

	protected function sessionFetch() {

		//if( !isset( $))

	}

	protected function buildSession() {

		$this->session->ip = $_SERVER['REMOTE_ADDR'];
		$this->session->id = sha1( $this->session->ip  . $this->CI->config->item('encryption_key') );
		$this->session->useragent = $_SERVER['HTTP_USER_AGENT'];
		$this->session->activity = time();
		$this->session->info = array();

	}

	protected function refreshSessionId() {



	}


}