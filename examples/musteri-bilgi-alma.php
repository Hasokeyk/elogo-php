<?php
    
    use elogo_api\elogo_api;
    
    require "vendor/autoload.php";
    
    $elogo_username = '';
    $elogo_password = '';
    $elogo_test     = true;
    
    $elogo                = new elogo_api($elogo_username, $elogo_password, $elogo_test);
    $elogo->invoce_prefix = 'HSN'; //FATURA NUMARASI OLUŞTURMASI İÇİN EN FAZLA 3 KARAKTER
    
    //VERGİ NO İLE MÜŞTERİ BİLGİSİ ALMA
    $result = $elogo->get_company_info('XXXXXXXXXX');
    print_r($result);
    //VERGİ NO İLE MÜŞTERİ BİLGİSİ ALMA
    
    //TC KİMLİK İLE MÜŞTERİ BİLGİSİ ALMA (ŞAHIS FİRMASI)
    $result = $elogo->get_company_info('XXXXXXXXXXx');
    print_r($result);
    //TC KİMLİK İLE MÜŞTERİ BİLGİSİ ALMA (ŞAHIS FİRMASI)


