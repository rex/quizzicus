<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Utilities extends CI_Controller {
		
	function index() {
		print "You're in the wrong place.";
	}
	
	function databaseview() {
		
	}
	
	function databasebackup() {
		
		$this->load->dbutil();
		
		$backup =& $this->dbutil->backup();
		
		$this->load->helper('file');
		
		$date = date("Y-m-d_H:i:s");
		write_file('mybackup.gz',$backup);
		
		$this->load->helper('download');
		//force_download('mybackup.gz',$backup);
		print_r($date);
		print_r($backup);
		
	}
	
	function backupdb(){
        
        ob_start();
		passthru('mysqldump -u quizzicus_db -p 26Nc7mdz5Kz5NyDT quiz');
		$out = ob_get_clean();
		$fp = fopen('/var/www/html/dump.sql','w');
		fwrite($fp,$out); 
		$date = date("Y-m-d");
		$name = $date.'-quizzicus.gz';
		$this->load->helper('download');
		force_download($name, gzencode($out)); 
    }


}

?>	