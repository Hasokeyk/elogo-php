<?php

	namespace ELogo\API;

	use ELogo\Exceptions\ELogoGlobalException;
	use ELogo\Utils\DocumentType;
	use ELogo\Utils\GetDocumentData;
	use ELogo\Utils\GetDocumentStatus;
	use ELogo\Utils\Login;

	class ELogoClient {
		/**
		 * Soap istemcisi.
		 *
		 * @var \SoapClient
		 */
		private $client;

		/**
		 * E-Logo Test Web Servis URL
		 *
		 * @var string
		 */
		private $TEST_URL = 'https://pb-demo.elogo.com.tr/PostboxService.svc';
		/**
		 * E-Logo Canlı Web Servis URL
		 *
		 * @var string
		 */
		private $PROD_URL = 'https://pb.elogo.com.tr/PostboxService.svc?singlewsdl';
		/**
		 * E-Logo tarafından üretilen oturum ID.
		 *
		 * @var string
		 */
		public $sessionID;

		/**
		 * Guzzle Client.
		 * @var CustomClient
		 */
		private $customClient;

		/**
		 * E-Logo Kurucu sınıfı.
		 *
		 * @param bool $test
		 * @throws ELogoGlobalException
		 */
		public function __construct($test = false){
			try{
				$this->client = new \SoapClient(($test ? $this->TEST_URL : $this->PROD_URL), ['trace' => 1,]);

				$this->customClient = new CustomClient(($test ? $this->TEST_URL : $this->PROD_URL));
			}catch(\SoapFault $exp){
				throw new ELogoGlobalException("Soap Bağlantı hatası", 1, $exp);
			}
		}

		/**
		 * E-Logo sistemine giriş fonksiyonu.
		 *
		 * Kullanıcı bilgilerini doğrular, doğrulama başarılı olursa kullanılmak üzere geçerli bir sessionID
		 * değeri üretir. Session alındıktan sonra Logout metodu çağrılana kadar ya da timeout süresi
		 * dolana kadar sessionID geçerlidir ve kullanılabilir
		 *
		 * @param Login $login
		 * @return bool
		 */
		public function Login(Login $login){
			$loginParam = $this->client->Login(['login' => $login->toArray()]);
			if($loginParam->LoginResult){

				$this->sessionID = $loginParam->sessionID;

				return $loginParam;
			}else{
				return false;
			}
		}

		/**
		 * E-Logo Sistemi oturum sonlandırma.
		 *
		 * Login ile alınan sessionID’nin geçerliliğini sonlandırır.
		 *
		 * @return void
		 */
		public function Logout(){
			$this->client->Logout(['sessionID' => $this->sessionID]);
		}

		/**
		 * Belge Gönderim fonksiyonu.
		 *
		 * Doküman gönderimi yapılan metottur. Doküman datası zip formatında sıkıştırılmış olmalıdır.
		 * Bir zip içinde birden fazla doküman olabilir. Metot output olarak refId değeri döner
		 *
		 * @param              $params
		 * @param DocumentType $documentType
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function SendDocument($params, DocumentType $documentType = null){

			$data = [
				'sessionID' => $this->sessionID,
				'paramList' => $params,
			];
			if($documentType != null)
				$data['document'] = $documentType->toArray();

			$result = $this->client->SendDocument($data);

			if(property_exists($result, 'SendDocumentResult')){
				if($result->SendDocumentResult->resultCode == 1){
					return $result->refId;
				}else{
					throw new ELogoGlobalException($result->SendDocumentResult->resultMsg, $result->SendDocumentResult->resultCode);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}

		}

		/**
		 * Sistemde ki dökümanları işaret yoluyla çekmen fonksiyon.
		 *
		 * Gelen belgelerin alındığı metottur. Çağrıldığında alınmayan ilk belgeyi verir. Alınmayan bütün
		 * belgeleri alabilmek için önce GetDocument ile belge alınmalı ardından GetDocumentDone ile
		 * belge alındı işaretlenmeli ve bu işlem alınacak belge kalmayana kadar devam etmelidir.
		 *
		 * @param $params
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function GetDocument($params){

			$result = $this->client->GetDocument([
				'sessionID' => $this->sessionID,
				'paramList' => $params,
			]);

			if(property_exists($result, 'GetDocumentResult')){
				if($result->GetDocumentResult->resultCode == 1){
					return $result;
				}else{
					throw new ELogoGlobalException($result->GetDocumentResult->resultMsg, $result->GetDocumentResult->resultCode);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}


		}

		/**
		 * Sistemde ki dökümanları işlendiğini işaretleyen fonksiyon.
		 *
		 * Belgeyi alındı olarak işaretler. GetDocument metodu ile başarılı alınan belge bu metot ile alındı
		 * olarak işaretlenir.
		 *
		 * @param $params
		 * @param $uuid
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function GetDocumentDone($params, $uuid){

			$result = $this->client->GetDocumentDone([
				'sessionID' => $this->sessionID,
				'paramList' => $params,
				'uuid'      => $uuid,
			]);

			if(property_exists($result, 'GetDocumentDoneResult')){
				if($result->GetDocumentDoneResult->resultCode == 1){
					return true;
				}else{
					throw new ELogoGlobalException($result->GetDocumentDoneResult->resultMsg, $result->GetDocumentDoneResult->resultCode);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}
		}

		/**
		 * Sistemde ki dökümanın UBL/PDF/HTML çıktısı.
		 *
		 * Gönderilen ya da alınan bir belge datasının istenilen formatta alınabileceği metottur.
		 *
		 * @param $params
		 * @param $uuid
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function GetDocumentData($params, $uuid){

			$documentRequest = new GetDocumentData();
			$documentRequest->setSessionID($this->sessionID);
			$documentRequest->setUuid($uuid);
			$documentRequest->setParamList($params);

			$result = $this->customClient->GetDocumentData($documentRequest);
			if($result->GetDocumentDataResult->resultCode == 1){
				return $result->document;
			}else{
				throw new ELogoGlobalException($result->GetDocumentDataResult->resultMsg, $result->GetDocumentDataResult->resultCode);
			}

		}

		/**
		 * Sistemde ki faturaların GIB durumlarını sorgulayan fonksiyon.
		 *
		 * Gönderilen belgeye ait durum sorgusunun yapıldığı metottur.
		 *
		 * @param $params
		 * @param $uuid
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function GetDocumentStatus($params, $uuid){

			$documentRequest = new GetDocumentStatus();
			$documentRequest->setSessionID($this->sessionID);
			$documentRequest->setUuid($uuid);
			$documentRequest->setParamList($params);

			$result = $this->customClient->GetDocumentStatus($documentRequest);

			if($result->GetDocumentStatusResult->resultCode == 1){
				return $result->statusInfo;
			}else{
				throw new ELogoGlobalException($result->GetDocumentStatusResult->resultMsg, $result->GetDocumentStatusResult->resultCode);
			}

		}


		/**
		 * Sistemde ki belgeleri tarihe göre getiren fonksiyon.
		 *
		 * İstenilen zaman aralığındaki belge listesini sorgulamak için kullanılır.
		 *
		 * @param $params
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function GetDocumentList($params){

			$result = $this->client->GetDocumentList([
				'sessionID' => $this->sessionID,
				'paramList' => $params,
			]);

			if(property_exists($result, 'GetDocumentListResult')){
				if($result->GetDocumentListResult->resultCode == 1){
					return $result->docList;
				}else{
					throw new ELogoGlobalException($result->GetDocumentListResult->resultMsg, $result->GetDocumentListResult->resultCode);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}

		}

		/**
		 * VKN/TCKN GIB üzerinde kayıtlı olup olmadığını kontrol eden fonksiyon.
		 *
		 * VKN değerine sahip olan kullanıcının GİB kullanıcısı olup olmama durumunu, kayıtlıysa
		 * GİB’e kayıt olma tarihini ve e-fatura, e-irsaliye posta kutusu (PK etiketi) ve gönderici birim
		 * (GB etiketi) adreslerini listeler.
		 *
		 * @param $params
		 * @return array
		 * @throws ELogoGlobalException
		 */
		public function GetValidateGIBUser($params){

			$outputs = [];

			$result = $this->client->GetValidateGIBUser([
				'sessionID' => $this->sessionID,
				'paramList' => $params,
			]);

			if(property_exists($result, 'GetValidateGIBUserResult')){
				if($result->GetValidateGIBUserResult->resultCode == 1){
					$this->parseOutputString($result->GetValidateGIBUserResult->outputList->string, $outputs);
				}else{
					throw new ELogoGlobalException($result->GetValidateGIBUserResult->resultMsg, $result->GetValidateGIBUserResult->resultCode);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}

			return $outputs;
		}

		public function CheckGibUser($params){

			$result = $this->client->CheckGibUser([
				'sessionId'   => $this->sessionID,
				'vknTcknList' => $params,
			]);

			if(property_exists($result, 'CheckGibUserResult')){
				if($result->CheckGibUserResult->resultCode == 1){
					return $result->userList->GibUserType;
				}else{
					throw new ELogoGlobalException($result->CheckGibUserResult->resultMsg, $result->CheckGibUserResult->resultCode);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}

		}

		/**
		 * GIB'e yeni gelen kullanıcıların listesi.
		 *
		 * GİB kullanıcı listesini listeler. e-Fatura gönderilmek istendiğinde fatura kesilecek alıcının efatura mükellefi olup olmadığı bu liste yardımı ile tespit edilir.
		 * Faturanın kesileceği etiket PKLIST parametresi ile alınan listeden tespit edilir. Liste GİB’den alınarak oluşturulur. Liste
		 * sık sık güncellendiği için günlük belirli zaman aralıkları ile alınması gerekir.
		 * @param Login $login
		 * @param       $listType
		 *
		 * @return mixed
		 * @throws ELogoGlobalException
		 */
		public function GetUserListNew(Login $login, $listType){

			$result = $this->client->getUserListNew([
				'login'    => $login->toArray(),
				'listType' => $listType,
			]);

			if(property_exists($result, 'getUserListNewResult')){
				if(property_exists($result->getUserListNewResult, 'binaryData')){
					return $result;
				}else{
					throw new ELogoGlobalException("E-Logo Dosya çekilemedi.", 0);
				}
			}else{
				throw new ELogoGlobalException("E-Logo cevap veremedi.", 0);
			}

		}

		/**
		 * Tüm işlemler tammalanınca çıkış yap.
		 *
		 */
		public function __destruct(){
			if($this->sessionID != null && $this->sessionID != ""){
				$this->Logout();
			}
		}

		/**
		 * Son yapılan isteğin içeriği.
		 *
		 * @return string
		 */
		public function getLastRequest(){
			return $this->client->__getLastRequest();
		}

		/**
		 * Son yapılan isteğin cevap içeriği.
		 *
		 * @return string
		 */
		public function getLastResponse(){
			return $this->client->__getLastResponse();
		}

		/**
		 * Name=Value türünü array key => value çeviren fonksiyon.
		 *
		 * @param $list
		 * @param $out
		 */
		private function parseOutputString($list, &$out){
			foreach($list as $value){
				list($key, $val) = explode('=', $value);
				$out[$key] = $val;
			}
		}
	}
