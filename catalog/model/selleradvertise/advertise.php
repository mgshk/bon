<?php

class ModelselleradvertiseAdvertise extends Model
{
    public function addAdvertise($data) 
    {
		
		//$this->db->query('INSERT INTO '.DB_PREFIX."store_offers SET seller_id = '".$this->customer->getID()."', position = '".(int) $data['position']."', offer_title = '".$data['offer_title']."', offer_desc = '".$data['offer_desc']."', offer_image = '".$data['offer_image']."', offer_url = '".$data['offer_url']."', status = 'approved', paid = '0', sort_order = '".(int) $data['sort_order']."', date_added = NOW()");
		if(isset($data['image_crop']) && $data['image_crop'] !='') {
			$this->db->query('INSERT INTO '.DB_PREFIX."store_offers SET seller_id = '".$this->customer->getID()."', offer_title = '".$data['offer_title']."', offer_desc = '".$data['offer_desc']."', offer_image = '".$data['image_crop']."', offer_image_original = '".$data['offer_image']."', offer_url = '".$data['offer_url']."', status = '".$data['status']."', paid = '0', sort_order = '".(int) $data['sort_order']."', date_added = NOW()");
		} else {
			$this->db->query('INSERT INTO '.DB_PREFIX."store_offers SET seller_id = '".$this->customer->getID()."', offer_title = '".$data['offer_title']."', offer_desc = '".$data['offer_desc']."', offer_image = '".$data['offer_image']."', offer_image_original = '".$data['offer_image_original']."', offer_url = '".$data['offer_url']."', status = '".$data['status']."', paid = '0', sort_order = '".(int) $data['sort_order']."', date_added = NOW()");
		}

        $advertise_id = $this->db->getLastId();
        
        //$this->cache->delete('product');


        return $advertise_id;
    }

	public function editadvertise($advertise_id, $data)
    {
		
		if(isset($data['image_crop']) && $data['image_crop'] != '1') {//echo "no"; die;
			$this->db->query('UPDATE '.DB_PREFIX."store_offers SET seller_id = '".$this->customer->getID()."', offer_title = '".$data['offer_title']."', offer_desc = '".$data['offer_desc']."', offer_image = '".$data['image_crop']."', offer_image_original = '".$data['offer_image']."', offer_url = '".$data['offer_url']."', status = '".$data['status']."', paid = '0', sort_order = '".(int) $data['sort_order']."', date_modified = NOW() WHERE advertise_id = '".(int) $advertise_id."'");
		} else {//echo "Yes"; die;
			$this->db->query('UPDATE '.DB_PREFIX."store_offers SET seller_id = '".$this->customer->getID()."', offer_title = '".$data['offer_title']."', offer_desc = '".$data['offer_desc']."', offer_url = '".$data['offer_url']."', status = '".$data['status']."', paid = '0', sort_order = '".(int) $data['sort_order']."', date_modified = NOW() WHERE advertise_id = '".(int) $advertise_id."'");
		}
        return $advertise_id;
    }

	public function deleteAdvertise($advertise_id)
    {


        $this->db->query('UPDATE '.DB_PREFIX."store_offers SET status = 'deleted', date_modified = NOW() WHERE advertise_id = '".(int) $advertise_id."'");

		//$this->db->query('DELETE FROM '.DB_PREFIX."store_offers WHERE advertise_id = '".(int) $advertise_id."'");        

        //$this->cache->delete('product');


    }

	public function deleteAdvertisePermanent($advertise_id)
    {


        //$this->db->query('UPDATE '.DB_PREFIX."store_offers SET status = 'deleted', date_modified = NOW() WHERE advertise_id = '".(int) $advertise_id."'");

		$this->db->query('DELETE FROM '.DB_PREFIX."store_offers WHERE advertise_id = '".(int) $advertise_id."'");        

        $this->cache->delete('advertise');


    }

