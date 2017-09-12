<?php
class ControllerCommonLeftMenu extends Controller {
	public function index() {		

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

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

					/*$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						//'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						'href'  => $this->url->link('seller/seller', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);*/
					$children_lv3 = $this->model_catalog_category->getCategories($child['category_id']);

					if($children_lv3)
					{    

						foreach ($children_lv3 as $child_lv3) 
						{
							$filter_data_lv3 = array(
							'filter_category_id'  => $child_lv3['category_id'],
							'filter_sub_category' => true
							);

							$children_lv3_data[] = array(
							'category_id' => $child_lv3['category_id'],
							'children_lv3_main_cat' => $category['category_id'],
							'name'  => $child_lv3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_lv3) . ')' : ''),
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_lv3['category_id'])
							);
						}

						$children_data[] = array(
						'children_lv3' => $children_lv3_data,						
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						);

					}

					else
					{

						$children_data[] = array(
					'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						);
					}
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'category_id' => $category['category_id'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					//'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
					'href'     => $this->url->link('seller/seller', 'path=' . $category['category_id'])
				);
			}
		}
		//echo "<pre>"; print_r($data);
		$data['text_all'] = $this->language->get('text_all');

		return $this->load->view('common/left_menu', $data);
	}
}
