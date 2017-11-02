<?php
class ModelLocalisationCountry extends Model {
	public function getCountry($country_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE country_id = '99' AND status = '1'"); //

		return $query->row;
	}

	public function getCountries() {
		$country_data = $this->cache->get('country.catalog');

		if (!$country_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = '1' ORDER BY name ASC");

			$country_data = $query->rows;

			$this->cache->set('country.catalog', $country_data);
		}

		return $country_data;
	}

	public function getCities($city_name) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cities WHERE city_state = '".$city_name."' AND status = '1' 
			ORDER BY city_name ASC");

		return $query->rows;
	}
}