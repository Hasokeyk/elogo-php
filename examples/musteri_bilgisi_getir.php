<?php

    use Hasokeyk\Elogo\Elogo;

    require "vendor/autoload.php";

    $elogo_username = 'XXXXXXXXXXX';
    $elogo_password = 'XXXXXXXXXXX';
    $elogo_test     = true;

    $elogo = new Elogo($elogo_username, $elogo_password, $elogo_test);

    $elogo_login = $elogo->giris_yap();
    if(isset($elogo_login->sessionID)){

        $musteri_bilgi = $elogo->musteri_bilgisi_getir('XXXXXXXXXXXX');
        print_r($musteri_bilgi);

    }
    else{
        echo 'Giriş bilgileri hatalı';
    }