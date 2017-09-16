<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategories($parent_id = 0) {
		/*$sql = "SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)";*/
		$sql = "SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)";

		//echo $sql; die;
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getCategoriesList() {
		$categories = [];

		$sql = "SELECT c.category_id, cd.name 
			FROM " . DB_PREFIX . "category as c 
			INNER JOIN " . DB_PREFIX . "category_description as cd ON cd.category_id = c.category_id  
			WHERE c.parent_id = 0 AND cd.language_id = " . (int)$this->config->get('config_language_id');
		
		$query = $this->db->query($sql);

		foreach ($query->rows as $row) {
			$categories[$row['category_id']] = $row;
		}

		return $categories;
	}

	public function getSubCategories($category_id, $subcategory_ids) {
		$sub_categories = [];

		$sql = "SELECT cp.category_id AS category_id, 
			GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, cp.path_id
			FROM " . DB_PREFIX . "category_path cp 
			LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) 
			LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) 
			LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) 
			LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) 
			WHERE cp.category_id IN ('".$subcategory_ids."') AND c1.parent_id != 0 AND cd1.language_id = ".(int)$this->config->get('config_language_id')." 
			AND cd2.language_id = ".(int)$this->config->get('config_language_id')." GROUP BY cp.category_id 
			HAVING cp.path_id = '".$category_id."' ORDER BY name ASC";

			//echo $sql;

			$query = $this->db->query($sql);

			foreach ($query->rows as $row) {
				$sub_categories[$row['category_id']] = $row;
			}

			return $sub_categories;
	}

	public function getSellerCategories($parent_id, $seller_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN ".DB_PREFIX."category_to_seller cs ON(c.category_id = cs.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c.status = '1' AND cs.seller_id = ".$seller_id." ORDER BY c.category_id ASC";
		//print_r($sql);
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getCategoryFilters($category_id) {
		$implode = array();

		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}

		$filter_group_data = array();

		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");

			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();

				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");

				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id' => $filter['filter_id'],
						'name'      => $filter['name']
					);
				}

				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $filter_data
					);
				}
			}
		}

		return $filter_group_data;
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}

	public function getCategories_auto($data = array()) {
		$sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE c1.parent_id = '0' AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY cp.category_id";

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		/*if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}*/

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getSubCategories_auto($data = array()) {
		$sql = "SELECT cp.category_id AS category_id, cp.path_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE c1.parent_id != 0 AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY cp.category_id";

		$sql .= " HAVING cp.path_id=".$data['path_id'];

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		/*if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}*/
		//print_r($sql);

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getStoreSellerSubcategories($inputs, $cat) {
		//print_r($inputs);
		if($cat == 1) {
			//$this->cache->delete('product');
			$this->db->query("INSERT INTO ".DB_PREFIX."category_to_seller SET category_id = '".$inputs['category_id']."', seller_id = '".(int) $inputs['seller_id']."', status = '".$inputs['status']."'");	
		} else {
			$this->db->query("UPDATE ".DB_PREFIX."customer SET seller_category = '".$inputs."' WHERE customer_id = '".(int) $this->customer->getID()."'");
		}
	}


	public function storeSellerSubcategories($data) {
		$this->db->query("UPDATE ".DB_PREFIX."customer SET seller_category = '".$data."' WHERE customer_id = '".(int) $this->customer->getID()."'");
	}

	public function getStoreSellerSubcategoriesPath($category_id) {		
		$sql = "SELECT path_id FROM " . DB_PREFIX . "category_path WHERE category_id = '".$category_id."'";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getSubCategoryPath($sub_category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_path WHERE `category_id` = '" . (int)$sub_category_id . "'");

		if ($query->num_rows) {
			return array('path' => $query->row['path_id'], 'category' => $query->row['category_id']);
		} else {
			return 0;
		}
	}
	public function getCategoryName($category_id) {
		//$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "category_description WHERE `category_id` = '" . (int)$category_id . "'");
		$query = $this->db->query("SELECT cp.category_id AS category_id, cp.path_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cp.category_id = '" . (int)$category_id . "'");

		if ($query->num_rows) {
			return $query->row['name'];
		} else {
			return 0;
		}
	}
	public function getDeleteSellerCategories($customer_id) {
		$this->db->query("DELETE FROM ".DB_PREFIX."category_to_seller WHERE seller_id = '" . (int)$customer_id . "'");
		//$this->cache->delete('advertise');
	}
}