<?php
class ControllerCommonSellerLeftMenu extends Controller {
	public function index() {		

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		if (isset($this->request->get['seller_id'])) {
			$seller_id = '';
		
			$seller_id = (int)$this->request->get['seller_id'];			
		}

		$categories = $this->model_catalog_category->getSellerCategories(0, $seller_id);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						//'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						'href'  => $this->url->link('seller/seller/info&seller_id='.$seller_id, 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'category_id' => $category['category_id'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					//'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
					'href'     => $this->url->link('seller/seller/info&seller_id='.$seller_id, 'path=' . $category['category_id'])
				);
			}
		}
		//echo "<pre>"; print_r($data);
		$data['text_all'] = $this->language->get('text_all');

		return $this->load->view('common/seller_left_menu', $data);
	}
}
