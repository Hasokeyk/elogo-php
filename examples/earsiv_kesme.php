<?php

    use Hasokeyk\Elogo\Elogo;
    use Hasokeyk\Elogo\Fatura\Fatura;
    use Hasokeyk\Elogo\Fatura\FaturaSatir;
    use Hasokeyk\Elogo\Firma\BenimFirmam;
    use Hasokeyk\Elogo\Firma\MusteriFirmasi;

    require "vendor/autoload.php";

    $elogo_username = 'XXXXXXXXXXX';
    $elogo_password = 'XXXXXXXXXXX';
    $elogo_test     = true;

    $elogo = new Elogo($elogo_username, $elogo_password, $elogo_test);

    $elogo_login = $elogo->giris_yap();
    if(isset($elogo_login->sessionID)){

        //SİZE AİT FİRMANIN BİLGİLERİ
        $benim_firmam = new BenimFirmam();
        $benim_firmam->setYetkiliAdi('Hasan');
        $benim_firmam->setYetkiliSoyadi('Yüksektepe');
        $benim_firmam->setFirmaAdi('Hasan Yüksektepe');
        $benim_firmam->setTcKimlikNo('XXXXXXXXXXX');
        //        $benim_firmam->setVergiNo('XXXXXXXXXXX');
        $benim_firmam->setMersisNo('XXXXXXXXXXX');
        $benim_firmam->setTelefon('XXXXXXXXXXX');
        $benim_firmam->setEmail('info@hayatikodla.net');
        $benim_firmam->setWebsitesi('hayatikodla.net');
        $benim_firmam->setVergiDairesi('HAYATIKODLA');
        $benim_firmam->setAcikAdres('TAM ADRES BİLGİSİ');
        $benim_firmam->setIl('İstanbul');
        $benim_firmam->setIlce('Sancaktepe');
        $benim_firmam->setBinaNo('XXX');
        $benim_firmam->setBinaAdi('XXX');
        $benim_firmam->setPostaKodu('XXXXXX');
        $benim_firmam->setUlke('Türkiye');
        $benim_firmam->setUlkeKodu('TR');

        //MÜŞTERİNİN FİRMASININ BİLGİLERİ
        //Karşı taraf firma değil birey ise vergi noyu göndermeyebilirsiniz.
        $musteri_firmasi = new MusteriFirmasi();
        $musteri_firmasi->setYetkiliAdi('Hasan');
        $musteri_firmasi->setYetkiliSoyadi('Yüksektepe');
        $musteri_firmasi->setFirmaAdi('Hasan Yüksektepe');
        //        $musteri_firmasi->setVergiNo('XXXXXXXXXXX');
        $musteri_firmasi->setTcKimlikNo('XXXXXXXXXXX');
        //        $musteri_firmasi->setMersisNo('XXXXXXXXXXX');
        $musteri_firmasi->setTelefon('XXXXXXXXXXX');
        $musteri_firmasi->setEmail('info@hayatikodla.net');
        $musteri_firmasi->setWebsitesi('hayatikodla.net');
        $musteri_firmasi->setVergiDairesi('HAYATIKODLA');
        $musteri_firmasi->setAcikAdres('TAM ADRES BİLGİSİ');
        $musteri_firmasi->setIl('İstanbul');
        $musteri_firmasi->setIlce('Sancaktepe');
        $musteri_firmasi->setBinaNo('XXXXX');
        $musteri_firmasi->setBinaAdi('XXXXXX');
        $musteri_firmasi->setPostaKodu('XXXXXX');
        $musteri_firmasi->setUlke('Türkiye');
        $musteri_firmasi->setUlkeKodu('TR');

        //FATURADAKİ ÜRÜN VEYA HİZMETLERİNİZİ AŞAĞIDAKİ GİBİ GİREBİLİRSİNİZ.
        $fatura_satir = new FaturaSatir();

        $fatura_satir->setYeniUrun()->setUrunAdi('Yazılım')->setUrunAciklama('Ürün 1 açıklama')->setUrunAdet(2)->setUrunBirimFiyat(500)->setUrunIndirimTutari(500);
        $fatura_satir->setYeniUrun()->setUrunAdi('Yazılım2')->setUrunAciklama('Ürün 2 açıklama')->setUrunAdet(2)->setUrunBirimFiyat(1500);

        //FATURA BİLGİLERİNİ AŞAĞIDAKİ GİBİ GİRİNİZ
        //FATURA TUTARLARINI YUKARIDA GİRDİĞİNİZ ÜRÜN VEYA HİZMETLERİNİZE GÖRE OTOMATİK TOPLAMAKTADIR.
        //BU YÖNTEM İLE TUTAR UYUŞMAZLIKLARININ ÖNÜNE GEÇİLMİŞTİR.

        $fatura                 = new Fatura();
        $fatura_no              = $elogo->fatura_no_olustur();

        //FATURA TASARIMINIZ ÖZEL HAZIRLANMIŞ İSE BURADAN UBL FORMATINDAKİ DOSYANIZA TAM YOLUNU VERMELİSİNİZ.
        //FATURA TASARIMINI ELOGO PANELİNDEN "AYARLAR / TASARIM ARAÇLARI" VEYA "AYARLAR / HAZIR TASARIM ARACI" MENÜSÜNDEN OLUŞTURUP İNDİREBİLİRSİNİZ
        $varsayilan_earsiv_xml  = $fatura->varsayilan_earsiv_tasarim_dosyasi;
        $varsayilan_efatura_xml = $fatura->varsayilan_efatura_tasarim_dosyasi;

        $fatura->setFaturaEarsivTasarimDosyasi($varsayilan_earsiv_xml);
        $fatura->setFaturaEfaturaTasarimDosyasi($varsayilan_efatura_xml);

        $fatura->setFaturaNo($fatura_no);
        $fatura->setFaturaEttn($elogo_login->sessionID);
        $fatura->setFaturaTuru('TICARIFATURA'); //TICARIFATURA | SATIS
        $fatura->setFaturaTarihi('2023-02-26');

        $fatura->setKdvOrani(18);
        //    $fatura->setKdvMuhafiyetKodu('325');
        $fatura->setFaturaKesenFirma($benim_firmam);
        $fatura->setMusteriFirma($musteri_firmasi);
        $fatura->setParaBirimi('TRY');

        //PARA BİRİMİNİZ TRY DIŞINDA BİR PARA BİRİMİ İSE MUTLAKA KUR BİLGİSİ GİRMELİSİNİZ
        //        $fatura->setKurFiyati('18.1540');

        $fatura->setUrunler($fatura_satir);

        //FATURA TASARIMINIZDA ÖZEL ALANLAR OLABİLİR. BU ÖZEL ALANLARI ELOGO PANELİNDE
        //"AYARLAR / GÖRSEL TASARIM EK ALANLARI" MENÜSÜNDEN EKLEYEBİLİRSİNİZ. FAKAT EKLERKER
        //XSLT ISMINA
        //        <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
        //            <xsl:if test ="cbc:DocumentType = 'GemiNo'">
        //                <xsl:value-of select="cbc:ID"/>
        //            </xsl:if>
        //        </xsl:for-each>
        //  BU XML KOMUTUNU YAZMALISINIZ.
        //BU KOMUTTAKİ "GemiNo" KISMI AŞAĞIDAKİ KODDA KULLANACAĞINIZ KISA KOD OLMALIDIR
        //        $parametreler = [
        //            'GemiNo' => 'Hsn123',
        //        ];
        //
        //        $fatura->setOzelParametreler($parametreler);

        $einvoice = $elogo->earsiv_gonder($fatura, $benim_firmam, $musteri_firmasi);
        print_r($einvoice);

    }
    else{
        echo 'Giriş bilgileri hatalı';
    }