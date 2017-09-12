<?php

class Modelsellerstoresellerstore extends Model
{

    public function sellerstore_list($seller_id)
    {
       $query = $this->db->query('SELECT * FROM '.DB_PREFIX."customer_store WHERE customer_id = '".$seller_id."'");

        return $query->rows;
    }
}
