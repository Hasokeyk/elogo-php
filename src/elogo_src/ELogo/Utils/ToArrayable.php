<?php


namespace ELogo\Utils;


class ToArrayable
{
    /**
     * Nesneleri diziye dönüştüren fonksiyon.
     *
     * @return array
     */
    public function toArray(){
        $allParams = get_object_vars($this);
        foreach ($allParams as $key => $param){
            if(is_object($param))
                $allParams[$key] = $param->toArray();

            if (empty($param))
                unset($allParams[$key]);
        }

        return $allParams;
    }
}