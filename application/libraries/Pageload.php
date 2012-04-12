<?php 

class Pageload {

	function load($view = null, $data = null) {

		$CI =& get_instance();

		$this->checkIE();
		
		$CI->load->view('global/header_view',$data);
		$CI->load->view($view . '_view',$data);
		$CI->load->view('global/footer_view',$data);
	}
	
	function loadIndex($view = null, $data = null) {
	
		$CI =& get_instance();

		$this->checkIE();

		$CI->load->view('index/header_view',$data);
		$CI->load->view($view . '_view',$data);
		$CI->load->view('global/footer_view',$data);
	}

	function checkIE() {

		$browser = $_SERVER['HTTP_USER_AGENT'];
		if( strstr( $browser , "MSIE" )) {
			redirect("/ie/");
		}

	}

}

?>