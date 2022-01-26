<?php
    
    namespace elogo_api;
    
    use ELogo\API\ELogoClient;
    use ELogo\Utils\Base64BinaryData;
    use ELogo\Utils\DocumentType;
    use ELogo\Utils\Login;
    use ZipArchive;
    
    class elogo_api{
        
        public $login            = null;
        public $service          = null;
        public $session_id       = null;
        public $my_company       = null;
        public $customer_company = null;
        public $invoice          = null;
        public $efatura_xslt     = (__DIR__).'/invoice_templates/CB9E5959-B6F9-4B28-99A8-A80006B3DE6B.xslt';
        public $earsiv_xslt      = (__DIR__).'/invoice_templates/7141796B-2A35-4C87-9413-DC1867DDC8CC.xslt';
        public $xml_path         = (__DIR__).'/';
        public $zip_path         = (__DIR__).'/';
        public $invoce_prefix    = 'HSN';
        
        public function __construct($username, $password, $test = false){
            
            $login = new Login();
            $login->setUserName($username);
            $login->setPassWord($password);
            
            $service = new ELogoClient($test);
            $service->Login($login);
            
            $this->login      = $login;
            $this->service    = $service;
            $this->session_id = $service->sessionID;
            
            $this->xml_path = sys_get_temp_dir().'/';
            $this->zip_path = sys_get_temp_dir().'/';
            
        }
        
        public function get_document_info($ettn = null, $document_type = 'EINVOICE'){
            
            try{
                $result = $this->service->GetDocumentStatus(['DOCUMENTTYPE='.$document_type], $ettn);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function get_documents_list($start_date = null, $end_date = null, $document_list_type = 'IN', $document_type = 'EINVOICEDETAIL'){
            
            try{
                $start_date = $start_date ?? date('Y-m-d', strtotime('first day of this month'));
                $end_date   = $end_date ?? date('Y-m-d', strtotime('last day of this month'));
                
                $result = $this->service->GetDocumentList([
                    'DOCUMENTTYPE='.$document_type,
                    'BEGINDATE='.$start_date,
                    'ENDDATE='.$end_date,
                    'OPTYPE='.($document_list_type == 'IN' ? '2' : '1'),
                    'DATEBY=1',
                ]);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function get_documents($document_type = 'EINVOICE'){
            
            try{
                $result = $this->service->GetDocument(['DOCUMENTTYPE='.$document_type,]);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function get_documents_data($invoice_number = null, $document_type = 'EINVOICE', $format = 'PDF', $is_cancel = false){
            
            try{
                $result = $this->service->GetDocumentData([
                    'DOCUMENTTYPE='.$document_type,
                    'DATAFORMAT='.$format,
                    'ISCANCEL='.$is_cancel ? '1' : '0',
                ], $invoice_number);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function unzip($name = null, $binary = null){
            if($binary != null){
                $binary = base64_decode($binary);
                
                $file_full_name = tempnam(sys_get_temp_dir(), 'pdf');
                $file_temp_path = sys_get_temp_dir();
                file_put_contents($file_full_name, $binary);
                
                $zip = new ZipArchive;
                if($zip->open($file_full_name) === TRUE){
                    $zip->extractTo($file_temp_path);
                    $zip->close();
                    return file_get_contents($file_temp_path.'/'.$name.'.pdf');
                }
                
            }
            return false;
        }
        
        public function get_company_info($vkn_tcn = null){
            
            $param = [];
            if(!is_array($vkn_tcn) and is_numeric($vkn_tcn)){
                $param[] = $vkn_tcn;
            }
            else{
                $param = $vkn_tcn;
            }
            $user = $this->service->CheckGibUser($param);
            return $user;
            
        }
        
        public function set_my_company($company = []){
            $this->my_company = $company;
        }
        
        public function set_customer_company($company = []){
            $this->customer_company = $company;
        }
        
        public function send_einvoice($ettn = null, $invoice_number = null, $note = '', $date = null, $type = 'SATIS'){
            
            $info = [
                'fatura_id'      => $invoice_number ?? $this->create_invoice_number(),
                'ettn'           => $ettn ?? $this->session_id,
                'profil_id'      => 'TICARIFATURA',
                'fatura_tasarim' => [
                    'efatura' => $this->efatura_xslt,
                    'earsiv'  => $this->earsiv_xslt,
                ],
                'fatura_kesen'   => $this->my_company,
                'musteri'        => $this->customer_company,
                'fatura'         => $this->invoice,
            ];
            
            $xml      = $this->create_invoice_xml($info);
            $zip_data = $this->create_zip($xml);
            
            $docType    = new DocumentType();
            $binaryData = new Base64BinaryData();
            $binaryData->setValue($zip_data['zip_data']);
            
            $docType->setBinaryData($binaryData);
            $docType->setCurrentDate(date('c'));
            $docType->setFileName($zip_data['zip_name']);
            $docType->setHash(md5($zip_data['zip_data']));
            
            $eLogoParamList   = ['SIGNED=0'];
            $eLogoParamList[] = "DOCUMENTTYPE=EINVOICE";
            
            try{
                $result = $this->service->SendDocument($eLogoParamList, $docType);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function send_earchive($ettn = null, $invoice_number = null){
            
            $info = [
                'fatura_id'      => $invoice_number ?? $this->create_invoice_number(),
                'ettn'           => $ettn ?? $this->session_id,
                'profil_id'      => 'EARSIVFATURA',
                'fatura_tasarim' => [
                    'efatura' => $this->efatura_xslt,
                    'earsiv'  => $this->earsiv_xslt,
                ],
                'fatura_kesen'   => $this->my_company,
                'musteri'        => $this->customer_company,
                'fatura'         => $this->invoice,
            ];
            
            $xml      = $this->create_invoice_xml($info);
            $zip_data = $this->create_zip($xml);
            
            $docType    = new DocumentType();
            $binaryData = new Base64BinaryData();
            $binaryData->setValue($zip_data['zip_data']);
            
            $docType->setBinaryData($binaryData);
            $docType->setCurrentDate(date('c'));
            $docType->setFileName($zip_data['zip_name']);
            $docType->setHash(md5($zip_data['zip_data']));
            
            $eLogoParamList   = ['SIGNED=0'];
            $eLogoParamList[] = "DOCUMENTTYPE=EARCHIVE";
            
            try{
                $result = $this->service->SendDocument($eLogoParamList, $docType);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function cancel_earchive($invoice_number = null, $ettn = null){
            
            $docType = new DocumentType();
            
            $eLogoParamList   = [];
            $eLogoParamList[] = "DOCUMENTTYPE=CANCELEARCHIVEINVOICE";
            $eLogoParamList[] = "UUID=".$ettn;
            $eLogoParamList[] = "ELEMENTID=".$invoice_number;
            
            try{
                $result = $this->service->SendDocument($eLogoParamList, $docType);
                return [
                    'status'   => 'success',
                    'message'  => $result,
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            catch(\Exception $err){
                return [
                    'status'   => 'danger',
                    'message'  => $err->getMessage(),
                    'request'  => $this->service->getLastRequest(),
                    'response' => $this->service->getLastResponse(),
                ];
            }
            
        }
        
        public function create_invoice_number($prefix = null, $number = 0){
            $prefix = mb_substr($prefix ?? $this->invoce_prefix, 0, 3);
            if($number == 0){
                return $prefix.date('Y').rand(100000000, 999999999);
            }
            else{
                return $prefix.date('Y').str_pad($number, 9, "0", STR_PAD_LEFT);
            }
        }
        
        public function get_sample_invoice_array(){
            return [
                'not'            => 200,
                //'fatura_id'      => 'CEM'.date('Y').rand(111111111, 999999999),
                'fatura_id'      => 'CEM2021626431506',
                //'ettn'           => $servis->sessionID,
                'ettn'           => '10f3dee3-d40e-4197-8f06-79aa4cdae38e',
                'fatura_tarihi'  => '2021-05-08',
                //2018-10-10
                'fatura_tip'     => 'SATIS',
                //IADE,TEVKIFATIADE,IHRACKAYITLI,ISTISNA,OZELMATRAH,SATIS,TEVKIFAT,SGK
                'profil_id'      => 'TICARIFATURA',
                //EARSIVFATURA TICARIFATURA
                'fatura_tasarim' => [
                    'efatura' => (__DIR__).'/invoice_templates/CB9E5959-B6F9-4B28-99A8-A80006B3DE6B.xslt',
                    'earsiv'  => (__DIR__).'/invoice_templates/7141796B-2A35-4C87-9413-DC1867DDC8CC.xslt',
                    //'efatura' => (__DIR__).'/invoice_templates/CB9E5959-B6F9-4B28-99A8-A80006B3DE6B.xslt',
                    //'earsiv'  => (__DIR__).'/invoice_templates/test-arsiv.xslt',
                ],
                'fatura_kesen'   => [
                    'websitesi'       => 'www.setrow.com',
                    'ticari_sicil_no' => '744820',
                    'vergi_no'        => '8360431191',
                    'vergi_dairesi'   => 'Kozyatağı V.D',
                    'mersis_no'       => '0836 0431 1910 0028',
                    'unvan'           => 'Teknolog Bilgi Teknolojileri ve Sistemleri A.Ş.',
                    'tel'             => '0312 231 66 35',
                    'mail'            => 'bulten@setrow.com',
                    'adres'           => [
                        'acik_adres'   => 'İçerenköy Mah. Çayır Cad.',
                        'bina_adi'     => 'Özce Center',
                        'bina_no'      => '3 Kat:5',
                        'mahalle_ilce' => 'İçerenköy/Ataşehir',
                        'il'           => 'İstanbul',
                        'posta_kodu'   => '34752',
                        'ulke'         => 'Türkiye',
                        'ulke_kodu'    => 'TR',
                    ],
                ],
                'musteri'        => [
                    'yetkili_adi'    => 'Adem',
                    'yetkili_soyadi' => 'Çelik',
                    'unvan'          => 'Adem Çelik Hastane Hizmetleri Ticaret Limited ŞTİ',
                    'websitesi'      => '',
                    'firma_turu'     => 'firma',
                    'vergi_no_tckn'  => '6090408038',
                    'vergi_dairesi'  => 'Büyükçekmece',
                    'tel'            => '4441060',
                    'fax'            => '4441060',
                    'email'          => 'mustafa@ozelbeykenthastanesi.com',
                    'adres'          => [
                        'acik_adres'   => 'İçerenköy Mah. Çayır Cad.',
                        'bina_adi'     => 'Özce Center',
                        'bina_no'      => '3 Kat:5',
                        'mahalle_ilce' => 'İçerenköy/Ataşehir',
                        'il'           => 'İstanbul',
                        'posta_kodu'   => '34752',
                        'ulke'         => 'Türkiye',
                        'ulke_kodu'    => 'TR',
                    ],
                ],
                'fatura'         => [
                    'urun_hizmet'        => [
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
                    'genel_toplam'       => 1180.00,
                    'toplam_tutar'       => 1000.00,
                    'kdv_tutar'          => 180.00,
                    'kdv_oran'           => 18.00,
                    'kdv_muafiyet_kodu' => 223,
                    'para_birimi'        => 'TRY',
                    'kur_fiyati'         => "8.5",
                    'fatura_tip'         => 'ISTISNA',
                    'fatura_tarihi'      => date('Y-m-d'),
                    //'iptal'              => false,
                ],
            ];
        }
        
        private function create_invoice_xml($p = []){
            
            $xmlNs = [
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
            
            $kdv_muhafiyet = [
                "223" => "Geçici 20/1 Teknoloji Geliştirme Bölgelerinde Yapılan İşlemler",
                "351" => "KDV - İstisna Olmayan Diğer",
                "302" => "11/1-a Hizmet İhracatı",
            ];
            
            $xml_type = [
                'TICARIFATURA' => '<Invoice xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2 UBL-Invoice-2.1.xsd" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:ubltr="urn:oasis:names:specification:ubl:schema:xsd:TurkishCustomizationExtensionComponents" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"></Invoice>',
                'EARSIVFATURA' => '<Invoice xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts-cct="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:n0="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:udt="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" xmlns:xades="http://uri.etsi.org/01903/v1.3.2#" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2 UBL-Invoice-2.1.xsd"></Invoice>',
            ];
            
            $xml_string = trim('<?xml version="1.0" encoding="utf-8"?>'.$xml_type[$p['profil_id']]);
            $Invoice    = new \SimpleXMLElement($xml_string);
            
            $Invoice->addChild('UBLVersionID', '2.1', $xmlNs['cbc']);
            $Invoice->addChild('CustomizationID', 'TR1.2', $xmlNs['cbc']);
            $Invoice->addChild('ProfileID', $p['profil_id'], $xmlNs['cbc']);
            $Invoice->addChild('ID', $p['fatura_id'], $xmlNs['cbc']);
            $Invoice->addChild('CopyIndicator', 'false', $xmlNs['cbc']);
            $Invoice->addChild('UUID', $p['ettn'], $xmlNs['cbc']);
            $Invoice->addChild('IssueDate', $p['fatura']['fatura_tarihi'], $xmlNs['cbc']);
            $Invoice->addChild('IssueTime', date('H:i:s'), $xmlNs['cbc']);
            $Invoice->addChild('InvoiceTypeCode', $p['fatura']['fatura_tip'] ?? 'SATIS', $xmlNs['cbc']);
            $Invoice->addChild('Note', $p['fatura']['not'] ?? '', $xmlNs['cbc']);
            
            $Invoice->addChild('DocumentCurrencyCode', $p['fatura']['para_birimi'], $xmlNs['cbc']);
            $Invoice->addChild('TaxCurrencyCode', $p['fatura']['para_birimi'], $xmlNs['cbc']);
            $Invoice->addChild('PaymentCurrencyCode', $p['fatura']['para_birimi'], $xmlNs['cbc']);
            $Invoice->addChild('AccountingCost', null, $xmlNs['cbc']);
            $Invoice->addChild('LineCountNumeric', '1', $xmlNs['cbc']);
            
            if($p['profil_id'] == 'TICARIFATURA'){
            
            }
            else if($p['profil_id'] == 'EARSIVFATURA'){
                
                $AdditionalDocumentReference = $Invoice->addChild('AdditionalDocumentReference', null, $xmlNs['cac']);
                $AdditionalDocumentReference->addChild('ID', 'gonderimSekli', $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('IssueDate', $p['fatura']['fatura_tarihi'], $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('DocumentType', 'ELEKTRONIK', $xmlNs["cbc"]);
                
                $AdditionalDocumentReference = $Invoice->addChild('AdditionalDocumentReference', null, $xmlNs['cac']);
                $AdditionalDocumentReference->addChild('ID', 'EINVOICE', $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('IssueDate', $p['fatura']['fatura_tarihi'] ?? date('Y-m-d'), $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('DocumentType', '2', $xmlNs["cbc"]);
                
                $AdditionalDocumentReference = $Invoice->addChild('AdditionalDocumentReference', null, $xmlNs['cac']);
                $AdditionalDocumentReference->addChild('ID', 'duzenlemeTarihi', $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('IssueDate', $p['fatura']['fatura_tarihi'] ?? date('Y-m-d'), $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('DocumentType', date("H:i:s"), $xmlNs["cbc"]);
                
            }
            
            if(isset($p['fatura']['iptal']) and $p['fatura']['iptal'] === true){
                $AdditionalDocumentReference = $Invoice->addChild('AdditionalDocumentReference', null, $xmlNs['cac']);
                $AdditionalDocumentReference->addChild('ID', 'faturaIptal', $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('IssueDate', date("Y-m-d"), $xmlNs["cbc"]);
                $AdditionalDocumentReference->addChild('DocumentType', '1', $xmlNs["cbc"]);
            }
            
            $tasarim_id  = ($p['profil_id'] == "EARSIVFATURA") ? '7141796B-2A35-4C87-9413-DC1867DDC8CC' : 'CB9E5959-B6F9-4B28-99A8-A80006B3DE6B';
            $tasarim     = ($p['profil_id'] == "EARSIVFATURA") ? $p['fatura_tasarim']['earsiv'] : $p['fatura_tasarim']['efatura'];
            $tasarim_adi = pathinfo($tasarim);
            $tasarim_adi = $tasarim_adi['basename'];
            $xslt        = base64_encode(file_get_contents($tasarim));
            
            $AdditionalDocumentReference = $Invoice->addChild('AdditionalDocumentReference', null, $xmlNs['cac']);
            $AdditionalDocumentReference->addChild('ID', $tasarim_id, $xmlNs["cbc"]);
            $AdditionalDocumentReference->addChild('IssueDate', $p['fatura']['fatura_tarihi'], $xmlNs["cbc"]);
            $AdditionalDocumentReference->addChild('DocumentType', 'XSLT', $xmlNs["cbc"]);
            
            $Attachment                   = $AdditionalDocumentReference->addChild('Attachment', null, $xmlNs["cac"]);
            $EmbeddedDocumentBinaryObject = $Attachment->addChild('EmbeddedDocumentBinaryObject', $xslt, $xmlNs["cbc"]);
            $EmbeddedDocumentBinaryObject->addAttribute("characterSetCode", "UTF-8");
            $EmbeddedDocumentBinaryObject->addAttribute("encodingCode", "Base64");
            $EmbeddedDocumentBinaryObject->addAttribute("filename", $tasarim_adi);
            $EmbeddedDocumentBinaryObject->addAttribute("mimeCode", "application/xml");
            
            $AccountingSupplierParty = $Invoice->addChild('AccountingSupplierParty', null, $xmlNs['cac']);
            $Party                   = $AccountingSupplierParty->addChild('Party', null, $xmlNs['cac']);
            $Party->addChild('WebsiteURI', $p['fatura_kesen']['websitesi'], $xmlNs['cbc']);
            
            $PartyIdentification = $Party->addChild('PartyIdentification', null, $xmlNs['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $p['fatura_kesen']['vergi_no'], $xmlNs['cbc']);
            $ID->addAttribute('schemeID', 'VKN');
            
            $PartyIdentification = $Party->addChild('PartyIdentification', null, $xmlNs['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $p['fatura_kesen']['ticari_sicil_no'], $xmlNs['cbc']);
            $ID->addAttribute('schemeID', 'TICARETSICILNO');
            
            $PartyIdentification = $Party->addChild('PartyIdentification', null, $xmlNs['cac']);
            $ID                  = $PartyIdentification->addChild('ID', $p['fatura_kesen']['mersis_no'], $xmlNs['cbc']);
            $ID->addAttribute('schemeID', 'MERSISNO');
            
            $PartyName = $Party->addChild('PartyName', null, $xmlNs['cac']);
            $PartyName->addChild('Name', $p['fatura_kesen']['unvan'], $xmlNs['cbc']);
            
            $PostalAddress = $Party->addChild('PostalAddress', null, $xmlNs['cac']);
            $PostalAddress->addChild('StreetName', $p['fatura_kesen']['adres']['acik_adres'], $xmlNs['cbc']);
            $PostalAddress->addChild('BuildingName', $p['fatura_kesen']['adres']['bina_adi'], $xmlNs['cbc']);
            $PostalAddress->addChild('BuildingNumber', $p['fatura_kesen']['adres']['bina_no'], $xmlNs['cbc']);
            $PostalAddress->addChild('CitySubdivisionName', $p['fatura_kesen']['adres']['mahalle_ilce'], $xmlNs['cbc']);
            $PostalAddress->addChild('CityName', $p['fatura_kesen']['adres']['il'], $xmlNs['cbc']);
            $PostalAddress->addChild('PostalZone', $p['fatura_kesen']['adres']['posta_kodu'], $xmlNs['cbc']);
            
            $Country = $PostalAddress->addChild('Country', null, $xmlNs['cac']);
            $Country->addChild('IdentificationCode', $p['fatura_kesen']['adres']['ulke_kodu'], $xmlNs["cbc"]);
            $Country->addChild('Name', $p['fatura_kesen']['adres']['ulke'], $xmlNs['cbc']);
            
            $PartyTaxScheme = $Party->addChild('PartyTaxScheme', null, $xmlNs['cac']);
            $TaxScheme      = $PartyTaxScheme->addChild('TaxScheme', null, $xmlNs['cac']);
            $TaxScheme->addChild('Name', $p['fatura_kesen']['vergi_dairesi'], $xmlNs['cbc']);
            
            $Contact = $Party->addChild('Contact', null, $xmlNs['cac']);
            $Contact->addChild('Telephone', $p['fatura_kesen']['tel'], $xmlNs['cbc']);
            $Contact->addChild('Telefax', '', $xmlNs['cbc']);
            $Contact->addChild('ElectronicMail', $p['fatura_kesen']['mail'], $xmlNs['cbc']);
            
            $AccountingCustomerParty = $Invoice->addChild('AccountingCustomerParty', null, $xmlNs['cac']);
            $Party                   = $AccountingCustomerParty->addChild('Party', null, $xmlNs['cac']);
            $PartyIdentification     = $Party->addChild('PartyIdentification', null, $xmlNs['cac']);
            $ID                      = $PartyIdentification->addChild('ID', $p['musteri']['vergi_no_tckn'], $xmlNs['cbc']);
            $vkn_tckn                = ($p['musteri']['firma_turu'] == "sahis") ? "TCKN" : "VKN";
            $ID->addAttribute('schemeID', $vkn_tckn);
            
            $PartyName = $Party->addChild('PartyName', null, $xmlNs['cac']);
            $PartyName->addChild('Name', $p['musteri']['unvan'], $xmlNs['cbc']);
            
            $PostalAddress = $Party->addChild('PostalAddress', null, $xmlNs['cac']);
            $PostalAddress->addChild('StreetName', $p['musteri']['adres']['acik_adres'], $xmlNs['cbc']);
            $PostalAddress->addChild('BuildingNumber', $p['musteri']['adres']['bina_no'], $xmlNs['cbc']);
            $PostalAddress->addChild('CitySubdivisionName', $p['musteri']['adres']['mahalle_ilce'], $xmlNs['cbc']);
            $PostalAddress->addChild('CityName', $p['musteri']['adres']['il'], $xmlNs['cbc']);
            $PostalAddress->addChild('PostalZone', $p['musteri']['adres']['posta_kodu'], $xmlNs['cbc']);
            
            $Country = $PostalAddress->addChild('Country', null, $xmlNs['cac']);
            $Country->addChild('IdentificationCode', $p['musteri']['adres']['ulke_kodu'], $xmlNs["cbc"]);
            $Country->addChild('Name', $p['musteri']['adres']['ulke'], $xmlNs['cbc']);
            
            $PartyTaxScheme = $Party->addChild('PartyTaxScheme', null, $xmlNs['cac']);
            $TaxScheme      = $PartyTaxScheme->addChild('TaxScheme', null, $xmlNs['cac']);
            $TaxScheme->addChild('Name', $p['musteri']['vergi_dairesi'], $xmlNs['cbc']);
            
            $Contact = $Party->addChild('Contact', null, $xmlNs['cac']);
            $Contact->addChild('Telephone', $p['musteri']['tel'], $xmlNs['cbc']);
            $Contact->addChild('Telefax', $p['musteri']['fax'], $xmlNs['cbc']);
            $Contact->addChild('ElectronicMail', $p['musteri']['email'], $xmlNs['cbc']);
            
            if($p['musteri']['firma_turu'] == "sahis"){
                $Person = $Party->addChild('Person', null, $xmlNs['cac']);
                $Person->addChild('FirstName', $p['musteri']['yetkili_adi'], $xmlNs['cbc']);
                $Person->addChild('FamilyName', $p['musteri']['yetkili_soyadi'], $xmlNs['cbc']);
            }
            
            if($p['fatura']['kur_fiyati'] != 'TRY'){
                $PricingExchangeRat = $Invoice->addChild('PricingExchangeRate', null, $xmlNs['cac']);
                
                $SourceCurrencyCode = $PricingExchangeRat->addChild('SourceCurrencyCode', $p['fatura']['para_birimi'], $xmlNs['cbc']);
                $SourceCurrencyCode->addAttribute('listAgencyName', 'United Nations Economic Commission for Europe');
                $SourceCurrencyCode->addAttribute('listID', 'ISO 4217 Alpha');
                $SourceCurrencyCode->addAttribute('listName', 'Currency');
                $SourceCurrencyCode->addAttribute('listVersionID', '2001');
                
                $TargetCurrencyCode = $PricingExchangeRat->addChild('TargetCurrencyCode', 'TRY', $xmlNs['cbc']);
                $TargetCurrencyCode->addAttribute('listAgencyName', 'United Nations Economic Commission for Europe');
                $TargetCurrencyCode->addAttribute('listID', 'ISO 4217 Alpha');
                $TargetCurrencyCode->addAttribute('listName', 'Currency');
                $TargetCurrencyCode->addAttribute('listVersionID', '2001');
                
                $PricingExchangeRat->addChild('CalculationRate', $p['fatura']['kur_fiyati'], $xmlNs['cbc']);
            }
            
            $TaxTotal  = $Invoice->addChild('TaxTotal', null, $xmlNs['cac']);
            $TaxAmount = $TaxTotal->addChild('TaxAmount', $p['fatura']['kdv_tutar'], $xmlNs['cbc']);
            $TaxAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            
            $TaxSubtotal   = $TaxTotal->addChild('TaxSubtotal', null, $xmlNs['cac']);
            $TaxableAmount = $TaxSubtotal->addChild('TaxableAmount', $p['fatura']['toplam_tutar'], $xmlNs['cbc']);
            $TaxableAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            $TaxAmount2 = $TaxSubtotal->addChild('TaxAmount', $p['fatura']['kdv_tutar'], $xmlNs['cbc']);
            $TaxAmount2->addAttribute('currencyID', $p['fatura']['para_birimi']);
            $TaxSubtotal->addChild('CalculationSequenceNumeric', '1', $xmlNs['cbc']);
            $TaxSubtotal->addChild('Percent', $p['fatura']['kdv_oran'], $xmlNs['cbc']);
            
            $TaxCategory = $TaxSubtotal->addChild('TaxCategory', null, $xmlNs['cac']);
            if(isset($p['fatura']['kdv_muafiyet_kodu']) and $p['fatura']['kdv_muafiyet_kodu'] != null){
                $TaxCategory->addChild('TaxExemptionReasonCode', $p['fatura']['kdv_muafiyet_kodu'], $xmlNs['cbc']);
                $TaxCategory->addChild('TaxExemptionReason', $kdv_muhafiyet[$p['fatura']['kdv_muafiyet_kodu']], $xmlNs['cbc']);
            }
            $TaxScheme = $TaxCategory->addChild('TaxScheme', null, $xmlNs['cac']);
            $TaxScheme->addChild('Name', 'KDV GERCEK', $xmlNs['cbc']);
            $TaxScheme->addChild('TaxTypeCode', '0015', $xmlNs['cbc']);
            
            $LegalMonetaryTotal  = $Invoice->addChild('LegalMonetaryTotal', null, $xmlNs['cac']);
            $LineExtensionAmount = $LegalMonetaryTotal->addChild('LineExtensionAmount', $p['fatura']['toplam_tutar'], $xmlNs['cbc']);
            $LineExtensionAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            $TaxExclusiveAmount = $LegalMonetaryTotal->addChild('TaxExclusiveAmount', $p['fatura']['toplam_tutar'], $xmlNs['cbc']);
            $TaxExclusiveAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            $TaxInclusiveAmount = $LegalMonetaryTotal->addChild('TaxInclusiveAmount', $p['fatura']['genel_toplam'], $xmlNs['cbc']);
            $TaxInclusiveAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            $AllowanceTotalAmount = $LegalMonetaryTotal->addChild('AllowanceTotalAmount', '0', $xmlNs['cbc']);
            $AllowanceTotalAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            $PayableAmount = $LegalMonetaryTotal->addChild('PayableAmount', $p['fatura']['genel_toplam'], $xmlNs['cbc']);
            $PayableAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
            
            if($p['fatura']['urun_hizmet'] != null){
                foreach($p['fatura']['urun_hizmet'] as $id => $urun){
                    
                    $InvoiceLine = $Invoice->addChild('InvoiceLine', null, $xmlNs['cac']);
                    $InvoiceLine->addChild('ID', ($id + 1), $xmlNs['cbc']);
                    $InvoicedQuantity = $InvoiceLine->addChild('InvoicedQuantity', ($urun['adet'] ?? 1), $xmlNs['cbc']);
                    $InvoicedQuantity->addAttribute('unitCode', 'NIU');
                    $LineExtensionAmount = $InvoiceLine->addChild('LineExtensionAmount', $urun['tutar'], $xmlNs['cbc']);
                    $LineExtensionAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
                    
                    $TaxTotal = $InvoiceLine->addChild('TaxTotal', null, $xmlNs['cac']);
                    
                    $TaxAmount = $TaxTotal->addChild('TaxAmount', $urun['kdv_tutar'], $xmlNs['cbc']);
                    $TaxAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
                    
                    $TaxSubtotal = $TaxTotal->addChild('TaxSubtotal', null, $xmlNs['cac']);
                    
                    $TaxableAmount = $TaxSubtotal->addChild('TaxableAmount', $urun['tutar'], $xmlNs['cbc']);
                    $TaxableAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
                    
                    $TaxAmount2 = $TaxSubtotal->addChild('TaxAmount', $urun['kdv_tutar'], $xmlNs['cbc']);
                    $TaxAmount2->addAttribute('currencyID', $p['fatura']['para_birimi']);
                    
                    $TaxSubtotal->addChild('Percent', $urun['kdv_oran'], $xmlNs['cbc']);
                    
                    $TaxCategory = $TaxSubtotal->addChild('TaxCategory', null, $xmlNs['cac']);
                    
                    if(isset($p['fatura']['kdv_muafiyet_kodu']) and $p['fatura']['kdv_muafiyet_kodu'] != null){
                        $TaxCategory->addChild('TaxExemptionReasonCode', $p['fatura']['kdv_muafiyet_kodu'], $xmlNs['cbc']);
                        $TaxCategory->addChild('TaxExemptionReason', $kdv_muhafiyet[$p['fatura']['kdv_muafiyet_kodu']], $xmlNs['cbc']);
                    }
                    
                    $TaxScheme = $TaxCategory->addChild('TaxScheme', null, $xmlNs['cac']);
                    $TaxScheme->addChild('Name', 'KDV', $xmlNs['cbc']);
                    $TaxScheme->addChild('TaxTypeCode', '0015', $xmlNs['cbc']);
                    
                    $Item = $InvoiceLine->addChild('Item', null, $xmlNs['cac']);
                    $Item->addChild('Description', $urun['hizmet_aciklama'], $xmlNs['cbc']);
                    $Item->addChild('Name', $urun['hizmet_adi'], $xmlNs['cbc']);
                    $SellersItemIdentification = $Item->addChild('SellersItemIdentification', null, $xmlNs['cac']);
                    $SellersItemIdentification->addChild('ID', ($id + 1), $xmlNs["cbc"]);
                    
                    $Price       = $InvoiceLine->addChild('Price', null, $xmlNs['cac']);
                    $PriceAmount = $Price->addChild('PriceAmount', $urun['tutar'], $xmlNs['cbc']);
                    $PriceAmount->addAttribute('currencyID', $p['fatura']['para_birimi']);
                    
                }
                
            }
            
            return $Invoice->asXML();
        }
        
        private function create_zip($xml = null){
            
            $xml_name = $this->session_id.'-xml.xml';
            $xml_path = $this->xml_path.'/'.$xml_name;
            file_put_contents($xml_path, trim($xml));
            
            $zip_name    = $this->session_id.'-fatura.zip';
            $zipArchive  = new ZipArchive();
            $zipFilePath = $this->zip_path.'/'.$zip_name;
            $zipArchive->open($zipFilePath, ZipArchive::CREATE);
            $zipArchive->addFile($xml_path, $xml_name);
            $zipArchive->close();
            $zip = file_get_contents($zipFilePath);
            
            return [
                'xml_name' => $xml_name,
                'zip_name' => $zip_name,
                'zip_data' => $zip,
            ];
            
        }
    }