<?php
    
    use elogo_api\elogo_api;
    
    require "vendor/autoload.php";
    
    $elogo_username = '';
    $elogo_password = '';
    $elogo_test     = true;
    
    $elogo                = new elogo_api($elogo_username, $elogo_password, $elogo_test);
    $elogo->invoce_prefix = 'HSN'; //FATURA NUMARASI OLUŞTURMASI İÇİN EN FAZLA 3 KARAKTER
    
    //FATURA KESEN FİRMA BİLGİLERİ
    $elogo->my_company = [
        'websitesi'       => 'www.hayatikodla.net',
        'ticari_sicil_no' => '999999',
        'vergi_no'        => '9999999999',
        'vergi_dairesi'   => 'Vergi Dairesi Adı',
        'mersis_no'       => 'xxxx xxxx xxxx xxxx',
        'unvan'           => 'Hasan Yüksektepe A.Ş',
        'tel'             => '90 541 423 35 58',
        'mail'            => 'hasanhasokeyk@hotmail.com',
        'adres'           => [
            'acik_adres'   => 'Tam adresi girin',
            'bina_adi'     => '',
            'bina_no'      => '',
            'mahalle_ilce' => 'Mahalle/İlçe',
            'il'           => 'İstanbul',
            'posta_kodu'   => '34600',
            'ulke'         => 'Türkiye',
            'ulke_kodu'    => 'TR',
        ],
    ];
    //FATURA KESEN FİRMA BİLGİLERİ
    
    //FATURA KESİLEN FİRMA BİLGİLERİ
    $elogo->customer_company = [
        'yetkili_adi'    => 'Hasan',
        'yetkili_soyadi' => 'Yüksektepe',
        'unvan'          => 'Hasan Yüksektepe',
        'websitesi'      => '',
        'firma_turu'     => 'sahis', //firma , sahis
        'vergi_no_tckn'  => 'xxxxxxxxxxx',
        'vergi_dairesi'  => '',
        'tel'            => '',
        'fax'            => '',
        'email'          => 'hasanhasokeyk@hotmail.com',
        'adres'          => [
            'acik_adres'   => 'Tam adresi girin',
            'bina_adi'     => '',
            'bina_no'      => '',
            'mahalle_ilce' => 'Mahalle/İlçe',
            'il'           => 'İstanbul',
            'posta_kodu'   => '34600',
            'ulke'         => 'Türkiye',
            'ulke_kodu'    => 'TR',
        ],
    ];
    //FATURA KESİLEN FİRMA BİLGİLERİ
    
    //FATURA BİLGİLERİ
    $elogo->invoice = [
        'urun_hizmet'  => [
            [
                'hizmet_adi'      => 'Hizmet adı',
                'hizmet_aciklama' => 'Hizmet Açıklama',
                'adet'            => 1,
                'tutar'           => 1000.00,
                'kdv_tutar'       => 180.00,
                'kdv_oran'        => 18.00,
            ],
            [
                'hizmet_adi'      => 'Hizmet adı',
                'hizmet_aciklama' => 'Hizmet Açıklama',
                'adet'            => 1,
                'tutar'           => 1000.00,
                'kdv_tutar'       => 180.00,
                'kdv_oran'        => 18.00,
            ],
        ],
        'genel_toplam' => 2360.00,
        'toplam_tutar' => 2000.00,
        'kdv_tutar'    => 360.00,
        'kdv_oran'     => 18.00,
        //'kdv_muhafiyet_kodu' => 223,
    ];
    //FATURA BİLGİLERİ
    
    //E-FATURA YENİDEN GÖNDERME
    $result = $elogo->cancel_earchive('SATIS', 'HSN2021179536450', 'XXXXXXXX-d40e-4197-8f06-79aa4cdae38e');
    print_r($result);
    //E-FATURA YENİDEN GÖNDERME