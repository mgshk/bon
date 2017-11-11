<?php

class ModelselleradvertiseAdvertiseFront extends Model
{
    public function getAdvertisesFront($position, $category_id, $limit='', $adv_count='')
    {	
		$country = $state = $city = '';
		if (isset($_COOKIE['myCookieaddress']) && $_COOKIE['myCookieaddress'] !='') { 
			$address = explode(',', $_COOKIE['myCookieaddress']);
			$country = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($address['3']))));
			$state = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($address['2']))));
			$city = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($address['1']))));
		}//print_r($state);exit; 
        $sql = "SELECT advertise_id, seller_id, offer_title, offer_image, nickname, offer_url,";

		if($category_id != '') {
			$sql .= " (SELECT CASE WHEN c_t_s.category_id = ".$category_id." THEN 1 ELSE 0 END FROM ".DB_PREFIX."category_to_seller c_t_s WHERE c_t_s.seller_id = cs.customer_id AND c_t_s.category_id = ".$category_id.") as filtered,";
		}

		$sql .= " (SELECT AVG(rating) AS total FROM ".DB_PREFIX."sellerreview r1 WHERE r1.seller_id = st_of.seller_id AND r1.status = '1' GROUP BY r1.seller_id) AS rating FROM ".DB_PREFIX."store_offers st_of LEFT JOIN ".DB_PREFIX."customer cs ON (cs.customer_id = st_of.seller_id)";

		$sql .= " WHERE cs.seller_approved = 1 and cs.active = 1 and CURDATE() >= st_of.from_date AND CURDATE() <= st_of.end_date  AND st_of.status = 'live' AND st_of.position = ".$position;
		if($position == 2){
			$sql .=" AND st_of.national = '".$country."'";
		} elseif($position == 3) {
			$sql .=" AND st_of.state = '".$state."'";
		} elseif($position == 4) {
			$sql .=" AND st_of.city = '".$city."'";
		}
		/*if($advertise_id !='') {
			$sql .=" AND advertise_id < '".$advertise_id."'";
		}*/
		$sql .= " GROUP BY st_of.advertise_id ORDER BY";

		if($category_id != '') {
			$sql .= " filtered DESC,";
		}

		//$sql .= " st_of.price DESC";
		$sql .= " st_of.price DESC, RAND()";

		if($adv_count !='') {
			$sql .= " limit ".$adv_count.", ".$limit;
		} else {
			$sql .= " limit 0,".$limit;
		}
		
		//print_r($sql);die;

        $query = $this->db->query($sql);

        return $query->rows;
    }

	 public function getAdvertisesHomeTopBanner()
    {
       $sql = "SELECT so.* FROM ".DB_PREFIX."customer cs INNER JOIN ".DB_PREFIX."store_offers so ON (cs.customer_id = so.seller_id) 
	   LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (so.advertise_id = htbd.store_offer_advertise_id) 
	   WHERE so.status = 'live' AND cs.seller_approved = 1 and cs.active = 1 and so.position = '1' and CURDATE() = htbd.date ORDER BY so.price DESC";

		//print_r($sql); die;

        $query = $this->db->query($sql);

        return $query->rows;
    }

	public function getAdvertisesFrontLocal($position, $category_id, $limit='', $adv_count='')
    {
        //$sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE  ORDER BY price DESC";

		if(isset($_COOKIE['myCookie'])){
			$cookie = $_COOKIE['myCookie'];
			$cookie_res = explode(',',$cookie);
			$latitude = $cookie_res[0];
			$longitude = $cookie_res[1];
		} else {
			$latitude = '13.067439';
			$longitude = '80.237617';
		}

		if(isset($_COOKIE['myCookiestart']) && isset($_COOKIE['myCookieend'])){
			$start_km = $_COOKIE['myCookiestart'];
			$end_km = $_COOKIE['myCookieend'];
		} else {
			$start_km = '0';
			$end_km = '3';
		}

		$sql = "SELECT offer_title, seller_id, offer_image, nickname, offer_url, price, advertise_id,";

		if($category_id != '') {
			$sql .= " (SELECT CASE WHEN c_t_s.category_id = ".$category_id." THEN 1 ELSE 0 END FROM ".DB_PREFIX."category_to_seller c_t_s WHERE c_t_s.seller_id = c.customer_id AND c_t_s.category_id = ".$category_id.") as filtered,";
		}

		$sql .= " (SELECT AVG(rating) AS total FROM ".DB_PREFIX."sellerreview r1 WHERE r1.seller_id = str.seller_id AND r1.status = '1' GROUP BY r1.seller_id) AS rating, ( 3959 * acos( cos( radians(".$latitude.") ) * cos( radians( lat ) ) *  cos( radians( lng ) - radians(".$longitude.") ) + sin( radians(".$latitude.") ) * sin( radians( lat ) ) ) ) AS distance FROM ".DB_PREFIX."customer c LEFT JOIN ".DB_PREFIX."store_offers str ON(c.customer_id = str.seller_id) WHERE c.seller_approved = 1 and c.active = 1 and  CURDATE() >= from_date AND CURDATE() <= end_date  AND str.status = 'live' AND position = ".$position." HAVING distance BETWEEN ".$start_km." AND ".$end_km." ORDER BY";

		
		
		if($category_id != '') {
			$sql .= " filtered DESC,";
		}
		$sql .= " str.price DESC, RAND()";		

		/*$sql1 = "SELECT offer_title, offer_image, nickname, offer_url, price, advertise_id,";

		if($category_id != '') {
			$sql1 .= " (SELECT CASE WHEN c_t_s.category_id = ".$category_id." THEN 1 ELSE 0 END FROM ".DB_PREFIX."category_to_seller c_t_s WHERE c_t_s.seller_id = c.customer_id AND c_t_s.category_id = ".$category_id.") as filtered,";
		}

		$sql1 .= " (SELECT AVG(rating) AS total FROM ".DB_PREFIX."sellerreview r1 WHERE r1.seller_id = 'st_of.seller_id' AND r1.status = '1' GROUP BY r1.seller_id) AS rating, ( 3959 * acos( cos( radians(".$latitude.") ) * cos( radians( lat ) ) *  cos( radians( lng ) - radians(".$longitude.") ) + sin( radians(".$latitude.") ) * sin( radians( lat ) ) ) ) AS distance FROM ".DB_PREFIX."customer c LEFT JOIN ".DB_PREFIX."store_offers str ON(c.customer_id = str.seller_id) WHERE  CURDATE() >= from_date AND CURDATE() <= end_date  AND str.status = 'live' AND position = ".$position." AND str.price = 0 HAVING distance BETWEEN ".$start_km." AND ".$end_km." ORDER BY";

		$sql1 .= " RAND(),";

		if($category_id != '') {
			$sql1 .= " filtered DESC";
		}

		$sql_final = "(".$sql.") UNION (".$sql1.")";*/

		/*if($category_id != '') {
			$sql1 .= " filtered DESC";
		}*/

		//print_r($sql); die;

		if($adv_count !='') {
			$sql .= " limit ".$adv_count.", ".$limit;
		} else {
			$sql .= " limit 0,".$limit;
		}

        $query = $this->db->query($sql);

        return $query->rows;
    }

}
