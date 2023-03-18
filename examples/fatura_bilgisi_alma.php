<?php

    use Hasokeyk\Elogo\Elogo;

    require "vendor/autoload.php";

    $elogo_username = 'XXXXXXXXXXX';
    $elogo_password = 'XXXXXXXXXXX';
    $elogo_test     = true;

    $elogo = new Elogo($elogo_username, $elogo_password, $elogo_test);

    $elogo_login = $elogo->giris_yap();
    if(isset($elogo_login->sessionID)){

        //ÇIKTI ELOGODAN ZİP ÇIKTISI OLARAK GÖNDERİLMEKTEDİR AMA ZİP DOSYASININ İÇİNDE SİZİN BELİRLEDİĞİNİZ PDF VEYA UBL FORMATI VARDIR

        //E-FATURA BİLGİSİ ALMA
        $efatura_bilgisi = $elogo->efatura_zip_ciktisi_getir('XXXXXXXXXXXX','PDF');
        print_r($efatura_bilgisi);

        //E-ARŞİV BİLGİSİ ALMA
        $efatura_bilgisi = $elogo->earsiv_zip_ciktisi_getir('XXXXXXXXXXXX','UBL');
        print_r($efatura_bilgisi);

    }
    else{
        echo 'Giriş bilgileri hatalı';
    }