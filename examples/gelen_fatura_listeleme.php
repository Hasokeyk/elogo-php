<?php

    use Hasokeyk\Elogo\Elogo;

    require "vendor/autoload.php";

    $elogo_username = 'XXXXXXXXXXX';
    $elogo_password = 'XXXXXXXXXXX';
    $elogo_test     = true;

    $elogo = new Elogo($elogo_username, $elogo_password, $elogo_test);

    $elogo_login = $elogo->giris_yap();
    if(isset($elogo_login->sessionID)){

        //BURADA FATURALARIN UUID LERİ LİSTE OLARAK GELMEKTEDİR. SADECE FİYAT BİLGİSİ GELİYOR. ÇALIŞTIRINCA ANLARSINIZ :)
        //BU KODLAR İLE SİZE KESİLMİŞ FATURALARIN LİSTESİNİ ALABİLİYORSUNUZ.

        $gelen_efaturalar = $elogo->gelen_efaturalar('2023-03-01', '2023-03-31');

        //ELOGODAKİ BİR SAÇMALIK EARŞİV FATURALARINI GÜN GÜN ALABİLİYORSUNUZ YANİ BELİRLİ BİR TARİH ARASINDAKİ FATURALARI ALAMIYORSUNUZ.
        $gelen_earsivler = $elogo->gelen_earsivler('2023-03-01');


    }
    else{
        echo 'Giriş bilgileri hatalı';
    }