<?php 

class Model_site_alerts extends CI_Model {

	function __construct() {
		parent::__construct();
	}

	public function getSiteMessages() {
		// Get user level from session
		// Hit database:
		//		Site-wide alerts
		//		Payment Alerts
		//		User-type specific alerts
		// Add to list of flashdata alerts
	}
	
}

?>