    /*public function editProduct($product_id, $data)
    {
      if($this->customer->getSellerGroupProductStatus()){
        $product_status = $data['status'];
      }elseif($this->customer->getSellerProductStatus()){
        $product_status = $data['status'];
      }else{
        $product_status = '0';
      }



        $this->db->query('UPDATE '.DB_PREFIX."product SET model = '".$this->db->escape($data['model'])."', sku = '".$this->db->escape($data['sku'])."', upc = '".$this->db->escape($data['upc'])."', ean = '".$this->db->escape($data['ean'])."', jan = '".$this->db->escape($data['jan'])."', isbn = '".$this->db->escape($data['isbn'])."', mpn = '".$this->db->escape($data['mpn'])."', location = '".$this->db->escape($data['location'])."', quantity = '".(int) $data['quantity']."', minimum = '".(int) $data['minimum']."', subtract = '".(int) $data['subtract']."', stock_status_id = '".(int) $data['stock_status_id']."', date_available = '".$this->db->escape($data['date_available'])."', manufacturer_id = '".(int) $data['manufacturer_id']."', shipping = '".(int) $data['shipping']."', price = '".(float) $data['price']."', points = '".(int) $data['points']."', weight = '".(float) $data['weight']."', weight_class_id = '".(int) $data['weight_class_id']."', length = '".(float) $data['length']."', width = '".(float) $data['width']."', height = '".(float) $data['height']."', length_class_id = '".(int) $data['length_class_id']."', status = '".(int) $product_status."', tax_class_id = '".$this->db->escape($data['tax_class_id'])."', sort_order = '".(int) $data['sort_order']."', date_modified = NOW() WHERE product_id = '".(int) $product_id."'");

        if (isset($data['image'])) {
            $this->db->query('UPDATE '.DB_PREFIX."product SET image = '".$this->db->escape($data['image'])."' WHERE product_id = '".(int) $product_id."'");
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_description WHERE product_id = '".(int) $product_id."'");

        foreach ($data['product_description'] as $language_id => $value) {
            $this->db->query('INSERT INTO '.DB_PREFIX."product_description SET product_id = '".(int) $product_id."', language_id = '".(int) $language_id."', name = '".$this->db->escape($value['name'])."', description = '".$this->db->escape($value['description'])."', tag = '".$this->db->escape($value['tag'])."', meta_title = '".$this->db->escape($value['meta_title'])."', meta_description = '".$this->db->escape($value['meta_description'])."', meta_keyword = '".$this->db->escape($value['meta_keyword'])."'");
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_store WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_store'])) {
            foreach ($data['product_store'] as $store_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_to_store SET product_id = '".(int) $product_id."', store_id = '".(int) $store_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_attribute WHERE product_id = '".(int) $product_id."'");

        if (!empty($data['product_attribute'])) {
            foreach ($data['product_attribute'] as $product_attribute) {
                if ($product_attribute['attribute_id']) {
                    $this->db->query('DELETE FROM '.DB_PREFIX."product_attribute WHERE product_id = '".(int) $product_id."' AND attribute_id = '".(int) $product_attribute['attribute_id']."'");

                    foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
                        $this->db->query('INSERT INTO '.DB_PREFIX."product_attribute SET product_id = '".(int) $product_id."', attribute_id = '".(int) $product_attribute['attribute_id']."', language_id = '".(int) $language_id."', text = '".$this->db->escape($product_attribute_description['text'])."'");
                    }
                }
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_option WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_option_value WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_option'])) {
            foreach ($data['product_option'] as $product_option) {
                if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
                    if (isset($product_option['product_option_value'])) {
                        $this->db->query('INSERT INTO '.DB_PREFIX."product_option SET product_option_id = '".(int) $product_option['product_option_id']."', product_id = '".(int) $product_id."', option_id = '".(int) $product_option['option_id']."', required = '".(int) $product_option['required']."'");

                        $product_option_id = $this->db->getLastId();

                        foreach ($product_option['product_option_value'] as $product_option_value) {
                            $this->db->query('INSERT INTO '.DB_PREFIX."product_option_value SET product_option_value_id = '".(int) $product_option_value['product_option_value_id']."', product_option_id = '".(int) $product_option_id."', product_id = '".(int) $product_id."', option_id = '".(int) $product_option['option_id']."', option_value_id = '".(int) $product_option_value['option_value_id']."', quantity = '".(int) $product_option_value['quantity']."', subtract = '".(int) $product_option_value['subtract']."', price = '".(float) $product_option_value['price']."', price_prefix = '".$this->db->escape($product_option_value['price_prefix'])."', points = '".(int) $product_option_value['points']."', points_prefix = '".$this->db->escape($product_option_value['points_prefix'])."', weight = '".(float) $product_option_value['weight']."', weight_prefix = '".$this->db->escape($product_option_value['weight_prefix'])."'");
                        }
                    }
                } else {
                    $this->db->query('INSERT INTO '.DB_PREFIX."product_option SET product_option_id = '".(int) $product_option['product_option_id']."', product_id = '".(int) $product_id."', option_id = '".(int) $product_option['option_id']."', value = '".$this->db->escape($product_option['value'])."', required = '".(int) $product_option['required']."'");
                }
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_discount WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_discount'])) {
            foreach ($data['product_discount'] as $product_discount) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_discount SET product_id = '".(int) $product_id."', customer_group_id = '".(int) $product_discount['customer_group_id']."', quantity = '".(int) $product_discount['quantity']."', priority = '".(int) $product_discount['priority']."', price = '".(float) $product_discount['price']."', date_start = '".$this->db->escape($product_discount['date_start'])."', date_end = '".$this->db->escape($product_discount['date_end'])."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_special WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_special'])) {
            foreach ($data['product_special'] as $product_special) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_special SET product_id = '".(int) $product_id."', customer_group_id = '".(int) $product_special['customer_group_id']."', priority = '".(int) $product_special['priority']."', price = '".(float) $product_special['price']."', date_start = '".$this->db->escape($product_special['date_start'])."', date_end = '".$this->db->escape($product_special['date_end'])."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_image WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_image'])) {
            foreach ($data['product_image'] as $product_image) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_image SET product_id = '".(int) $product_id."', image = '".$this->db->escape($product_image['image'])."', sort_order = '".(int) $product_image['sort_order']."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_download WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_download'])) {
            foreach ($data['product_download'] as $download_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_to_download SET product_id = '".(int) $product_id."', download_id = '".(int) $download_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_category WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_category'])) {
            foreach ($data['product_category'] as $category_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_to_category SET product_id = '".(int) $product_id."', category_id = '".(int) $category_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_filter WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_filter'])) {
            foreach ($data['product_filter'] as $filter_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_filter SET product_id = '".(int) $product_id."', filter_id = '".(int) $filter_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_related WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_related WHERE related_id = '".(int) $product_id."'");

        if (isset($data['product_related'])) {
            foreach ($data['product_related'] as $related_id) {
                $this->db->query('DELETE FROM '.DB_PREFIX."product_related WHERE product_id = '".(int) $product_id."' AND related_id = '".(int) $related_id."'");
                $this->db->query('INSERT INTO '.DB_PREFIX."product_related SET product_id = '".(int) $product_id."', related_id = '".(int) $related_id."'");
                $this->db->query('DELETE FROM '.DB_PREFIX."product_related WHERE product_id = '".(int) $related_id."' AND related_id = '".(int) $product_id."'");
                $this->db->query('INSERT INTO '.DB_PREFIX."product_related SET product_id = '".(int) $related_id."', related_id = '".(int) $product_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_reward WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_reward'])) {
            foreach ($data['product_reward'] as $customer_group_id => $value) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_reward SET product_id = '".(int) $product_id."', customer_group_id = '".(int) $customer_group_id."', points = '".(int) $value['points']."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_layout WHERE product_id = '".(int) $product_id."'");

        if (isset($data['product_layout'])) {
            foreach ($data['product_layout'] as $store_id => $layout_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."product_to_layout SET product_id = '".(int) $product_id."', store_id = '".(int) $store_id."', layout_id = '".(int) $layout_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."url_alias WHERE query = 'product_id=".(int) $product_id."'");

        if ($data['keyword']) {
            $this->db->query('INSERT INTO '.DB_PREFIX."url_alias SET query = 'product_id=".(int) $product_id."', keyword = '".$this->db->escape($data['keyword'])."'");
        }

        $this->db->query('DELETE FROM `'.DB_PREFIX.'product_recurring` WHERE product_id = '.(int) $product_id);

        if (isset($data['product_recurrings'])) {
            foreach ($data['product_recurrings'] as $recurring) {
                $this->db->query('INSERT INTO `'.DB_PREFIX.'product_recurring` SET `product_id` = '.(int) $product_id.', customer_group_id = '.(int) $recurring['customer_group_id'].', `recurring_id` = '.(int) $recurring['recurring_id']);
            }
        }

        $this->cache->delete('product');


    }

    
    public function deleteProduct($product_id)
    {


        $this->db->query('DELETE FROM '.DB_PREFIX."product WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_attribute WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_description WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_discount WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_filter WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_image WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_option WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_option_value WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_related WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_related WHERE related_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_reward WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_special WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_category WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_download WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_layout WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."product_to_store WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."review WHERE product_id = '".(int) $product_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX.'product_recurring WHERE product_id = '.(int) $product_id);
        $this->db->query('DELETE FROM '.DB_PREFIX."url_alias WHERE query = 'product_id=".(int) $product_id."'");

        $this->cache->delete('product');


    }
    

    public function getProducts($data = array())
    {
        $sql = 'SELECT *
		FROM '.DB_PREFIX.'product p
		LEFT JOIN '.DB_PREFIX.'product_description pd ON (p.product_id = pd.product_id)
		LEFT JOIN '.DB_PREFIX."product_to_seller pts ON (p.product_id = pts.product_id)
		WHERE pd.language_id = '".(int) $this->config->get('config_language_id')."'
		AND pts.seller_id = '".(int) $this->customer->getID()."'
		";

        if (!empty($data['filter_name'])) {
            $sql .= " AND pd.name LIKE '%".$this->db->escape($data['filter_name'])."%'";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '%".$this->db->escape($data['filter_model'])."%'";
        }

        if (!empty($data['filter_price'])) {
            $sql .= " AND p.price LIKE '%".$this->db->escape($data['filter_price'])."%'";
        }

        if (isset($data['filter_quantity']) && $data['filter_quantity'] !== null) {
            $sql .= " AND p.quantity = '".(int) $data['filter_quantity']."'";
        }

        if (isset($data['filter_status']) && $data['filter_status'] !== null) {
            $sql .= " AND p.status = '".(int) $data['filter_status']."'";
        }

        $sql .= ' GROUP BY p.product_id';

        $sort_data = array(
            'pd.name',
            'p.model',
            'p.price',
            'p.quantity',
            'p.status',
            'p.sort_order',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= ' ORDER BY '.$data['sort'];
        } else {
            $sql .= ' ORDER BY pd.name';
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= ' DESC';
        } else {
            $sql .= ' ASC';
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= ' LIMIT '.(int) $data['start'].','.(int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getProductsByProductId($product_id)
    {
        $sql = 'SELECT *,p.shipping,p.product_id,pd.name,pts.seller_id,CONCAT(c.firstname, " ", c.lastname) AS seller_name
		FROM '.DB_PREFIX.'product p
		LEFT JOIN '.DB_PREFIX.'product_description pd ON (p.product_id = pd.product_id)
		LEFT JOIN '.DB_PREFIX.'product_to_seller pts ON (p.product_id = pts.product_id)
    LEFT JOIN '.DB_PREFIX."customer c ON (pts.seller_id = c.customer_id)
		WHERE pd.language_id = '".(int) $this->config->get('config_language_id')."'
		AND p.product_id = '".(int) $product_id."'
		";



        $sql .= ' GROUP BY pts.seller_id';




        $query = $this->db->query($sql);

        return $query->rows;
    }*/

