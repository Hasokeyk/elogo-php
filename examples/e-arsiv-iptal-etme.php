<?php
    
    use elogo_api\elogo_api;
    
    require "vendor/autoload.php";
    
    $elogo_username = '';
    $elogo_password = '';
    $elogo_test     = true;
    
    $elogo = new elogo_api($elogo_username, $elogo_password, $elogo_test);
    
    //E-ARSİV İPTAL ETME
    $result = $elogo->cancel_earchive('HSN2021179536450','XXXXXXXX-d40e-4197-8f06-79aa4cdae38e');
    print_r($result);
    //E-ARSİV İPTAL ETME
    