<?php
    
    use elogo_api\elogo_api;
    
    require "vendor/autoload.php";
    
    $elogo_username = '';
    $elogo_password = '';
    $elogo_test     = true;
    
    $elogo                = new elogo_api($elogo_username, $elogo_password, $elogo_test);
    $elogo->invoce_prefix = 'HSN'; //FATURA NUMARASI OLUŞTURMASI İÇİN EN FAZLA 3 KARAKTER
    
    //E-ARŞİV FATURASI BİLGİSİ ALMA
    $result = $elogo->get_document_info('1dfe9cfa-2c86-4e28-b7f5-5104faf00197', 'EARCHIVE');
    print_r($result);
    //E-ARŞİV FATURASI BİLGİSİ ALMA
    
    //E-FATURA BİLGİSİ ALMA
    $result = $elogo->get_document_info('1dfe9cfa-2c86-4e28-b7f5-5104faf00197', 'EINVOICE');
    print_r($result);
    //E-FATURA BİLGİSİ ALMA

