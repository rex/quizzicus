<?php if(!defined(BASEPATH)) exit("No direct script access allowed.");

class Mdb {

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

	function __construct() {

		$this->CI = $CI=&get_instance();
		$this->_connect();

	}

	function _connect() {



	}

}