	public function getAdvertises($data = array())
    {
        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status != 'deleted' ORDER BY advertise_id";

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= ' DESC';
        } else {
            $sql .= ' ASC';
        }
			//$sql .= ' ';

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= ' LIMIT '.(int) $data['start'].','.(int) $data['limit'];
        }		

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getAdvertise($advertise_id)
    {
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."store_offers st_of LEFT JOIN ".DB_PREFIX."customer c ON (c.customer_id = st_of.seller_id) WHERE advertise_id = ".(int) $advertise_id);

        return $query->row;
    }

    public function getTotalAdvertises($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    ////////////////////////////	

	
	public function getAdvertisesDraft($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'draft' AND status != 'deleted' ORDER BY advertise_id";

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }

	public function getTotalAdvertisesDraft($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'draft' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
	public function getAdvertisesSubmitted($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'submitted' AND status != 'deleted' ORDER BY advertise_id";

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }
	public function getTotalAdvertisesSubmitted($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'submitted' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
	public function getAdvertisesApproved($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'approved' AND status != 'deleted' ORDER BY advertise_id";

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }
	public function getTotalAdvertisesApproved($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'approved' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
	public function getAdvertisesRejected($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'rejected' AND status != 'deleted' ORDER BY advertise_id";

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }
	public function getTotalAdvertisesRejected($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'rejected' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
	public function getAdvertisesPaid($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT advertise_id FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'live' AND status != 'deleted' AND CURDATE() < from_date ORDER BY advertise_id";
		$query = $this->db->query($sql);
        $arry1 =  $query->rows;

		$sql1 = "SELECT advertise_id FROM ".DB_PREFIX."store_offers so LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (so.advertise_id = htbd.store_offer_advertise_id) WHERE so.position = '1' and CURDATE() < htbd.date GROUP BY so.advertise_id ASC";
		$query1 = $this->db->query($sql1);
        $arry2 =  $query1->rows;

		$result = array_merge($arry1, $arry2);

		$rows = '';

		if(!empty($result)) {

			foreach($result as $res) {
				$val[] = $res['advertise_id'];
			}

			$result_fn = implode(",",$val);		

			$sql2 = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'live' AND status != 'deleted' AND advertise_id in ($result_fn) ORDER BY advertise_id";

			$sql2 .= ' LIMIT '.(int) $start.','.(int) $limit;

			//echo "<pre>"; print_r($sql);die;
			$query2 = $this->db->query($sql2);
			$rows = $query2->rows;
		}

        return $rows;
    }
	public function getTotalAdvertisesPaid($data = array())
    {
        $sql = "SELECT advertise_id FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'live' AND status != 'deleted' AND CURDATE() < from_date ORDER BY advertise_id";
		$query = $this->db->query($sql);
        $arry1 =  $query->rows;

		$sql1 = "SELECT advertise_id FROM ".DB_PREFIX."store_offers so LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (so.advertise_id = htbd.store_offer_advertise_id) WHERE so.position = '1' and CURDATE() < htbd.date GROUP BY so.advertise_id ASC";
		$query1 = $this->db->query($sql1);
        $arry2 =  $query1->rows;

		$result = array_merge($arry1, $arry2);

		//print_r($result);
		$total = '0';

		if(!empty($result)) {

			foreach($result as $res) {
				$val[] = $res['advertise_id'];
			}

			$result_fn = implode(",",$val);		

			$sql2 = "SELECT COUNT(DISTINCT advertise_id) AS total FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'live' AND status != 'deleted' AND advertise_id in ($result_fn) ORDER BY advertise_id";

			$query2 = $this->db->query($sql2);
			$total = $query2->row['total'];
		}

		return $total;
		
    }

	public function getAdvertisesLive($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT advertise_id, seller_id, offer_title, offer_image, offer_desc, offer_url, position, price, sort_order, status, end_date, km, offer_image_original FROM ".DB_PREFIX."store_offers so WHERE so.seller_id = '".(int) $this->customer->getID()."' AND CURDATE() >= so.from_date AND CURDATE() <= so.end_date AND so.status = 'live' AND so.status != 'deleted' UNION SELECT advertise_id, seller_id, offer_title, offer_image, offer_desc, offer_url, position, price, sort_order, status , end_date, km, offer_image_original FROM ".DB_PREFIX."store_offers soi LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (soi.advertise_id = htbd.store_offer_advertise_id) WHERE soi.seller_id = '".(int) $this->customer->getID()."' AND soi.status = 'live' AND soi.status != 'deleted' AND soi.position = '1' AND CURDATE() = htbd.date ORDER BY advertise_id";

		//print_r($sql);

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }
	public function getTotalAdvertisesLive($data = array())
    {
		$sql = "SELECT COUNT(DISTINCT advertise_id) AS total FROM ".DB_PREFIX."store_offers so WHERE so.seller_id = '".(int) $this->customer->getID()."' AND CURDATE() >= so.from_date AND CURDATE() <= so.end_date AND so.status = 'live' AND so.status != 'deleted' UNION SELECT COUNT(DISTINCT advertise_id) AS total FROM ".DB_PREFIX."store_offers soi LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (soi.advertise_id = htbd.store_offer_advertise_id) WHERE soi.seller_id = '".(int) $this->customer->getID()."' AND soi.status = 'live' AND soi.status != 'deleted' AND soi.position = '1' AND CURDATE() = htbd.date";

		//print_r($sql);

        //$sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        //$sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'live' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->rows;
    }
	
	public function getAdvertisesArchive($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'live' AND status != 'deleted' ORDER BY advertise_id";

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }
	public function getTotalAdvertisesArchive($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'live' AND p.status != 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

	public function getAdvertisesTrash($start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = "SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND status = 'deleted' ORDER BY advertise_id";

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }
	public function getTotalAdvertisesTrash($data = array())
    {
        $sql = 'SELECT COUNT(DISTINCT p.advertise_id) AS total FROM '.DB_PREFIX.'store_offers p';

        $sql .= " WHERE p.seller_id = '".(int) $this->customer->getID()."' AND p.status = 'deleted'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

	public function statusAdvertise($advertise_id, $status)
    {
		$qry = "UPDATE ".DB_PREFIX."store_offers SET status = '".$status."', date_modified = NOW() WHERE advertise_id = '".(int) $advertise_id."'";
        $this->db->query($qry);

    }

	public function getPostionAmount($from_date, $end_date, $loc, $ad_order, $km = '')
    {
		$correct_level = array();

		if($km != '' && $loc == '5') {
			$sql = "SELECT lat, lng FROM ".DB_PREFIX."customer WHERE customer_id = '".(int) $this->customer->getID()."'";
			$query = $this->db->query($sql);
			$lat_lan = $query->row;

			$sql = "SELECT nickname, price,(3959 * acos( cos( radians(".$lat_lan['lat'].") ) * cos( radians( lat ) ) *  cos( radians( lng ) - radians(".$lat_lan['lng'].") ) + sin( radians(".$lat_lan['lat'].") ) * sin( radians( lat ) ) ) ) AS distance FROM ".DB_PREFIX."customer c LEFT JOIN ".DB_PREFIX."store_offers str ON(c.customer_id = str.seller_id) WHERE from_date = '".$from_date."' AND position = '".(int) $loc."' HAVING distance BETWEEN 0 AND ".$km." AND price != '0' order by price Desc";

			$query = $this->db->query($sql);
			$distance_level = $query->rows;
			foreach($distance_level as $distance_lev) {
				$correct_level1[] = $distance_lev;               
			}

			$sql1 = "SELECT c.nickname, str.price FROM ".DB_PREFIX."customer c INNER JOIN ".DB_PREFIX."store_offers str ON(c.customer_id = str.seller_id) WHERE str.from_date = '".$from_date."' AND str.position = '".(int) $loc."' AND str.seller_id = ".$this->customer->getID()." AND str.price != '0' order by str.price Desc";

			$query1 = $this->db->query($sql1);
			$correct_level2 = $query1->rows;
			if(!empty($correct_level1)) {
				$correct_level = array_merge($correct_level1, $correct_level2);				
				rsort($correct_level);
			} else {
				$correct_level = $correct_level2;
			}
           
		} else {
			$sql = "SELECT c.nickname, str.price FROM ".DB_PREFIX."customer c 
                INNER JOIN ".DB_PREFIX."store_offers str ON(c.customer_id = str.seller_id)
                WHERE str.from_date = '".$from_date."' AND str.position = '".(int) $loc."' 
                order by str.price Desc";
                
			$query = $this->db->query($sql);
			$correct_level = $query->rows;
		}		

		return $correct_level;
    }

	public function getdateCheckForFirstPosition()
	{		 
		$sql = "SELECT htbd.date FROM ".DB_PREFIX."store_offers so LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (so.advertise_id = htbd.store_offer_advertise_id) WHERE so.position = '1' and CURDATE() <= htbd.date";
        $query = $this->db->query($sql);
		$correct_level = $query->rows;
		return $correct_level; 
		
	}

	public function adToLive($data, $delete_free='')
	{
		if($data['loc'] == 2){
			$data['state'] = '';
			$data['city'] = '';
		}if($data['loc'] == 3){
			$data['national'] = '';
			$data['city'] = '';
		}if($data['loc'] == 4){
			$data['national'] = '';
			$data['state'] = '';
		}if($data['loc'] == 5){
			$data['national'] = '';
			$data['state'] = '';
			$data['city'] = '';
		}

		if(isset($data['amount']) && $data['amount'] != ''){
				$sql1 = "SELECT * FROM ".DB_PREFIX."store_offers WHERE position = '".(int) $data['loc']."' And status = 'live' And seller_id = '".$this->customer->getID()."' AND advertise_id != '".(int) $data['advetise_sp']."' AND price = '0' order by price Desc";
				$query = $this->db->query($sql1);
				$free_position_arr = $query->rows;
				//print_r($free_position_arr);exit;
				if(count($free_position_arr) > 0 && !empty($free_position_arr)) {
					if($delete_free == 1) {
						foreach($free_position_arr as $free_position) {
							$this->db->query('UPDATE '.DB_PREFIX."store_offers SET status = 'deleted' WHERE advertise_id = '".(int) $free_position['advertise_id']."'");        

							//$this->cache->delete('advertise');
						}
						$this->db->query('UPDATE '.DB_PREFIX."store_offers SET position = '".(int) $data['loc']."', from_date = '".$data['from_date']."', end_date = '".$data['end_date']."', price = '".$data['amount']."', km = '".$data['km']."' , national = '".$data['national']."' , state = '".$data['state']."' , city = '".$data['city']."' ,date_modified = NOW() WHERE advertise_id = '".(int) $data['advetise_sp']."' AND seller_id = '".$this->customer->getID()."'");
					} else {
						if($delete_free == 0) {
							$this->db->query('UPDATE '.DB_PREFIX."store_offers SET position = '".(int) $data['loc']."', from_date = '".$data['from_date']."', end_date = '".$data['end_date']."', price = '".$data['amount']."', km = '".$data['km']."' , national = '".$data['national']."' , state = '".$data['state']."' , city = '".$data['city']."',date_modified = NOW() WHERE advertise_id = '".(int) $data['advetise_sp']."' AND seller_id = '".$this->customer->getID()."'");
						} else {
							return 1;
						}
					}
				} else {
					$this->db->query('UPDATE '.DB_PREFIX."store_offers SET position = '".(int) $data['loc']."', from_date = '".$data['from_date']."', end_date = '".$data['end_date']."', price = '".$data['amount']."', km = '".$data['km']."' , national = '".$data['national']."' , state = '".$data['state']."' , city = '".$data['city']."', date_modified = NOW() WHERE advertise_id = '".(int) $data['advetise_sp']."' AND seller_id = '".$this->customer->getID()."'");
				}
		} else{ 
			
			if(isset($data['top_banner_date']) && $data['top_banner_date'] != '') {
				$this->db->query('UPDATE '.DB_PREFIX."store_offers SET position = '".(int) $data['loc']."', price = '".$data['price']."',date_modified = NOW() WHERE advertise_id = '".(int) $data['advetise_sp']."' AND seller_id = '".$this->customer->getID()."'");

				$this->db->query('INSERT INTO '.DB_PREFIX."home_top_banner_date SET store_offer_advertise_id = '".(int) $data['advetise_sp']."', date = '".$data['top_banner_date']."'");		       

				$top_banner_advertise_id = $this->db->getLastId();
			} else {				
					$this->db->query('UPDATE '.DB_PREFIX."store_offers SET position = '".(int) $data['loc']."', from_date = '".$data['from_date']."', end_date = '".$data['end_date']."', date_modified = NOW() WHERE advertise_id = '".(int) $data['advetise_sp']."' AND seller_id = '".$this->customer->getID()."'");					
				
			}
		}
	}


	public function copyAdvertisment($advertise_id)
	{
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."store_offers WHERE seller_id = '".(int) $this->customer->getID()."' AND advertise_id = '".(int) $advertise_id."'");

        if ($query->num_rows) {
            $data = array();

            $data = $query->row;

			//print_r($data); die;

            //$this->addAdvertise($data);
			$this->db->query('INSERT INTO '.DB_PREFIX."store_offers SET seller_id = '".$this->customer->getID()."', offer_title = '".$data['offer_title']."', offer_desc = '".$data['offer_desc']."', offer_image = '".$data['offer_image']."', offer_image_original = '".$data['offer_image_original']."', offer_url = '".$data['offer_url']."', status = 'approved', paid = '0', sort_order = '".(int) $data['sort_order']."', date_added = NOW()");
        }
    }

	public function getStoreOfferBasicPrice()
	{
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."store_offer_basic_price");

        //$query = $this->db->query($sql);
		$basic_price = $query->rows;
		foreach($basic_price as $basic_pri) {
			$basic_price1[$basic_pri['tabs']] = $basic_pri['basic_price'];
		}
		return $basic_price1; 
    }

	public function getStoreOfferBasicPriceWithCashBack()
	{
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."store_offer_basic_price");

        //$query = $this->db->query($sql);
		$basic_price = $query->rows;
		foreach($basic_price as $basic_pri) {
			$basic_price1[$basic_pri['tabs']] = $basic_pri['cash_back'];
		}
		return $basic_price1; 
    }

	public function getAdvertiseListMailNotSend()
	{
		//echo "544536"; die;
		$sql = "SELECT advertise_id FROM ".DB_PREFIX."store_offers WHERE mail_sent = 'no' AND status = 'live' AND paid = '1' AND from_date = (CURDATE() + INTERVAL 1 DAY) ORDER BY advertise_id ASC";
		$query = $this->db->query($sql);
        $arry1 =  $query->rows;

		$sql1 = "SELECT advertise_id FROM ".DB_PREFIX."store_offers so LEFT JOIN ".DB_PREFIX."home_top_banner_date htbd ON (so.advertise_id = htbd.store_offer_advertise_id) WHERE so.position = '1' AND so.mail_sent = 'no' AND so.status = 'live' AND so.paid = '1' AND htbd.date  = (CURDATE() + INTERVAL 1 DAY) ORDER BY so.advertise_id ASC";
		$query1 = $this->db->query($sql1);
        $arry2 =  $query1->rows;
//echo $sql; die;
		$result = array_merge($arry1, $arry2);

		$advertise_list = '';

		if(!empty($result)) {

			foreach($result as $res) {
				$val[] = $res['advertise_id'];
			}

			$result_fn = implode(",",$val);		

			$sql2 = "SELECT so.*,oc.nickname as store_name FROM ".DB_PREFIX."store_offers as so LEFT JOIN ".DB_PREFIX."customer as oc ON (oc.customer_id = so.seller_id) WHERE so.status = 'live' AND so.status != 'deleted' AND so.advertise_id in ($result_fn) ORDER BY so.advertise_id";

			//echo "<pre>"; print_r($sql2);die;
			$query2 = $this->db->query($sql2);
			$advertise_list = $query2->rows;
		}

        return $advertise_list;
    }

	public function  getStoreFavSellerWise($seller_ids)
	{
		$query = $this->db->query("SELECT email, telephone FROM ".DB_PREFIX."customer WHERE customer_id in ($seller_ids)");

		$cus_detail = $query->rows;

		return $cus_detail;
	}

	public function  getStoreFavList($seller_id)
	{
		$query = $this->db->query("SELECT customer_id FROM ".DB_PREFIX."customer_store_favourites WHERE store_id = $seller_id AND email = '1'");

		$cus_id = $query->rows;

		return $cus_id;
	}
	
	public function sendsms_payment($phone_num, $code, $sender_id, $status, $sms_type){
	    //Your user
        $user = $this->config->get('sms_user');
        //$user = "abcd1234";
        
        //Password
        $password = $this->config->get('sms_pass');
        //$password = "demo4sms";
        
        //Sender ID,While using route4 sender id should be 6 characters long.
        //$senderid = $this->config->get('sms_sender_ads');
        //$senderid = "vtelin";
        
        //$channel = "TransDCS=0&flashsms=0";

		if($sms_type == 'payment') {        
			//Your message to send, Add URL encoding here.
			$message = urlencode("Your payment was failed.");
			if($status == 'success') {
				$message = urlencode("Your payment was successfull in BoN Online Services (www.buyonear.in). Your tranaction Id is ".$code.".");
			}
		} elseif($sms_type == 'forget_pass') {
			//Your message to send, Add URL encoding here.
			$message = urlencode("Your One Time Password(OTP) to reset your password in BoN Online Services (www.buyonear.in) is ".$code).".";
		}  elseif($sms_type == 'sign_up') {
			//Your message to send, Add URL encoding here.
			$message = urlencode("Your One Time Password(OTP) for signing-up with BoN Online Services (www.buyonear.in) is ".$code).".";
		}
        
        
        //Define route 
        //$route = "default";
        
        //API URL
        //$url="http://bulksms.vtel.in/api/mt/SendSMS?user=".$user."&password=".$password."&senderid=".$senderid."&channel=Trans&DCS=0&flashsms=0&number=".$phone_num."&text=".$message."&route=28";
        $url="http://bhashsms.com/api/sendmsg.php?user=".$user."&pass=".$password."&sender=".$sender_id."&phone=".$phone_num."&text=".$message."&priority=ndnd&stype=normal";
        //print_r($url); die;
        // init the resource
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            //CURLOPT_POST => false,
            //CURLOPT_POSTFIELDS => $postData
            //,CURLOPT_FOLLOWLOCATION => true
        ));
        
        curl_setopt($ch, CURLOPT_HTTPGET, 1);
        
        //Ignore SSL certificate verification
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        
        
        //get response
        $output = curl_exec($ch);
        
        //Print error if any
        if(curl_errno($ch))
        {
            echo 'error:' . curl_error($ch);
        }
        
        curl_close($ch);
        
        //echo $output;
	    
	}

	public function sendemail_payment($tansaction_id, $status, $email)
	{

		$this->load->language('mail/customer');

		//$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$subject = "Payment your advertisment";

		$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		//$message .= $this->url->link('account/login', '', true) . "\n\n";
		//$message .= $this->language->get('text_services') . "\n\n";
		//$message .= $this->language->get('text_thanks') . "\n";
		//$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
		if($status == 'failed') {
			$message .= "Your payment was failed";
		} elseif($status == 'success') {
			$message .= "Your payment was successfull. Your tranaction Id is - ".$tansaction_id;
		}

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		
		//$template = file_get_contents("advertise_temp.html");
		//print_r($template);
		//foreach($advertisement_seller_id as $key => $value)
		//{	//print_r($key);				
			//$value = substr($value, 0, '/');
			//$value = substr($value, 0, strpos($value, "/"));
			
			//$template = str_replace('{{ '.$key.' }}', $value, $template);
		//}				
		//print_r($template);exit;
		//$mail->setHtml($template);
		$mail->send();
	}

}
