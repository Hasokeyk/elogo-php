# eLogo PHP SDK 
PHP ile eLogo API'ları ile haberleşmeyi sağlayan SDK.

# Genel Açıklama

eLogo tarafından paylaşılan doküman esas alınarak hazırlanmıştır. Parametreleri ve fonksiyonlara ait açıklamaların detaylarını dökümandan bulabilirsiniz. 
İsimler ve parametre detayları için lütfen dokümanı inceleyin.  

Herhangi bir sorun yaşanması durumunda eLogo destek ile irtibata geçebilirsiniz.

# Servise Giriş

Web servislerine giriş methodu. eLogo'nun paylaşmış olduğu bilgiler ile sisteme giriş yapılabilir.
````php
$baglantiBasligi = new Login();
$baglantiBasligi->setUserName("eLogo Kullanıcı Adı");
$baglantiBasligi->setPassWord("eLogo Şifre");

// eLogo canlı ortamda mı işlem yapılıyor yoksa test ortamımı.
$test = true;
$service = new ELogoClient($test);
$service->Login($baglantiBasligi);
````

# eFatura Gönderimi

eFatura veya eArşiv belgesi göndermek için gerekli method.
````php
$docType = new \ELogo\Utils\DocumentType();
$binaryData = new \ELogo\Utils\Base64BinaryData();
$binaryData->setValue('BASE64 ZIP ICERIGI');

$docType->setBinaryData($binaryData);
$docType->setCurrentDate(date('c'));
$docType->setFileName('UUID.xml');
$docType->setHash('FILE MD5');

$eLogoParamList = ['SIGNED=0'];
if($isArchive){
    $eLogoParamList[] = "DOCUMENTTYPE=EARCHIVE";
}else{
    $eLogoParamList[] = "DOCUMENTTYPE=EINVOICE";
}

$service->SendDocument($eLogoParamList, $docType)
````

# Belge Durum Sorgulama

Gelen/Giden belgelerin durumunu kontrol etmek için kullanılan fonksiyon.
````php
$service->GetDocumentStatus(['DOCUMENTTYPE=EARCHIVE'], 'UUID BILGISI');
````

# Gelen Belge Alma

Gelen ve başarıyla alındı işaretlenmemiş olan belgeleri almaya yarayan fonksiyon.
````php
$eLogoParamList = [
'DOCUMENTTYPE=EINVOICE',
];
$service->GetDocument($eLogoParamList);
````

# UUID ile Belge Alma

UUID ile gelen/giden ve UUID'ye ait olan belgeyi almaya yarayan fonksiyon.
````php
$service->GetDocumentData([
   'DOCUMENTTYPE=EINVOICE',
   'DATAFORMAT=UBL',
], 'UUID');
````

# Belge Alındı İşaretleme

Gelen/giden belgelerin alındı durumlarını güncellemek için kullanılan fonksiyon.
````php
$service->GetDocumentDone([
   'DOCUMENTTYPE=EINVOICE',
], 'UUID');
````



