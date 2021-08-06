<?php
    
    
    namespace ELogo\API;
    
    use ELogo\Utils\Base64BinaryData;
    use ELogo\Utils\document;
    use ELogo\Utils\GetDocumentData;
    use ELogo\Utils\GetDocumentDataResponse;
    use ELogo\Utils\GetDocumentDataResult;
    use ELogo\Utils\GetDocumentStatus;
    use ELogo\Utils\GetDocumentStatusResponse;
    use ELogo\Utils\GetDocumentStatusResult;
    use ELogo\Utils\statusInfo;
    use GuzzleHttp\Client;
    
    class CustomClient{
        /**
         * Guzzle CLient Nesnesi.
         * @var Client
         */
        private $client;
        
        /**
         * Request Header Nesnesi.
         * @var string[]
         */
        private $headers = [
            //'Connection'   => 'Keep-Alive',
            'User-Agent'   => 'UNLEM-SOAP/7.2.22',
            'Content-Type' => 'text/xml; charset=utf-8',
            'Pragma'       => 'no-cache',
        ];
        
        /**
         * Soap XML Wrapper
         * @var string
         */
        private $soapXmlPref = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns1=\"http://tempuri.org/\" xmlns:ns2=\"http://schemas.microsoft.com/2003/10/Serialization/Arrays\">
           <SOAP-ENV:Body>
           %s
           </SOAP-ENV:Body>
            </SOAP-ENV:Envelope>
    ";
        
        /**
         * Soap Prefix
         * @var string
         */
        private $soapSubClassPrefix = "ns1";
        
        /**
         * Soap Prefix
         * @var string
         */
        private $soapVarClassPrefix = "ns1";
        
        /**
         * Soap Prefix
         * @var string
         */
        private $soapArrClassPrefix = "ns2";
        
        /**
         * Son istek verisi
         * @var string
         */
        private $lastRequest = "";
        /**
         * Son İstek Cevap içeriği
         * @var string
         */
        private $lastResponse = "";
        
        /**
         * Servis URL
         * @var string
         */
        private $url;
        
        /**
         * Kurucu Fonksiyon
         * @param $url
         */
        public function __construct($url){
            $this->url    = $url;
            $this->client = new Client([
                'verify' => false,
            ]);
        }
        
        /**
         * Nesneyi SOAP/XML Çeviren sınıf.
         *
         * @param $methodName
         * @param $variables
         * @return string
         */
        protected function makeXml($methodName, $variables){
            
            $subXml = "";
            foreach($variables as $key => $val){
                
                if(is_array($val)){
                    $subXml .= '<'.$this->soapSubClassPrefix.':'.$key.'>';
                    foreach($val as $v){
                        if(strlen($v) > 0)
                            $subXml .= '<'.$this->soapArrClassPrefix.':string>'.(string) $v.'</'.$this->soapArrClassPrefix.':string>';
                    }
                    $subXml .= '</'.$this->soapSubClassPrefix.':'.$key.'>';
                    
                }
                else{
                    if(strlen($val) > 0)
                        $subXml .= '<'.$this->soapVarClassPrefix.':'.$key.'>'.(string) $val.'</'.$this->soapVarClassPrefix.':'.$key.'>';
                }
            }
            $treeXml = '<'.$this->soapSubClassPrefix.':'.$methodName.'>'.$subXml.'</'.$this->soapSubClassPrefix.':'.$methodName.'>';
            $mainXml = sprintf($this->soapXmlPref, $treeXml);
            
            
            return trim($mainXml);
        }
        
        /**
         * Gelen cevabı nesnesye dönüştürme.
         *
         * @param $responseText
         * @return \DOMDocument
         */
        protected function getXml($responseText){
            
            $dom = new \DOMDocument();
            $dom->loadXML($responseText);
            
            return $dom;
        }
        
        /**
         * XML'i nesneye dönüştüren fonksiyon.
         *
         * @param      $object
         * @param      $data
         * @param null $main
         */
        protected function fillObj(&$object, $data, $main = null){
            
            $vars = get_object_vars($object);
            foreach($vars as $key => $val){
                if(is_object($object->{$key})){
                    if(get_class($data) == \DOMNodeList::class)
                        $data = $data->item(0);
                    
                    if($data)
                        $this->fillObj($object->{$key}, $data->getElementsByTagName($key), $data);
                }
                else{
                    $node = $main->getElementsByTagName($key)->item(0);
                    if($node)
                        $object->{$key} = $node->nodeValue;
                }
                
                
            }
        }
        
        /**
         * İstekleri eLogo üzerine iletmeye yardımcı fonksiyon.
         *
         * @param $request
         * @return mixed
         */
        protected function request($request){
            $get_variables = get_object_vars($request);
            $methodName    = $get_variables['methodName'];
            $soapAction    = $get_variables['soapAction'];
            unset($get_variables['methodName']);
            unset($get_variables['soapAction']);
            $xmlMake                         = $this->makeXml($methodName, $get_variables);
            $this->lastRequest               = $xmlMake;
            $soapUrl                         = parse_url($this->url);
            $this->headers['Host']           = $soapUrl['host'];
            $this->headers['SOAPAction']     = $soapAction;
            $this->headers['Content-Length'] = strlen($xmlMake);
            
            $response           = $this->client->request('POST', $this->url, [
                'headers'     => $this->headers,
                'body'        => $xmlMake,
                'http_errors' => false,
            ]);
            $body               = $response->getBody()->getContents();
            $this->lastResponse = $body;
            return $body;
        }
        
        /**
         * eLogo belge durum sorgulama fonksiyonu
         *
         * @param GetDocumentStatus $request
         * @return GetDocumentStatusResponse
         */
        public function GetDocumentStatus(GetDocumentStatus $request){
            
            $responseText = $this->request($request);
            
            $soap = $this->getXml($responseText);
            $body = $soap->getElementsByTagNameNS('http://schemas.xmlsoap.org/soap/envelope/', 'Body');
            
            $response                          = new GetDocumentStatusResponse();
            $response->GetDocumentStatusResult = new GetDocumentStatusResult();
            $response->statusInfo              = new statusInfo();
            $this->fillObj($response, $body->item(0));
            
            return $response;
            
        }
        
        /**
         * eLogo belge içeriğini alan fonksiyon
         *
         * @param GetDocumentStatus $request
         * @return GetDocumentStatusResponse
         */
        public function GetDocumentData(GetDocumentData $request){
            
            $responseText = $this->request($request);
            $soap         = $this->getXml($responseText);
            $body         = $soap->getElementsByTagNameNS('http://schemas.xmlsoap.org/soap/envelope/', 'Body');
            
            $response                        = new GetDocumentDataResponse();
            $response->GetDocumentDataResult = new GetDocumentDataResult();
            $doc                             = new document();
            $doc->binaryData                 = new Base64BinaryData();
            $response->document              = $doc;
            $this->fillObj($response, $body->item(0));
            
            return $response;
            
        }
        
        /**
         * Son yapılan isteğin içeriği.
         *
         * @return string
         */
        public function getLastRequest(){
            return $this->lastRequest;
        }
        
        /**
         * Son yapılan isteğin cevap içerği.
         *
         * @return string
         */
        public function getLastResponse(){
            return $this->lastResponse;
        }
        
    }
