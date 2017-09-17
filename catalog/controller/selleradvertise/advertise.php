<?php

class ControllerselleradvertiseAdvertise extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->model('selleradvertise/advertise');

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

            $this->response->redirect($this->url->link('common/home', '', 'SSL'));
        }

        if ($this->customer->isSeller()) {
            $this->load->language('selleradvertise/advertise');

            $this->document->setTitle($this->language->get('heading_title'));

            $this->load->model('selleradvertise/advertise');

            $this->getList();
        } else {
            $this->response->redirect($this->url->link('sellerprofile/sellerprofile&tab_section=store_detail#content', '', 'SSL'));
        }
    }
    public function add()
    {
        if (!$this->customer->isSeller()) {
            $this->index();
        }

        if (!$this->AdvertiseLimit()) {
            $this->response->redirect($this->url->link('selleradvertise/advertise', '', 'SSL'));
        }

        $this->load->language('selleradvertise/advertise');

        $this->document->setTitle("New ".$this->language->get('heading_title'));


        $this->load->model('selleradvertise/advertise');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {			
			if($this->request->post['image_crop'] != '') {

				if (!file_exists('image/catalog/seller_images/'.$this->customer->getID().'/Advertise/')) {
					mkdir('image/catalog/seller_images/'.$this->customer->getID().'/Advertise/', 0777, true);
				}

				$angle = '0';
				$image_crop = $this->request->post['image_crop'];
				$filename = 'image/catalog/seller_images/'.$this->customer->getID().'/Advertise/'.time().'_advertise.jpg';
				$newwidth = 993;
				$newheight = 182;
				$string = $image_crop;
				$imageData = base64_decode($string);
				$source = imagecreatefromstring($imageData);

				$dst = imagecreatetruecolor($newwidth, $newheight);
				$resize_image = imagecopyresampled($dst, $source, 0, 0, 0, 0, $newwidth, $newheight, imageSX($source), imageSY($source));
				$imageSave = imagejpeg($dst,$filename,95);
                 
				$this->request->post['image_crop'] = str_replace('image/', '', $filename);
			}
			//echo "<pre>";print_r($this->request->post['offer_image']);die;
            $advertise_id = $this->model_selleradvertise_advertise->addAdvertise($this->request->post);

            if($advertise_id != ''){
				$this->session->data['success'] = $this->language->get('text_success');
			}

			$url = '';

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('advertise_add', $activity_data);

            $this->response->redirect($this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=draft#content', ''.$url, 'SSL'));
        }
        $this->getForm();
    }

    public function edit()
    {
		$this->load->language('selleradvertise/advertise');

        $this->document->setTitle("Edit ".$this->language->get('heading_title'));

        $this->load->model('selleradvertise/advertise');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			if($this->request->post['image_crop'] != 1) {
				if (!file_exists('image/catalog/seller_images/'.$this->customer->getID().'/Advertise/')) {
					mkdir('image/catalog/seller_images/'.$this->customer->getID().'/Advertise/', 0777, true);
				}
				$angle = '0';

				$image_crop = $this->request->post['image_crop'];
				$filename = 'image/catalog/seller_images/'.$this->customer->getID().'/Advertise/'.time().'_advertise.jpg';
				$newwidth = 993;
				$newheight = 182;
				$string = $image_crop;
				$imageData = base64_decode($string);
				$source = imagecreatefromstring($imageData);

				$dst = imagecreatetruecolor($newwidth, $newheight);
				$resize_image = imagecopyresampled($dst, $source, 0, 0, 0, 0, $newwidth, $newheight, imageSX($source), imageSY($source));
				$imageSave = imagejpeg($dst,$filename,95);
                 
				$this->request->post['image_crop'] = str_replace('image/', '', $filename);
			}			

            $advertise_id = $this->model_selleradvertise_advertise->editadvertise($this->request->get['advertise_id'], $this->request->post);

            if($advertise_id != ''){
				$this->session->data['success'] = $this->language->get('text_success');
			}

            $url = '';

            if (isset($this->request->get['sort_order'])) {
                $url .= '&sort_order='.$this->request->get['sort_order'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('advertise_edit', $activity_data);

            $this->response->redirect($this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=draft#content', ''.$url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete()
    {
        $this->load->language('selleradvertise/advertise');

        if (!$this->customer->isSeller()) {
            $this->index();
        }

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('selleradvertise/advertise');

        if (isset($this->request->post['selected'])) {
            foreach ($this->request->post['selected'] as $advertise_id) {
                $this->model_selleradvertise_advertise->deleteAdvertise($advertise_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort_oder'])) {
                $url .= '&sort_oder='.$this->request->get['sort_oder'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('advertise_delete', $activity_data);

            $this->response->redirect($this->url->link('selleradvertise/advertise', ''.$url, 'SSL'));
        }

        $this->getList();
    }

    public function copy()
    {
        $this->load->language('sellerproduct/product');

        if (!$this->customer->isSeller()) {
            $this->index();
        }

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sellerproduct/product');

        if (isset($this->request->post['selected']) && $this->copyProductLimit($this->request->post['selected'], $this->request->get['product_total'])) {
            foreach ($this->request->post['selected'] as $product_id) {
                $this->model_sellerproduct_product->copyProduct($product_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model='.urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_price'])) {
                $url .= '&filter_price='.$this->request->get['filter_price'];
            }

            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity='.$this->request->get['filter_quantity'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('product_copy', $activity_data);

            $this->response->redirect($this->url->link('sellerproduct/product', ''.$url, 'SSL'));
        }

        $this->getList();
    }

    public function copyByIsbn()
    {
        $this->load->language('sellerproduct/product');

        if (!$this->customer->isSeller()) {
            $this->index();
        }
        $json = array();
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sellerproduct/product');

        if (isset($this->request->get['product_id'])) {
            $this->model_sellerproduct_product->copyProductByIsbn($this->request->get['product_id']);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model='.urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_price'])) {
                $url .= '&filter_price='.$this->request->get['filter_price'];
            }

            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity='.$this->request->get['filter_quantity'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('product_copy', $activity_data);
        }
        $json['success'] = sprintf($this->language->get('text_success'), '');
        $json['redirect'] = str_replace('&amp;', '&', $this->url->link('sellerproduct/product', 'filter_name='.$this->request->get['filter_name']));
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    protected function getList()
    {
        $this->load->model('selleradvertise/advertise');

        $data['seller_advertise_total'] = $this->model_selleradvertise_advertise->getTotalAdvertises();
        $data['advertise_limit'] = 500;



        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';
       

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }
        
        $filter_data = array(
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin'),
        );

        $this->load->model('tool/image');

        $results = $this->model_selleradvertise_advertise->getAdvertises($filter_data);

		$data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('sellerprofile/sellerprofile', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('selleradvertise/advertise', ''.$url, 'SSL'),
        );

        $data['insert'] = $this->url->link('selleradvertise/advertise/add', ''.$url, 'SSL');
        $data['delete'] = $this->url->link('selleradvertise/advertise/delete', ''.$url, 'SSL');

        $data['advertises'] = array();

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $data['advertises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'offer_image' => $image,
                'offer_title' => $result['offer_title'],
                'offer_desc' => $result['offer_desc'],
                'sort_order' => $result['sort_order'],
				'status' => $result['status'],
                'edit' => $this->url->link('selleradvertise/advertise/edit', ''.'&advertise_id='.$result['advertise_id'].$url, 'SSL'),
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['button_request_approval'] = $this->language->get('button_request_approval');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['text_pending'] = $this->language->get('text_pending');

        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_copy'] = $this->language->get('button_copy');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $this->load->model('selleradvertise/advertise');

        $advertise_limit = 500;
        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertises();

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }
        

        $pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('selleradvertise/advertise', ''.$url.'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($advertise_total - $this->config->get('config_limit_admin'))) ? $advertise_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $advertise_total, ceil($advertise_total / $this->config->get('config_limit_admin')));
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');


        $this->response->setOutput($this->load->view('selleradvertise/advertise_list', $data));

    }

    protected function getForm()
    {
        $advertise_id = 0;
        $this->load->model('selleradvertise/advertise');

        if (isset($this->request->get['advertise_id'])) {
            $advertise_id = $this->request->get['advertise_id'];
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['text_form'] = !isset($this->request->get['product_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_plus'] = $this->language->get('text_plus');
        $data['text_minus'] = $this->language->get('text_minus');
        $data['text_default'] = $this->language->get('text_default');            
        $data['text_select'] = $this->language->get('text_select');
        
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_why'] = $this->language->get('entry_meta_why');
        $data['entry_product_tag'] = $this->language->get('entry_product_tag');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['offer_title'] = $this->language->get('offer_title');
		$data['image_empty_error'] = $this->language->get('image_empty_error');
		$data['error_agree'] = $this->language->get('error_agree');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['error_position'] = $this->language->get('error_position');
        

        $data['button_save'] = $this->language->get('button_save');
		$data['button_submit'] = $this->language->get('button_submit');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add'] = $this->language->get('button_add');
        

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        

        if (isset($this->error['offer_title'])) {
            $data['error_offer_title'] = $this->error['offer_title'];
        } else {
            $data['error_offer_title'] = '';
        }
		
		if (isset($this->error['image_empty_error'])) {
            $data['image_empty_error'] = $this->error['image_empty_error'];
        } else {
            $data['image_empty_error'] = '';
        }

		if (isset($this->error['error_agree'])) {
            $data['error_agree'] = $this->error['error_agree'];
        } else {
            $data['error_agree'] = '';
        }

		if (isset($this->request->get['act'])) {
			$data['submitted'] = $this->request->get['act'];
		} else {
			$data['submitted'] = '';
		}

        $url = '';

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

            $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('selleradvertise/advertise', ''.$url, 'SSL'),
        );
			
        if (!isset($this->request->get['advertise_id'])) {
            $data['action'] = $this->url->link('selleradvertise/advertise/add', ''.$url, 'SSL');
        } else {
            $data['action'] = $this->url->link('selleradvertise/advertise/edit', ''.'&advertise_id='.$this->request->get['advertise_id'].$url, 'SSL');
        }

        $data['cancel'] = $this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=draft#content', ''.$url, 'SSL');

        if (isset($this->request->get['advertise_id'])) {
            $advertise_info = $this->model_selleradvertise_advertise->getAdvertise($this->request->get['advertise_id']);
        }
        
        if (!empty($advertise_info)) {
            $data['offer_image'] = $advertise_info['offer_image'];
        } elseif (isset($this->request->post['offer_image'])) {                
			$data['offer_image'] = $this->request->post['offer_image'];
        } else {
            $data['offer_image'] = '';
        }

		if (isset($this->request->post['offer_image_original'])) {
            $data['offer_image_original'] = $this->request->post['offer_image_original'];
        } elseif (!empty($advertise_info)) {
            $data['offer_image_original'] = $advertise_info['offer_image_original'];
        } else {
            $data['offer_image_original'] = '';
        }

        $this->load->model('tool/image');

		if (isset($this->request->post['offer_image']) && is_file(DIR_IMAGE.$this->request->post['offer_image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['offer_image'], 993, 182);
        } elseif (!empty($advertise_info) && is_file(DIR_IMAGE.$advertise_info['offer_image'])) {
            $data['thumb'] = $this->model_tool_image->resize($advertise_info['offer_image'], 993, 182);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 9993, 182);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        if (isset($this->request->post['offer_title'])) {
            $data['offer_title'] = $this->request->post['offer_title'];
        } elseif (!empty($advertise_info)) {
            $data['offer_title'] = $advertise_info['offer_title'];
        } else {
            $data['offer_title'] = '';
        }

		if (isset($this->request->post['position'])) {
            $data['position'] = $this->request->post['position'];
        } elseif (!empty($advertise_info)) {
            $data['position'] = $advertise_info['position'];
        } else {
            $data['position'] = '';
        }

		if (isset($this->request->post['offer_desc'])) {
            $data['offer_desc'] = $this->request->post['offer_desc'];
        } elseif (!empty($advertise_info)) {
            $data['offer_desc'] = $advertise_info['offer_desc'];
        } else {
            $data['offer_desc'] = '';
        }

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($advertise_info)) {
            $data['sort_order'] = $advertise_info['sort_order'];
        } else {
            $data['sort_order'] = 1;
        }

		if (isset($this->request->post['offer_url'])) {
            $data['offer_url'] = $this->request->post['offer_url'];
        } elseif (!empty($advertise_info)) {
            $data['offer_url'] = $advertise_info['offer_url'];
        } else {
            $data['offer_url'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($advertise_info)) {
            $data['status'] = $advertise_info['status'];
        } else {
            $data['status'] = 0;
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');


        $this->response->setOutput($this->load->view('selleradvertise/advertise_form', $data));
    }

    protected function validateForm()
    {
        if ((utf8_strlen($this->request->post['offer_title']) < 3) || (utf8_strlen($this->request->post['offer_title']) > 255)) {
            $this->error['offer_title'] = $this->language->get('offer_title');
        }

		if ($this->request->post['image_crop'] == '') {
            $this->error['image_empty_error'] = $this->language->get('image_empty_error');
        }

		if ($this->request->post['agree'] != 'agree') {
            $this->error['error_agree'] = $this->language->get('error_agree');
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function AdvertiseLimit()
    {
        $this->load->model('selleradvertise/advertise');

        $advertise_limit = 500;
        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertises();

        if ($advertise_total >= $advertise_limit) {
            $this->error['warning'] = sprintf($this->language->get('text_advertise_limit'), 10);
        }

        return !$this->error;
    }
    

    protected function getInfoGoogleBooks($isbn)
    {
        $page = file_get_contents('https://www.googleapis.com/books/v1/volumes?q=isbn:'.$isbn);
        $data = json_decode($page, true);
        if (isset($data['items'])) {
            $googlebook = array(
                    'title' => $data['items'][0]['volumeInfo']['title'],
                    'authors' => strip_tags(html_entity_decode(@implode(',', $data['items'][0]['volumeInfo']['authors']), ENT_QUOTES, 'UTF-8')),
                    'pagecount' => $data['items'][0]['volumeInfo']['pageCount'],
                    'publisheddate' => $data['items'][0]['volumeInfo']['publishedDate'].'-01-01',
                );

            return $googlebook;
        } else {
            return '';
        }
    }
    

    protected function getInfobookdepository($isbn)
    {
        require_once DIR_SYSTEM.'simple_html_dom.php';

        $html = new simple_html_dom();
        $html = @file_get_html('http://www.bookdepository.com/search?searchTerm='.$isbn);

        if ($html) {
            // Find Book title
            foreach ($html->find('div.itemHeading') as $element) {
                if ($element) {
                   $book_title = $element->children(0)->innertext;
                }
            }

            // Find Book year published
            foreach ($html->find('ul.biblio li span[property="dc:available"]') as $element) {
                if ($element) {
                    $noTags = strip_tags($element->innertext);
                    $published = preg_replace('/\s+/', ' ', $noTags);

                    $book_pub = substr($published, 10).'-01-01';
                }
            }

            if (isset($book_title)) {
                $bookdepository = array(
                    'title' => $book_title,
                    'publisheddate' => $book_pub,
                );

                return $bookdepository;
            } else {
                return '';
            }
        }
    }
    public function request_approval()
    {
        $json = array();

        $this->load->language('sellerproduct/product');

        $this->load->model('sellerproduct/product');

        if (isset($this->request->get['product_id'])) {
            $product_id = $this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        $this->model_sellerproduct_product->RequestApproval($product_id);

        $json['success'] = $this->language->get('text_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function get_single_advertise()
    {
        $json = array();

        $this->load->language('selleradvertise/advertise');

        $this->load->model('selleradvertise/advertise');		

        if (isset($this->request->post['data_id'])) {
            $advertise_id = $this->request->post['data_id'];
        } else {
            $advertise_id = 0;
        }

        $advertise_details = $this->model_selleradvertise_advertise->getAdvertise($advertise_id);

		$json['advertise_id']= $advertise_details['advertise_id'];
		$json['seller_id']  = $advertise_details['seller_id'];
		$json['offer_title'] = $advertise_details['offer_title'];
		$json['offer_image']  = $advertise_details['offer_image'];
		$json['offer_desc']  = $advertise_details['offer_desc'];
		$json['offer_url']  = $advertise_details['offer_url'];
		$json['offer_image_original']  = $advertise_details['offer_image_original'];
		$json['nickname']  = $advertise_details['nickname'];		
        $json['success'] = $this->language->get('text_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }	

	public function advertise_mail_to_store_favourites() {

		$this->load->model('selleradvertise/advertise');
		
		//Get Advertisement
		$advertisement_list = array();
		$advertisement_list = $this->model_selleradvertise_advertise->getAdvertiseListMailNotSend();
		if($advertisement_list){
			foreach($advertisement_list as $key => $advertisement_seller_id) {
				$seller_id = $advertisement_seller_id['seller_id'];

				$advertisement_seller_id_full = $this->model_selleradvertise_advertise->getStoreFavList($seller_id);

				foreach($advertisement_seller_id_full as $advertisement_seller_id_full_list) {
					$seller_ids = implode(",", array_unique($advertisement_seller_id_full_list));
				}

				$customer_list = $this->model_selleradvertise_advertise->getStoreFavSellerWise($seller_ids);
				$cus_email = array();
				$cus_telephone = array();
				foreach($customer_list as $customer_list_det) {
					$cus_email[] = $customer_list_det['email'];
					$cus_telephone[] = $customer_list_det['telephone'];
				}

				$this->load->language('mail/customer');

				$subject = "New AD from your favorite store ".$advertisement_seller_id['store_name'];

				$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

				$message .= $this->url->link('account/login', '', true) . "\n\n";
				$message .= $this->language->get('text_services') . "\n\n";
				$message .= $this->language->get('text_thanks') . "\n";
				$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
				$mail->setSubject($subject);
				
				$template = file_get_contents("advertise_temp.html");

				foreach($advertisement_seller_id as $key => $value) {	
                    $template = str_replace('{{ '.$key.' }}', $value, $template);
				}				

				$mail->setHtml($template);

				foreach ($cus_email as $email) {
					if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
						$mail->setTo($email);
						$mail->send();
					}
				}
			}
		}
		
	}
}