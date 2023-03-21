<?php

    namespace Hasokeyk\Elogo\Fatura;

    use Hasokeyk\Elogo\ElogoHata;
    use Hasokeyk\Elogo\Firma\BenimFirmam;
    use Hasokeyk\Elogo\Firma\MusteriFirmasi;

    class FaturaUbl{

        public $fatura;
        public $benim_firmam;
        public $musteri_firmasi;
        private $fatura_xml;

        public $xml_ns = [
            'cac'   => 'urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2',
            'xades' => 'http://uri.etsi.org/01903/v1.3.2#',
            'udt'   => 'urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2',
            'cbc'   => 'urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2',
            'ccts'  => 'urn:un:unece:uncefact:documentation:2',
            'ubltr' => 'urn:oasis:names:specification:ubl:schema:xsd:TurkishCustomizationExtensionComponents',
            'qdt'   => 'urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2',
            'ext'   => 'urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2',
            'ds'    => 'http://www.w3.org/2000/09/xmldsig#',
            'xsi'   => 'http://www.w3.org/2001/XMLSchema-instance',
        ];

        public $kdv_muhafiyet = [
            '201' => '17/1	Kültür ve eğitim amacı taşıyan işlemler',
            '202' => '17/2-a	Sağlık, çevre ve sosyal yardım amaçlı işlemler',
            '204' => '17/2-c	Yabancı diplomatik organ ve hayır kurumlarının yapacakları bağışlarla ilgili mal ve hizmet alışları',
            '205' => '17/2-d	Taşınmaz kültür varlıklarına ilişkin teslimler ve mimarlık hizmetleri',
            '206' => '17/2-e	Mesleki kuruluşların işlemleri',
            '207' => '17/3	Askeri fabrika, tersane ve atölyelerin işlemleri',
            '208' => '17/4-c	Birleşme, devir, dönüşüm ve bölünme işlemleri',
            '209' => '17/4-e	Banka ve sigorta muamaleleri vergisi kapsamına giren işlemler',
            '211' => '17/4-h	Zirai amaçlı su teslimleri ile köy tüzel kişiliklerince yapılan içme suyu teslimleri',
            '212' => '17/4-ı	Serbest bölgelerde verilen hizmetler',
            '213' => '17/4-j	Boru hattı ile yapılan petrol ve gaz taşımacılığı',
            '214' => '17/4-k	Organize sanayi bölgelerindeki arsa ve işyeri teslimleri ile konut yapı kooperatiflerinin üyelerine konut teslimleri',
            '215' => '17/4-l	Varlık yönetim şirketlerinin işlemleri',
            '216' => '17/4-m	Tasarruf mevduatı sigorta fonunun işlemleri',
            '217' => '17/4-n	Basın-Yayın ve Enformasyon Genel Müdürlüğüne verilen haber hizmetleri',
            '218' => '17/4-o	Gümrük antrepoları, geçici depolama yerleri, gümrüklü sahalar ve vergisiz satış yapılan mağazalarla ilgili hizmetler',
            '219' => '17/4-p	Hazine ve Arsa Ofisi Genel Müdürlüğünün işlemleri',
            '220' => '17/4-r	İştirak hisseleri ve gayrimenkul satışları',
            '221' => 'Geçici 15 Konut yapı kooperatifleri, belediyeler ve sos. güv.kuruluşlarıına verilen inşaat taahhüt hizmeti',
            '223' => 'Geçici 20/1 Teknoloji geliştirme bölgelerinde yapılan işlemler',
            '225' => 'Geçici 23 Milli Eğitim Bakanlığına yapılan bilgisayar bağışları ile ilgili teslimler',
            '226' => '17/2-b	Özel okullar, üniversite ve yüksekokullar tarafından verilen bedelsiz eğitim ve öğretim hizmetleri',
            '227' => '17/2-b	Kanunların gösterdiği gerek üzerine bedelsiz olarak yapılan teslim ve hizmetler',
            '228' => '17/2-b	Kanunun (17/1) maddesinde sayılan kurum ve kuruluşlara bedelsiz olarak yapılan teslim ve hizmetler',
            '229' => '17/2-b	Gıda bankacılığı faaliyetinde bulunan dernek ve vakıflara bağışlanan gıda, temizlik, giyecek ve yakacak maddeleri',
            '230' => '17/4-g	Külçe altın, külçe gümüş, kıymetli taş teslimleri',
            '231' => '17/4-g	Metal, plastik, lastik, kauçuk, kağıt, cam hurda ve atıkları teslimi',
            '232' => '17/4-g	Döviz, para, damga pulu, değerli kağıtlar, hisse senedi, tahvil teslimleri',
            '234' => '17/4-ş	Konut Finansmanı Amacıyla Teminat Gösterilen ve İpotek Konulan Konutların Teslimi',
            '235' => '16/1-c	Transit ve gümrük antrepo rejimleri ile geçici depolama ve serbest bölge hükümlerinin uygulandığı malların teslimi',
            '236' => '19/2	Usulüne göre yürürlüğe girmiş uluslararası anlaşmalar kapsamındaki istisnalar (İade hakkı tanınmayan)',
            '237' => '17/4-t	5300 Sayılı Kanuna Göre Düzenlenen Ürün Senetlerinin İhtisas/Ticaret Borsaları Aracılığıyla İlk Tesliminden Sonraki Teslimi',
            '238' => '17/4-u	Varlıkların Varlık Kiralama Şirketlerine Devri ile Bu Varlıkların Varlık Kiralama Şirketlerince Kiralanması ve Devralınan Kuruma Devri',
            '239' => '17/4-y	Taşınmazların Finansal Kiralama Şirketlerine Devri,Finansal Kiralama Şirketi Tarafından Devredene Kiralanması ve Devri',
            '240' => '17/4-z	Patentli veya Faydalı Model Belgeli Buluşa İlişkin Gayrimaddi Hakların Kiralanması, Devri ve Satışı',
            '250' => 'Diğerleri',
            '301' => '11/1-a	Mal ihracatı',
            '302' => '11/1-a	Hizmet İhracatı',
            '303' => '11/1-a	Roaming hizmetleri',
            '304' => '13/a	Deniz, hava ve demiryolu taşıma araçlarının teslimi ile inşa, tadil, bakım ve onarımları',
            '305' => '13/b	Deniz ve hava taşıma araçları için liman ve hava meydanlarında yapılan hizmetler',
            '306' => '13/c	Petrol aramaları ve petrol boru hatlarının inşa ve modernizasyonuna ilişkin yapılan teslim ve hizmetler',
            '307' => '13/c	Kıymetli madenlerin arama, zenginleştirme ve rafinaj faaliyetleri',
            '308' => '13/d	Teşvikli yatırım mallarının teslimi',
            '309' => '13/e	Limanlara bağlantı sağlayan demiryolu hatları ile liman ve hava meydanlarının inşası, yenilenmesi ve genişletilmesi',
            '310' => '13/f	Ulusal güvenlik amaçlı teslim ve hizmetler',
            '311' => '14.Oca	Uluslararası taşımacılık',
            '312' => '15/a	Diplomatik organ ve misyonlara yapılan teslim ve hizmetler',
            '313' => '15/b	Uluslarası kurulaşlara yapılan teslim ve hizmetler',
            '314' => '19.Şub	Usulüne göre yürürlüğe girmiş uluslar arası anlaşmalar kapsamındaki istisnalar (İade hakkı tanınan)',
            '315' => '14.Mar	İhraç konusu eşyayı taşıyan kamyon, çekici ve yarı romorklara yapılan motorin teslimleri',
            '316' => '11/1-a	Serbest bölgelerdeki müşteriler için yapılan fason hizmetler',
            '317' => '17/4-s	Özürlülerin eğitimleri, meslekleri ve günlük yaşamlarına ilişkin araç-gereç ve bilgisayar programları',
            '350' => 'Diğerleri',
            '351' => 'İstisna Olmayan Diğer',
            '401' => '8.Oca	Fazla ve yersiz ödenen vergiler',
            '403' => '11/1-a	61 No.lu KDV Genel Tebliği kapsamındaki satışlarla ilgili yüklenilen KDV',
            '405' => '11/1-c ve Geçici 17	İhracatı bu dönemde gerçekleşen indirimli orana tabi malların ihraç kaydıyla teslimleri ile ilgili yüklenilen KDV farkı',
            '406' => '29/2	İndirimli orana tabi işlemler',
            '408' => '11/1-b	43 No.lu KDV Genel Tebliği kapsamındaki teslimlerle ilgili olup bu dönemde alıcıya iade edilen KDV',
            '409' => '9.Şub	İstisnadan vazgeçenlerin hurda ve atık teslimlerinde alıcı tarafından tevkif edilen KDV',
            '410' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan yapım işlerine ait tevkif edilen KDV',
            '411' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan temizlik işlerine ait tevkif edilen KDV',
            '412' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan bahçe ve çevre bakım işlerine ait tevkif edilen KDV',
            '413' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan özel güvenlik hizmetlerine ait tevkif edilen KDV',
            '414' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan tadil,bakım,onarım hizmetlerine ait tevkif edilen KDV',
            '415' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan yemek sevis hizmetlerine ait tevkif edilen KDV',
            '416' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan danışmanlık-denetim hizmetlerine ait tevkif edilen KDV',
            '417' => '9.Şub	91 No.lu G.T. (A/2) bölümünde belirtilen kurum ve kuruluşlara yapılan işgücü hizmetlerine ait tevkif edilen KDV',
            '418' => '9.Şub	Bakır, alüminyum ve çinko külçe teslimlerinde alıcı tarafından tevkif edilen KDV',
            '419' => '9.Şub	Bakır, alüminyum, çinko ve bunların alaşımlarından elde edilen mamullerin teslimlerinde alıcı tarafından tevkif edilen KDV',
            '420' => '9.Şub	Yapı denetim hizmeti ile ilgili olarak alıcı tarafından tevkif edilen KDV (91 No.lu GT kapsamı dışındaki mükelleflere yapılanlar)',
            '421' => '9.Şub	İş gücü hizmeti ile ilgili olarak alıcı tarafından tevkif edilen KDV (91 No.lu GT kapsamı dışındaki mükelleflere yapılanlar)',
            '422' => '9.Şub	Özel güvenlik hizmeti ile ilgili olarak alıcı tarafından tevkif edilen KDV (91 No.lu GT kapsamı dışındaki mükelleflere yapılanlar)',
            '423' => '9.Şub	Fason tekstil ve konfeksiyon işlerinde alıcı tarafından tevkif edilen KDV',
            '424' => '9.Şub	Diğer kısmi tevkifata tabi işlemlerde alıcı tarafından beyan edilecek KDV',
            '425' => '13/a	Sipariş verenin bu istisna kapsamındaki araçların imal ve inşasında kullanılan KDV’ye tabi mal ve hizmet alımları',
            '426' => '13/c	Kıymetli madenlerin arama, zenginleştirme ve rafinaj faaliyetleri',
            '427' => '13/f	Ulusal güvenlik amaçlı teslim ve hizmetin yapılmasından önceki iade talepleri ile tedarikçilerin iade talepleri',
            '428' => '9.Şub	Pamuk, tiftik, yün ve yapağı ile ham post ve deri teslimlerinde alıcı tarafından tevkif edilen KDV',
            '429' => '9.Şub	Büyük ve küçükbaş hayvan etlerinin tesliminde alıcı tarafından tevkif edilen KDV',
            '430' => '9.Şub	Hurda metalden elde edilen külçe teslimlerinde alıcı tarafından tevkif edilen KDV',
            '431' => '9.Şub	Turizm acente, rehber ve benzerlerine yapılan komisyon ödemelerine ilişkin alıcı tarafından tevkif edilen KDV',
            '450' => 'Diğerleri',
        ];

        public function __construct(Fatura $fatura, BenimFirmam $benim_firmam, MusteriFirmasi $musteri_firmasi){
            $this->fatura          = $fatura;
            $this->benim_firmam    = $benim_firmam;
            $this->musteri_firmasi = $musteri_firmasi;
        }

        public function getir_ubl_xml($fatura_tasarimi = 'TICARIFATURA'){

            try{

                $fatura_senaryo     = $this->fatura->fatura_senaryo ?? 'TICARIFATURA';
                $fatura_turu        = $this->fatura->fatura_turu ?? 'SATIS';
                $fatura_no          = $this->fatura->fatura_no;
                $fatura_ettn        = $this->fatura->fatura_ettn;
                $fatura_tarihi      = $this->fatura->fatura_tarihi;
                $fatura_notu        = $this->fatura->fatura_notu ?? '';
                $para_birimi        = $this->fatura->para_birimi ?? 'TRY';
                $kur_fiyati         = $this->fatura->kur_fiyati ?? '1';
                $fatura_kdv_orani   = $this->fatura->kdv_orani;
                $kdv_muhafiyet_kodu = $this->fatura->kdv_muhafiyet_kodu;
                $urunler            = $this->fatura->getUrunler();

                $fatura_toplam_tutar     = $this->fatura->fatura_toplam_tutar;
                $fatura_toplam_kdv_tutar = $this->fatura->fatura_toplam_kdv_tutar;
                $fatura_genel_toplam     = $this->fatura->fatura_genel_toplam;
                $fatura_indirim_tutari   = $this->fatura->fatura_indirim_tutari;

                $earsiv_tasarim  = $this->fatura->fatura_earsiv_tasarim_dosyasi ?? $this->fatura->varsayilan_earsiv_tasarim_dosyasi;
                $efatura_tasarim = $this->fatura->fatura_efatura_tasarim_dosyasi ?? $this->fatura->varsayilan_efatura_tasarim_dosyasi;

                $xml_string = trim('<?xml version="1.0" encoding="utf-8"?>');

                if($fatura_tasarimi == 'TICARIFATURA'){
                    $xml_string                 .= $this->get_ticari_fatura_xml();
                    $fatura_tasarimi_yolu       = $efatura_tasarim;
                    $tasarim_adi                = pathinfo($fatura_tasarimi_yolu);
                    $tasarim_dosya_adi          = $tasarim_adi['filename'];
                    $tasarim_dosya_adi_uzantili = $tasarim_adi['basename'];
                }
                else if($fatura_tasarimi == 'EARSIVFATURA'){
                    $xml_string                 .= $this->get_earsiv_fatura_xml();
                    $fatura_tasarimi_yolu       = $earsiv_tasarim;
                    $tasarim_adi                = pathinfo($fatura_tasarimi_yolu);
                    $tasarim_dosya_adi          = $tasarim_adi['filename'];
                    $tasarim_dosya_adi_uzantili = $tasarim_adi['basename'];
                }

                $fatura_xml       = new \SimpleXMLElement($xml_string);
                $this->fatura_xml = $fatura_xml;

                $fatura_xml->addChild('UBLVersionID', '2.1', $this->xml_ns['cbc']);
                $fatura_xml->addChild('CustomizationID', 'TR1.2', $this->xml_ns['cbc']);
                $fatura_xml->addChild('ProfileID', $fatura_senaryo, $this->xml_ns['cbc']);
                $fatura_xml->addChild('ID', $fatura_no, $this->xml_ns['cbc']);
                $fatura_xml->addChild('CopyIndicator', 'false', $this->xml_ns['cbc']);
                $fatura_xml->addChild('UUID', $fatura_ettn, $this->xml_ns['cbc']);
                $fatura_xml->addChild('IssueDate', $fatura_tarihi, $this->xml_ns['cbc']);
                $fatura_xml->addChild('IssueTime', date('H:i:s'), $this->xml_ns['cbc']);
                $fatura_xml->addChild('InvoiceTypeCode', $fatura_turu, $this->xml_ns['cbc']);
                $fatura_xml->addChild('Note', $fatura_notu, $this->xml_ns['cbc']);

                $this->ozel_paremetre($this->fatura->getOzelParametreler());

                $DocumentCurrencyCode = $fatura_xml->addChild('DocumentCurrencyCode', $para_birimi, $this->xml_ns['cbc']);
                $DocumentCurrencyCode->addAttribute('listAgencyName', 'United Nations Economic Commission for Europe');
                $DocumentCurrencyCode->addAttribute('listID', 'ISO 4217 Alpha');
                $DocumentCurrencyCode->addAttribute('listName', 'Currency');
                $DocumentCurrencyCode->addAttribute('listVersionID', '2001');

                $fatura_xml->addChild('LineCountNumeric', count($urunler), $this->xml_ns['cbc']);

                $xslt = base64_encode(file_get_contents($fatura_tasarimi_yolu));

                if($para_birimi != 'TRY'){

                    //USD KUR MAL HİZMET
                    $additional_document_reference = $fatura_xml->addChild('AdditionalDocumentReference', null, $this->xml_ns['cac']);
                    $additional_document_reference->addChild('ID', $fatura_toplam_tutar * $kur_fiyati, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('IssueDate', $fatura_tarihi, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('DocumentType', 'LINEEXTENSIONAMOUNT', $this->xml_ns["cbc"]);
                    //USD KUR MAL HİZMET

                    //USD KUR HESAPLANAN GERÇEK KDV
                    $additional_document_reference = $fatura_xml->addChild('AdditionalDocumentReference', null, $this->xml_ns['cac']);
                    $additional_document_reference->addChild('ID', 0, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('IssueDate', $fatura_tarihi, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('DocumentType', 'ALLOWANCETOTALAMOUNT', $this->xml_ns["cbc"]);
                    //USD KUR HESAPLANAN GERÇEK KDV

                    //USD KUR HESAPLANAN VERGİLER DAHİL TOPLAM TUTAR
                    $additional_document_reference = $fatura_xml->addChild('AdditionalDocumentReference', null, $this->xml_ns['cac']);
                    $additional_document_reference->addChild('ID', ($fatura_genel_toplam * $kur_fiyati), $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('IssueDate', $fatura_tarihi, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('DocumentType', 'TAXINCLUSIVEAMOUNT', $this->xml_ns["cbc"]);
                    //USD KUR HESAPLANAN VERGİLER DAHİL TOPLAM TUTAR

                    //USD KUR ÖDENECEK TOPLAM TUTAR
                    $additional_document_reference = $fatura_xml->addChild('AdditionalDocumentReference', null, $this->xml_ns['cac']);
                    $additional_document_reference->addChild('ID', ($fatura_genel_toplam * $kur_fiyati), $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('IssueDate', $fatura_tarihi, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('DocumentType', 'PAYABLEAMOUNT', $this->xml_ns["cbc"]);
                    //USD KUR ÖDENECEK TOPLAM TUTAR

                    //USD KUR HESAPLANAN GERÇEK KDV
                    $additional_document_reference = $fatura_xml->addChild('AdditionalDocumentReference', null, $this->xml_ns['cac']);
                    $additional_document_reference->addChild('ID', $fatura_toplam_kdv_tutar * $kur_fiyati, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('IssueDate', $fatura_tarihi, $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('DocumentTypeCode', '0015', $this->xml_ns["cbc"]);
                    $additional_document_reference->addChild('DocumentType', $fatura_kdv_orani, $this->xml_ns["cbc"]);
                    //USD KUR HESAPLANAN GERÇEK KDV

                }

                $additional_document_reference = $fatura_xml->addChild('AdditionalDocumentReference', null, $this->xml_ns['cac']);
                $additional_document_reference->addChild('ID', $tasarim_dosya_adi, $this->xml_ns["cbc"]);
                $additional_document_reference->addChild('IssueDate', $fatura_tarihi, $this->xml_ns["cbc"]);

                $attachment                      = $additional_document_reference->addChild('Attachment', null, $this->xml_ns["cac"]);
                $embedded_document_binary_object = $attachment->addChild('EmbeddedDocumentBinaryObject', $xslt, $this->xml_ns["cbc"]);
                $embedded_document_binary_object->addAttribute("characterSetCode", "UTF-8");
                $embedded_document_binary_object->addAttribute("encodingCode", "Base64");
                $embedded_document_binary_object->addAttribute("filename", $tasarim_dosya_adi_uzantili);
                $embedded_document_binary_object->addAttribute("mimeCode", "application/xml");

                $this->benim_firmam_xml();
                $this->musteri_firmasi_xml();

                if($para_birimi != 'TRY'){

                    $PricingExchangeRat = $fatura_xml->addChild('PricingExchangeRate', null, $this->xml_ns['cac']);

                    $SourceCurrencyCode = $PricingExchangeRat->addChild('SourceCurrencyCode', $para_birimi, $this->xml_ns['cbc']);
                    $SourceCurrencyCode->addAttribute('listAgencyName', 'United Nations Economic Commission for Europe');
                    $SourceCurrencyCode->addAttribute('listID', 'ISO 4217 Alpha');
                    $SourceCurrencyCode->addAttribute('listName', 'Currency');
                    $SourceCurrencyCode->addAttribute('listVersionID', '2001');

                    $TargetCurrencyCode = $PricingExchangeRat->addChild('TargetCurrencyCode', 'TRY', $this->xml_ns['cbc']);
                    $TargetCurrencyCode->addAttribute('listAgencyName', 'United Nations Economic Commission for Europe');
                    $TargetCurrencyCode->addAttribute('listID', 'ISO 4217 Alpha');
                    $TargetCurrencyCode->addAttribute('listName', 'Currency');
                    $TargetCurrencyCode->addAttribute('listVersionID', '2001');

                    $PricingExchangeRat->addChild('CalculationRate', $kur_fiyati, $this->xml_ns['cbc']);

                }

                $TaxTotal  = $fatura_xml->addChild('TaxTotal', null, $this->xml_ns['cac']);
                $TaxAmount = $TaxTotal->addChild('TaxAmount', $fatura_toplam_kdv_tutar, $this->xml_ns['cbc']);
                $TaxAmount->addAttribute('currencyID', $para_birimi);

                $TaxSubtotal   = $TaxTotal->addChild('TaxSubtotal', null, $this->xml_ns['cac']);
                $TaxableAmount = $TaxSubtotal->addChild('TaxableAmount', $fatura_toplam_tutar, $this->xml_ns['cbc']);
                $TaxableAmount->addAttribute('currencyID', $para_birimi);

                $TaxAmount2 = $TaxSubtotal->addChild('TaxAmount', $fatura_toplam_kdv_tutar, $this->xml_ns['cbc']);
                $TaxAmount2->addAttribute('currencyID', $para_birimi);

                $TaxSubtotal->addChild('Percent', $fatura_kdv_orani, $this->xml_ns['cbc']);

                $TaxCategory = $TaxSubtotal->addChild('TaxCategory', null, $this->xml_ns['cac']);
                if(isset($kdv_muhafiyet_kodu) and $kdv_muhafiyet_kodu != null){
                    $TaxCategory->addChild('TaxExemptionReasonCode', $kdv_muhafiyet_kodu, $this->xml_ns['cbc']);
                    $TaxCategory->addChild('TaxExemptionReason', $this->kdv_muhafiyet[$kdv_muhafiyet_kodu], $this->xml_ns['cbc']);
                }
                $TaxScheme = $TaxCategory->addChild('TaxScheme', null, $this->xml_ns['cac']);
                $TaxScheme->addChild('Name', 'KDV GERCEK', $this->xml_ns['cbc']);
                $TaxScheme->addChild('TaxTypeCode', '0015', $this->xml_ns['cbc']);

                $LegalMonetaryTotal  = $fatura_xml->addChild('LegalMonetaryTotal', null, $this->xml_ns['cac']);
                $LineExtensionAmount = $LegalMonetaryTotal->addChild('LineExtensionAmount', $fatura_toplam_tutar, $this->xml_ns['cbc']);
                $LineExtensionAmount->addAttribute('currencyID', $para_birimi);
                $TaxExclusiveAmount = $LegalMonetaryTotal->addChild('TaxExclusiveAmount', $fatura_toplam_tutar, $this->xml_ns['cbc']);
                $TaxExclusiveAmount->addAttribute('currencyID', $para_birimi);
                $TaxInclusiveAmount = $LegalMonetaryTotal->addChild('TaxInclusiveAmount', $fatura_genel_toplam, $this->xml_ns['cbc']);
                $TaxInclusiveAmount->addAttribute('currencyID', $para_birimi);
                $AllowanceTotalAmount = $LegalMonetaryTotal->addChild('AllowanceTotalAmount', $fatura_indirim_tutari, $this->xml_ns['cbc']);
                $AllowanceTotalAmount->addAttribute('currencyID', $para_birimi);
                $AllowanceTotalAmount = $LegalMonetaryTotal->addChild('ChargeTotalAmount', '0', $this->xml_ns['cbc']);
                $AllowanceTotalAmount->addAttribute('currencyID', $para_birimi);
                $PayableAmount = $LegalMonetaryTotal->addChild('PayableAmount', $fatura_genel_toplam, $this->xml_ns['cbc']);
                $PayableAmount->addAttribute('currencyID', $para_birimi);

                if($urunler != null){
                    foreach($urunler as $id => $urun){

                        $urun_adi            = $urun['urun_adi'];
                        $urun_adet           = $urun['urun_adet'];
                        $urun_indirim_tutari = $urun['urun_indirim_tutari'] ?? 0;
                        $urun_birim_fiyat    = $urun['urun_birim_fiyat'];
                        $urun_kdv_orani      = $urun['urun_kdv_orani'] ?? $fatura_kdv_orani;
                        $urun_kdv_tutar      = (($urun['urun_birim_fiyat'] * $urun_adet) - $urun_indirim_tutari) * ($urun_kdv_orani / 100);
                        $urun_indirim_orani  = number_format(($urun_indirim_tutari * 100) / ($urun['urun_birim_fiyat'] * $urun_adet), 0);
                        $urun_aciklama       = $urun['urun_aciklama'] ?? '';
                        $urun_notu           = $urun['urun_not'] ?? '';

                        $InvoiceLine = $fatura_xml->addChild('InvoiceLine', null, $this->xml_ns['cac']);
                        $InvoiceLine->addChild('ID', ($id + 1), $this->xml_ns['cbc']);
                        $InvoiceLine->addChild('Note', $urun_notu, $this->xml_ns['cbc']);

                        $InvoicedQuantity = $InvoiceLine->addChild('InvoicedQuantity', $urun_adet, $this->xml_ns['cbc']);
                        $InvoicedQuantity->addAttribute('unitCode', 'NIU');

                        $LineExtensionAmount = $InvoiceLine->addChild('LineExtensionAmount', ($urun_birim_fiyat * $urun_adet) - $urun_indirim_tutari, $this->xml_ns['cbc']);
                        $LineExtensionAmount->addAttribute('currencyID', $para_birimi);

                        if(!empty($urun_indirim_tutari) and $urun_indirim_tutari > 0){

                            $AllowanceCharge = $InvoiceLine->addChild('AllowanceCharge', null, $this->xml_ns['cac']);
                            $AllowanceCharge->addChild('ChargeIndicator', 'false', $this->xml_ns['cbc']);
                            $AllowanceCharge->addChild('AllowanceChargeReason', '%'.$urun_indirim_orani, $this->xml_ns['cbc']);
                            $AllowanceCharge->addChild('MultiplierFactorNumeric', ($urun_indirim_orani / 100), $this->xml_ns['cbc']);

                            $Amount = $AllowanceCharge->addChild('Amount', $urun_indirim_tutari, $this->xml_ns['cbc']);
                            $Amount->addAttribute('currencyID', $para_birimi);

                            $BaseAmount = $AllowanceCharge->addChild('BaseAmount', '1000', $this->xml_ns['cbc']);
                            $BaseAmount->addAttribute('currencyID', $para_birimi);

                        }

                        $TaxTotal = $InvoiceLine->addChild('TaxTotal', null, $this->xml_ns['cac']);

                        $TaxAmount = $TaxTotal->addChild('TaxAmount', $urun_kdv_tutar, $this->xml_ns['cbc']);
                        $TaxAmount->addAttribute('currencyID', $para_birimi);

                        $TaxSubtotal = $TaxTotal->addChild('TaxSubtotal', null, $this->xml_ns['cac']);

                        $TaxableAmount = $TaxSubtotal->addChild('TaxableAmount', ($urun_birim_fiyat * $urun_adet) - $urun_indirim_tutari, $this->xml_ns['cbc']);
                        $TaxableAmount->addAttribute('currencyID', $para_birimi);

                        $TaxAmount2 = $TaxSubtotal->addChild('TaxAmount', $urun_kdv_tutar, $this->xml_ns['cbc']);
                        $TaxAmount2->addAttribute('currencyID', $para_birimi);

                        $TaxSubtotal->addChild('Percent', $urun_kdv_orani, $this->xml_ns['cbc']);

                        $TaxCategory = $TaxSubtotal->addChild('TaxCategory', null, $this->xml_ns['cac']);

                        if(isset($kdv_muhafiyet_kodu) and $kdv_muhafiyet_kodu != null){
                            $TaxCategory->addChild('TaxExemptionReasonCode', $kdv_muhafiyet_kodu, $this->xml_ns['cbc']);
                            $TaxCategory->addChild('TaxExemptionReason', $this->kdv_muhafiyet[$kdv_muhafiyet_kodu], $this->xml_ns['cbc']);
                        }

                        $TaxScheme = $TaxCategory->addChild('TaxScheme', null, $this->xml_ns['cac']);
                        $TaxScheme->addChild('Name', 'KDV GERÇEK', $this->xml_ns['cbc']);
                        $TaxScheme->addChild('TaxTypeCode', '0015', $this->xml_ns['cbc']);

                        $Item = $InvoiceLine->addChild('Item', null, $this->xml_ns['cac']);
                        $Item->addChild('Description', $urun_aciklama, $this->xml_ns['cbc']);
                        $Item->addChild('Name', $urun_adi, $this->xml_ns['cbc']);
                        $SellersItemIdentification = $Item->addChild('SellersItemIdentification', null, $this->xml_ns['cac']);
                        $SellersItemIdentification->addChild('ID', $urun_adi, $this->xml_ns["cbc"]);

                        $Price       = $InvoiceLine->addChild('Price', null, $this->xml_ns['cac']);
                        $PriceAmount = $Price->addChild('PriceAmount', $urun_birim_fiyat, $this->xml_ns['cbc']);
                        $PriceAmount->addAttribute('currencyID', $para_birimi);

                    }

                }

                return $fatura_xml->asXML();

            }catch(ElogoHata $err){
                echo $err->getMessage();
            }

        }

        public function benim_firmam_xml(){

            $benim_firmam_firma_adi       = $this->benim_firmam->getFirmaAdi();
            $benim_firmam_vergi_no        = $this->benim_firmam->getVergiNo();
            $benim_firmam_tc_kimlik_no    = $this->benim_firmam->getTcKimlikNo();
            $benim_firmam_vergi_dairesi   = $this->benim_firmam->getVergiDairesi();
            $benim_firmam_ticari_sicil_no = $this->benim_firmam->getTicariSicilNo();
            $benim_firmam_mersis_no       = $this->benim_firmam->getMersisNo();
            $benim_firmam_websitesi       = $this->benim_firmam->getWebsitesi();
            $benim_firmam_telefon         = $this->benim_firmam->getTelefon();
            $benim_firmam_email           = $this->benim_firmam->getEmail();
            $benim_firmam_fax             = $this->benim_firmam->getFax();
            $benim_firmam_acik_adres      = $this->benim_firmam->getAcikAdres();
            $benim_firmam_bina_adi        = $this->benim_firmam->getBinaAdi();
            $benim_firmam_bina_no         = $this->benim_firmam->getBinaNo();
            $benim_firmam_il              = $this->benim_firmam->getIl();
            $benim_firmam_ilce            = $this->benim_firmam->getIlce();
            $benim_firmam_posta_kodu      = $this->benim_firmam->getPostaKodu();
            $benim_firmam_ulke            = $this->benim_firmam->getUlke();
            $benim_firmam_ulke_kodu       = $this->benim_firmam->getUlkeKodu();
            $benim_firmam_yetkili_adi     = $this->benim_firmam->getYetkiliAdi();
            $benim_firmam_yetkili_soyadi  = $this->benim_firmam->getYetkiliSoyadi();

            $AccountingSupplierParty = $this->fatura_xml->addChild('AccountingSupplierParty', null, $this->xml_ns['cac']);
            $Party                   = $AccountingSupplierParty->addChild('Party', null, $this->xml_ns['cac']);
            $Party->addChild('WebsiteURI', $benim_firmam_websitesi, $this->xml_ns['cbc']);

            $PartyIdentification = $Party->addChild('PartyIdentification', null, $this->xml_ns['cac']);
            if(!empty($benim_firmam_vergi_no)){
                $ID = $PartyIdentification->addChild('ID', $benim_firmam_vergi_no, $this->xml_ns['cbc']);
                $ID->addAttribute('schemeID', 'VKN');
            }
            else{
                $ID = $PartyIdentification->addChild('ID', $benim_firmam_tc_kimlik_no, $this->xml_ns['cbc']);
                $ID->addAttribute('schemeID', 'TCKN');
            }

            $PartyIdentification = $Party->addChild('PartyIdentification', null, $this->xml_ns['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $benim_firmam_ticari_sicil_no, $this->xml_ns['cbc']);
            $ID->addAttribute('schemeID', 'TICARETSICILNO');

            $PartyIdentification = $Party->addChild('PartyIdentification', null, $this->xml_ns['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $benim_firmam_mersis_no, $this->xml_ns['cbc']);
            $ID->addAttribute('schemeID', 'MERSISNO');

            $PartyName = $Party->addChild('PartyName', null, $this->xml_ns['cac']);
            $PartyName->addChild('Name', $benim_firmam_firma_adi, $this->xml_ns['cbc']);

            $PostalAddress = $Party->addChild('PostalAddress', null, $this->xml_ns['cac']);
            $PostalAddress->addChild('StreetName', $benim_firmam_acik_adres, $this->xml_ns['cbc']);
            $PostalAddress->addChild('BuildingName', $benim_firmam_bina_adi, $this->xml_ns['cbc']);
            $PostalAddress->addChild('BuildingNumber', $benim_firmam_bina_no, $this->xml_ns['cbc']);
            $PostalAddress->addChild('CitySubdivisionName', $benim_firmam_il, $this->xml_ns['cbc']);
            $PostalAddress->addChild('CityName', $benim_firmam_ilce, $this->xml_ns['cbc']);
            $PostalAddress->addChild('PostalZone', $benim_firmam_posta_kodu, $this->xml_ns['cbc']);

            $Country = $PostalAddress->addChild('Country', null, $this->xml_ns['cac']);
            $Country->addChild('IdentificationCode', $benim_firmam_ulke_kodu, $this->xml_ns["cbc"]);
            $Country->addChild('Name', $benim_firmam_ulke, $this->xml_ns['cbc']);

            $PartyTaxScheme = $Party->addChild('PartyTaxScheme', null, $this->xml_ns['cac']);
            $TaxScheme      = $PartyTaxScheme->addChild('TaxScheme', null, $this->xml_ns['cac']);
            $TaxScheme->addChild('Name', $benim_firmam_vergi_dairesi, $this->xml_ns['cbc']);

            $Contact = $Party->addChild('Contact', null, $this->xml_ns['cac']);
            $Contact->addChild('Telephone', $benim_firmam_telefon, $this->xml_ns['cbc']);
            $Contact->addChild('Telefax', $benim_firmam_fax, $this->xml_ns['cbc']);
            $Contact->addChild('ElectronicMail', $benim_firmam_email, $this->xml_ns['cbc']);

            $Person = $Party->addChild('Person');
            $Person->addChild('FirstName', $benim_firmam_yetkili_adi, $this->xml_ns['cbc']);
            $Person->addChild('FamilyName', $benim_firmam_yetkili_soyadi, $this->xml_ns['cbc']);

            return $this->fatura_xml;
        }

        public function musteri_firmasi_xml(){

            $musteri_firma_adi       = $this->musteri_firmasi->getFirmaAdi();
            $musteri_vergi_no        = $this->musteri_firmasi->getVergiNo();
            $musteri_tc_kimlik_no    = $this->musteri_firmasi->getTcKimlikNo();
            $musteri_vergi_dairesi   = $this->musteri_firmasi->getVergiDairesi();
            $musteri_ticari_sicil_no = $this->musteri_firmasi->getTicariSicilNo();
            $musteri_mersis_no       = $this->musteri_firmasi->getMersisNo();
            $musteri_websitesi       = $this->musteri_firmasi->getWebsitesi();
            $musteri_telefon         = $this->musteri_firmasi->getTelefon();
            $musteri_email           = $this->musteri_firmasi->getEmail();
            $musteri_fax             = $this->musteri_firmasi->getFax();
            $musteri_acik_adres      = $this->musteri_firmasi->getAcikAdres();
            $musteri_bina_adi        = $this->musteri_firmasi->getBinaAdi();
            $musteri_bina_no         = $this->musteri_firmasi->getBinaNo();
            $musteri_il              = $this->musteri_firmasi->getIl();
            $musteri_ilce            = $this->musteri_firmasi->getIlce();
            $musteri_posta_kodu      = $this->musteri_firmasi->getPostaKodu();
            $musteri_ulke            = $this->musteri_firmasi->getUlke();
            $musteri_ulke_kodu       = $this->musteri_firmasi->getUlkeKodu();
            $musteri_yetkili_adi     = $this->musteri_firmasi->getYetkiliAdi();
            $musteri_yetkili_soyadi  = $this->musteri_firmasi->getYetkiliSoyadi();


            $AccountingSupplierParty = $this->fatura_xml->addChild('AccountingCustomerParty', null, $this->xml_ns['cac']);
            $Party                   = $AccountingSupplierParty->addChild('Party', null, $this->xml_ns['cac']);

            $Party->addChild('WebsiteURI', $musteri_websitesi, $this->xml_ns['cbc']);

            $PartyIdentification = $Party->addChild('PartyIdentification', null, $this->xml_ns['cac']);
            if(!empty($musteri_vergi_no)){
                $ID = $PartyIdentification->addChild('ID', $musteri_vergi_no, $this->xml_ns['cbc']);
                $ID->addAttribute('schemeID', 'VKN');
            }
            else{
                $ID = $PartyIdentification->addChild('ID', $musteri_tc_kimlik_no, $this->xml_ns['cbc']);
                $ID->addAttribute('schemeID', 'TCKN');
            }

            $PartyIdentification = $Party->addChild('PartyIdentification', null, $this->xml_ns['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $musteri_ticari_sicil_no, $this->xml_ns['cbc']);
            $ID->addAttribute('schemeID', 'TICARETSICILNO');

            $PartyIdentification = $Party->addChild('PartyIdentification', null, $this->xml_ns['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $musteri_mersis_no, $this->xml_ns['cbc']);
            $ID->addAttribute('schemeID', 'MERSISNO');

            $PartyName = $Party->addChild('PartyName', null, $this->xml_ns['cac']);
            $PartyName->addChild('Name', $musteri_firma_adi, $this->xml_ns['cbc']);

            $PostalAddress = $Party->addChild('PostalAddress', null, $this->xml_ns['cac']);
            $PostalAddress->addChild('StreetName', $musteri_acik_adres, $this->xml_ns['cbc']);
            $PostalAddress->addChild('BuildingName', $musteri_bina_adi, $this->xml_ns['cbc']);
            $PostalAddress->addChild('BuildingNumber', $musteri_bina_no, $this->xml_ns['cbc']);
            $PostalAddress->addChild('CitySubdivisionName', $musteri_il, $this->xml_ns['cbc']);
            $PostalAddress->addChild('CityName', $musteri_ilce, $this->xml_ns['cbc']);
            $PostalAddress->addChild('PostalZone', $musteri_posta_kodu, $this->xml_ns['cbc']);

            $Country = $PostalAddress->addChild('Country', null, $this->xml_ns['cac']);
            $Country->addChild('IdentificationCode', $musteri_ulke_kodu, $this->xml_ns["cbc"]);
            $Country->addChild('Name', $musteri_ulke, $this->xml_ns['cbc']);

            $PartyTaxScheme = $Party->addChild('PartyTaxScheme', null, $this->xml_ns['cac']);
            $TaxScheme      = $PartyTaxScheme->addChild('TaxScheme', null, $this->xml_ns['cac']);
            $TaxScheme->addChild('Name', $musteri_vergi_no, $this->xml_ns['cbc']);

            $Contact = $Party->addChild('Contact', null, $this->xml_ns['cac']);
            $Contact->addChild('Telephone', $musteri_telefon, $this->xml_ns['cbc']);
            $Contact->addChild('Telefax', $musteri_fax, $this->xml_ns['cbc']);
            $Contact->addChild('ElectronicMail', $musteri_email, $this->xml_ns['cbc']);

            $Person = $Party->addChild('Person');
            $Person->addChild('FirstName', $musteri_yetkili_adi, $this->xml_ns['cbc']);
            $Person->addChild('FamilyName', $musteri_yetkili_soyadi, $this->xml_ns['cbc']);

            return $this->fatura_xml;
        }

        private function get_ticari_fatura_xml(){

            $nodes = [
                'xsi:schemaLocation' => 'urn:oasis:names:specification:ubl:schema:xsd:Invoice-2 UBL-Invoice-2.1.xsd',
                'xmlns'              => 'urn:oasis:names:specification:ubl:schema:xsd:Invoice-2',
                'xmlns:cac'          => 'urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2',
                'xmlns:cbc'          => 'urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2',
                'xmlns:ccts'         => 'urn:un:unece:uncefact:documentation:2',
                'xmlns:ext'          => 'urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2',
                'xmlns:qdt'          => 'urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2',
                'xmlns:ubltr'        => 'urn:oasis:names:specification:ubl:schema:xsd:TurkishCustomizationExtensionComponents',
                'xmlns:udt'          => 'urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2',
                'xmlns:xsi'          => 'http://www.w3.org/2001/XMLSchema-instance',
            ];

            $xw = xmlwriter_open_memory();
            xmlwriter_start_element($xw, 'Invoice');
            foreach($nodes as $node_name => $node_value){
                xmlwriter_start_attribute($xw, $node_name);
                xmlwriter_text($xw, $node_value);
                xmlwriter_end_attribute($xw);
            }
            //            xmlwriter_write_comment($xw, '');
            xmlwriter_end_element($xw);

            return xmlwriter_output_memory($xw);

        }

        private function get_earsiv_fatura_xml(){

            $nodes = [
                "xmlns"              => "urn:oasis:names:specification:ubl:schema:xsd:Invoice-2",
                "xmlns:cac"          => "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
                "xmlns:cbc"          => "urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2",
                "xmlns:ccts"         => "urn:un:unece:uncefact:documentation:2",
                "xmlns:ext"          => "urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2",
                "xmlns:qdt"          => "urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2",
                "xmlns:ubltr"        => "urn:oasis:names:specification:ubl:schema:xsd:TurkishCustomizationExtensionComponents",
                "xmlns:udt"          => "urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2",
                "xmlns:xsi"          => "http://www.w3.org/2001/XMLSchema-instance",
                "xsi:schemaLocation" => "urn:oasis:names:specification:ubl:schema:xsd:Invoice-2 UBL-Invoice-2.1.xsd",
            ];

            $xw = xmlwriter_open_memory();
            xmlwriter_start_element($xw, 'Invoice');
            foreach($nodes as $node_name => $node_value){
                xmlwriter_start_attribute($xw, $node_name);
                xmlwriter_text($xw, $node_value);
                xmlwriter_end_attribute($xw);
            }
            xmlwriter_end_element($xw);

            return xmlwriter_output_memory($xw);

        }

        private function ozel_paremetre($parametreler){
            if($parametreler != null){
                foreach($parametreler as $kod => $deger){
                    $this->fatura_xml->addChild($kod, $deger, $this->xml_ns['cbc']);
                }
                return $this->fatura_xml;
            }
            return $this->fatura_xml;
        }
    }