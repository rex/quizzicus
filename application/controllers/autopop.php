<?php

class AutoPop extends CI_Controller {
	
	public function index() {

		// Grab Country Codes
		$q = $this->db->select('iso')->from('taxonomy_countries')->get();
		foreach( $q->result_array() as $k=>$v ) {
			$countries[] = $v['iso'];
		}
		$q = $this->db->select("abbrev")->from('taxonomy_states')->get();
		foreach( $q->result_array() as $k=>$v ) {
			$states[] = $v['abbrev'];
		}

		$i = 10;
		$records = 500;
		$usernames = array();
		$max_type = 5;
		$fnames = array(
			"Sally" , "Bobby" , "Mark" , "Joe" , "Rebecca" , "Elizabeth" , "Sarah" , "Travis" , "Billy" , "Nathan" , "Yu" , "Josh" , "Ian" , "Jacob" , 
			"Michael" , "Scott" , "Matthew" , "Ethan" , "Andrew" , "Daniel" , "Anthony" , "Christopher" , "Alexander" , "Ryan" , "Tyler" , "Dylan" , "Benjamin"
		);
		$lnames = array(
			"Moore" , "Fisher" , "Hamilton" , "Darvish" , "Kinsler" , "Garcia" , "Jones" , "Mercer" , "Alameel" , "Davis" , "Johnson" , "Sills" , "Williams" , "Brown" , "Miller" , 
			"Anderson" , "Jackson" , "Martin" , "Harris" , "Thompson" , "Wilson" , "Taylor" , "Robinson" , "Martinez" , "Clark" , "Lewis" , "Lee"
		);
		$streets = array(
			"Oak" , "Spring Valley" , "Canton" , "Oak Lawn" , "Main" , "Belt Line" , "Clark" , "Cedar" , "Meadow Creek" , "Creek View" , "Valley View" , "Commerce" , "Gaston" , 
			"Awesome" , "Captain Amazing" , "Whatever" , "Baseball" , "Ballpark" , "Prairie" , "Spring Creek" , "Snob Hill" , "Swiss" , "Tree Grass" , "Lollipop" , "Happiness" , "Bay Point"
		);
		$streetEnds = array(
			"Blvd." , "St." , "Ave." , "Rd." , "Pkwy." , "Cir." , "Dr."
		);
		$phonePre = array(
			"972" , "214" , "817" , "469" , "505" , "512" , "201"
		);

		$finished = false;
		// First, we create users
		while( !$finished ) {
			$fname = array_rand(array_flip($fnames));
			$lname = array_rand(array_flip($lnames));
			$street = array_rand(array_flip( $streets ));
			$streetEnd = array_rand(array_flip( $streetEnds));
			$state = array_rand(array_flip($states));
			$country = array_rand(array_flip( $countries));
			$zip = rand(10000,99999);
			$phone = array_rand(array_flip($phonePre)) . "-" . rand(100,999) . '-' . rand(0,9999);

			$rand = mt_rand();
			$smallRand = rand(1000,9999);
			$uname = strtolower($fname[0] . $lname) . $rand;
			$pass = sha1($lname);
			if( $i % 10 == 0 ) {
				$active = 0;
			} else {
				$active = 1;
			}
			$address = "$smallRand $street $streetEnd SomeCity, $state $zip";

			if( in_array( $uname , $usernames ) ) {
				$uname = $uname . $rand;
			}
			if( in_array( $uname , $usernames ) ) {
				break;
			}
			$usernames[] = $uname;

			$time = date("Y-m-d H:i:s");

			$user[] = array(
				"username" => $uname,
				"password"	 => $pass,
				"user_type"	 => rand(1,$max_type),
				"active" => $active,
				"created_on" => $time,
				"active" => $active
			);
			$info[] = array(
				"name_first" => $fname,
				"name_last"  => $lname,
				"phone"		 => $phone,
				"country_code"=> $country,
				"address"	 => $address,
				"profile_image_url" => "profile" . rand(1,9) . ".jpg"
			);
			$activeUsers[$active][] = "$fname $lname";

			$i++;
			if( count($user) == $records ) {
				$finished = true;
			}
		}
		/*
		foreach( $user as $k=>$v ) {
			$this->db->insert('quizzers',$v);
			$info[$k]['user_id'] = $this->db->insert_id();
			$this->db->insert('quizzers_info',$info[$k]);
		}
		*/

		print "\n\n" . count($usernames) . "\n\n" ;
		//print_r($usernames);
		
		//print_r($activeUsers);
		foreach( $info as $k=>$v ) {
			print "<div style=\"clear:both;\">";
			print "<img src=\"http://localhost/quizzicus/assets/img/{$v['profile_image_url']}\" align=\"left\" />";
			print "<h2>{$v['name_first']} {$v['name_last']} a.k.a. {$user[$k]['username']}</h2>";
			print "Address: {$v['address']}<br />";
			print "Phone: {$v['phone']}<br />";
			print "</div> \n\n";
		}
		//print_r($info);
		//print_r($user);
		/**/
		//print '</pre>';
	}

	function show() {

		print "<pre>";
		print "</pre>";
		$q = "SELECT * FROM `quizzers` LEFT JOIN `quizzers_info` ON `quizzers_info`.`user_id` = `quizzers`.`id` LIMIT 100";
		$q = $this->db->query($q);
		foreach( $q->result() as $k ) {
			print '<div style="clear:both;">';
			print '<img src="http://localhost/quizzicus/assets/img/' . $k->profile_image_url . '" align="left" style="width:40px; height: 40px;"/>';
			print "<h2>{$k->name_first} {$k->name_last} ({$k->username})</h2>";
			print '</div>';
		}
	}
}

?>