<?php

    use Hasokeyk\Elogo\Elogo;
    use Hasokeyk\Elogo\Fatura\Fatura;
    use Hasokeyk\Elogo\Fatura\FaturaSatir;
    use Hasokeyk\Elogo\Firma\BenimFirmam;
    use Hasokeyk\Elogo\Firma\MusteriFirmasi;
    use Hasokeyk\Elogo\ElogoHata;

    require "vendor/autoload.php";

    $elogo_username = 'XXXXXXXXXXX';
    $elogo_password = 'XXXXXXXXXXX';
    $elogo_test     = true;

    $elogo = new Elogo($elogo_username, $elogo_password, $elogo_test);

    $elogo_login = $elogo->giris_yap();
    if(isset($elogo_login->sessionID)){
        try{
            //SİZE AİT FİRMANIN BİLGİLERİ
            $benim_firmam = new BenimFirmam();
            $benim_firmam->setYetkiliAdi('Hasan'); // ŞAHIS İSE GEREKLİ
            $benim_firmam->setYetkiliSoyadi('Yüksektepe'); // ŞAHIS İSE GEREKLİ
            $benim_firmam->setFirmaAdi('Hasan Yüksektepe'); // TİCARİ İSE GEREKLİ
            $benim_firmam->setTcKimlikNo('XXXXXXXXXXX'); // ŞAHIS İSE GEREKLİ
            $benim_firmam->setVergiNo('XXXXXXXXXXX'); // TİCARİ İSE GEREKLİ
            $benim_firmam->setMersisNo('XXXXXXXXXXX'); // OPSİYONEL
            $benim_firmam->setTelefon('XXXXXXXXXXX'); // OPSİYONEL
            $benim_firmam->setEmail('info@hayatikodla.net'); // OPSİYONEL
            $benim_firmam->setWebsitesi('hayatikodla.net'); // OPSİYONEL
            $benim_firmam->setVergiDairesi('HAYATIKODLA'); // GEREKLİ
            $benim_firmam->setAcikAdres('TAM ADRES BİLGİSİ'); // GEREKLİ
            $benim_firmam->setIl('İstanbul'); // GEREKLİ
            $benim_firmam->setIlce('Sancaktepe'); // GEREKLİ
            $benim_firmam->setBinaNo('XXX'); // GEREKLİ
            $benim_firmam->setBinaAdi('XXX'); // GEREKLİ
            $benim_firmam->setPostaKodu('XXXXXX'); // GEREKLİ
            $benim_firmam->setUlke('Türkiye'); // GEREKLİ
            $benim_firmam->setUlkeKodu('TR'); // GEREKLİ

            //MÜŞTERİNİN FİRMASININ BİLGİLERİ
            //Karşı taraf firma değil birey ise vergi noyu göndermeyebilirsiniz.
            $musteri_firmasi = new MusteriFirmasi();
            $musteri_firmasi->setYetkiliAdi('Hasan'); // ŞAHIS İSE GEREKLİ
            $musteri_firmasi->setYetkiliSoyadi('Yüksektepe'); // ŞAHIS İSE GEREKLİ
            $musteri_firmasi->setFirmaAdi('Hasan Yüksektepe'); // TİCARİ İSE GEREKLİ ŞAHIS İÇİN BOŞ BIRAKILABİLİR
            $musteri_firmasi->setVergiNo('XXXXXXXXXXX'); // TİCARİ İSE GEREKLİ ŞAHIS İÇİN BOŞ BIRAKILABİLİR
            $musteri_firmasi->setTcKimlikNo('XXXXXXXXXXX'); // ŞAHIS İSE GEREKLİ
            $musteri_firmasi->setMersisNo('XXXXXXXXXXX'); // OPSİYONEL
            $musteri_firmasi->setTelefon('XXXXXXXXXXX'); // OPSİYONEL
            $musteri_firmasi->setEmail('info@hayatikodla.net'); // OPSİYONEL
            $musteri_firmasi->setWebsitesi('hayatikodla.net'); // OPSİYONEL
            $musteri_firmasi->setVergiDairesi('HAYATIKODLA'); // GEREKLİ
            $musteri_firmasi->setAcikAdres('TAM ADRES BİLGİSİ'); // GEREKLİ
            $musteri_firmasi->setIl('İstanbul'); // GEREKLİ
            $musteri_firmasi->setIlce('Sancaktepe'); // GEREKLİ
            $musteri_firmasi->setBinaNo('XXXXX'); // GEREKLİ
            $musteri_firmasi->setBinaAdi('XXXXXX'); // GEREKLİ
            $musteri_firmasi->setPostaKodu('XXXXXX'); // GEREKLİ
            $musteri_firmasi->setUlke('Türkiye'); // GEREKLİ
            $musteri_firmasi->setUlkeKodu('TR'); // GEREKLİ

            //FATURADAKİ ÜRÜN VEYA HİZMETLERİNİZİ AŞAĞIDAKİ GİBİ GİREBİLİRSİNİZ.
            $fatura_satir = new FaturaSatir();

            $fatura_satir->setYeniUrun()->setUrunAdi('Yazılım')->setUrunAciklama('Ürün 1 açıklama')->setUrunAdet(2)->setUrunBirimFiyat(500)->setUrunIndirimTutari(500)->setUrunKdvOrani(20);
            $fatura_satir->setYeniUrun()->setUrunAdi('Yazılım2')->setUrunAciklama('Ürün 2 açıklama')->setUrunAdet(2)->setUrunBirimFiyat(1500)->setUrunKdvOrani(20);

            //FATURA BİLGİLERİNİ AŞAĞIDAKİ GİBİ GİRİNİZ
            //FATURA TUTARLARINI YUKARIDA GİRDİĞİNİZ ÜRÜN VEYA HİZMETLERİNİZE GÖRE OTOMATİK TOPLAMAKTADIR.
            //BU YÖNTEM İLE TUTAR UYUŞMAZLIKLARININ ÖNÜNE GEÇİLMİŞTİR.

            $fatura    = new Fatura();
            $fatura_no = $elogo->fatura_no_olustur(); // FATURA OLUŞTURURKEN EFATURA İÇİN 'FTR' KENDİ SIRASINA GÖRE DEVAM ETMELİ, E-ARŞİV İÇİN ARS  KENDİ SIRASINA GÖRE DEVAM ETMELİ,
            // ÖRN: ARS0000001, ARS0000002, FTR0000001, FTR0000002

            $uuid = sprintf(// Mevcut yapınıza uygun olarak $uuid verisini kendiniz oluşturabilirsiniz.
                '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
                mt_rand(0, 0xffff), mt_rand(0, 0xffff),
                mt_rand(0, 0xffff),
                mt_rand(0, 0x0fff) | 0x4000,
                mt_rand(0, 0x3fff) | 0x8000,
                mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
            ); 

            //FATURA TASARIMINIZ ÖZEL HAZIRLANMIŞ İSE BURADAN UBL FORMATINDAKİ DOSYANIZA TAM YOLUNU VERMELİSİNİZ.
            //FATURA TASARIMINI ELOGO PANELİNDEN "AYARLAR / TASARIM ARAÇLARI" VEYA "AYARLAR / HAZIR TASARIM ARACI" MENÜSÜNDEN OLUŞTURUP İNDİREBİLİRSİNİZ
            $varsayilan_earsiv_xml  = $fatura->varsayilan_earsiv_tasarim_dosyasi;
            $varsayilan_efatura_xml = $fatura->varsayilan_efatura_tasarim_dosyasi;

            $fatura->setFaturaEarsivTasarimDosyasi($varsayilan_earsiv_xml);
            $fatura->setFaturaEfaturaTasarimDosyasi($varsayilan_efatura_xml);

            $fatura->setFaturaNo($fatura_no);
            $fatura->setFaturaEttn($uuid);
            // FATURA E-ARŞİV ise 'EARSIVFATURA', E-FATURA ise 'TICARIFATURA' kullanılabilir.
            $fatura->setFaturaTuru('TICARIFATURA'); // ['TICARIFATURA', 'EARSIVFATURA', 'TEMELFATURA', 'IHRACAT', 'KAMU', 'HALFATURA', 'YOLCUBERABER']
            $fatura->setFaturaTuru('SATIS'); // ['SATIS', 'IADE', 'TEVKIFATIADE', 'IHTIYACKAYITLI', 'ISTISNA', 'OZELMATRAH', 'TEVKIFAT', 'SGK', 'KONAKLAMAVERGISI']
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

            $einvoice = $elogo->efatura_gonder($fatura, $benim_firmam, $musteri_firmasi);
            print_r($einvoice);
        }catch(ElogoHata $err){ // ELOGO Servisinden gelen yanıtları okunabilir hale getirir.
            echo $err->getMessage();
        }
    }
    else{
        echo 'Giriş bilgileri hatalı';
    }
