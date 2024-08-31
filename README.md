### Kurulum
```sh
  composer require hasokeyk/Elogo
```

### Elogo Fatura İşlemleri
Bu kütüphane ile php alt yapılı sisteminizeden elogo fatura işlemlerinizi yapabilirsiniz.

Daha fazla örnek için lütfen "examples" dosyasını inceleyiniz.

## ÖRNEK KOD
```php
<?php

	use Hasokeyk\Elogo\Fatura\Fatura;
	use Hasokeyk\Elogo\Fatura\FaturaSatir;
	use Hasokeyk\Elogo\Firma\BenimFirmam;
	use Hasokeyk\Elogo\Elogo;
	use Hasokeyk\Elogo\Firma\MusteriFirmasi;

	require (__DIR__)."/vendor/autoload.php";

	$elogo_username = 'XXXXXXXXXXX';
	$elogo_password = 'XXXXXXXXXXX';

	try{
		$elogo = new Elogo($elogo_username, $elogo_password, true);

		$elogo_login = $elogo->giris_yap();
		if(isset($elogo_login->sessionID)){

			try{

				//SİZE AİT FİRMANIN BİLGİLERİ
				$benim_firmam = new BenimFirmam();
				$benim_firmam->setYetkiliAdi('Hasan');
				$benim_firmam->setYetkiliSoyadi('Yüksektepe');
				$benim_firmam->setFirmaAdi('Hasan Yüksektepe');
				$benim_firmam->setTcKimlikNo('111111111111');
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
				$musteri_firmasi = new MusteriFirmasi();
				$musteri_firmasi->setYetkiliAdi('Hasan');
				$musteri_firmasi->setYetkiliSoyadi('Yüksektepe');
				$musteri_firmasi->setFirmaAdi('Hasan Yüksektepe');
				
				//KARŞI TARAF BİREY MÜŞTERİ İSE TC KİMLİK 11111111111 GİREBİLİRSİNİZ VE VERGİ NO VE MERSİSNO GİRMEYEBİLİRSİNİZ
				$musteri_firmasi->setTcKimlikNo('11111111111');
				//        $musteri_firmasi->setVergiNo('XXXXXXXXXXX');
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

				//FATURADAKİ ÜRÜN VEYA HİZMETLERİNİZİ EKLEME
				$fatura_satir = new FaturaSatir();
				$fatura_satir->setYeniUrun()->setUrunAdi('Yazılım')->setUrunAciklama('Ürün 1 açıklama')->setUrunAdet(1)->setUrunBirimFiyat(10.333333336);
                //FATURADAKİ ÜRÜN VEYA HİZMETLERİNİZİ EKLEME

                //FATURADAKİ OLUŞTURMA
				$fatura    = new Fatura();
				$fatura_no = $elogo->fatura_no_olustur();

				$varsayilan_earsiv_xml  = $fatura->varsayilan_earsiv_tasarim_dosyasi; //ZORUNLU 
				$varsayilan_efatura_xml = $fatura->varsayilan_efatura_tasarim_dosyasi; //ZORUNLU 

				$fatura->setFaturaEarsivTasarimDosyasi($varsayilan_earsiv_xml);
				$fatura->setFaturaEfaturaTasarimDosyasi($varsayilan_efatura_xml);

				$fatura->setFaturaNo($fatura_no);
				$fatura->setFaturaEttn($elogo_login->ettn);
				$fatura->setFaturaTuru('SATIS');
				$fatura->setFaturaTarihi(date('Y-m-d'));
				$fatura->setFaturaSenaryo('EARSIVFATURA');

				$fatura->setKdvOrani(20);
				
				//KONAKLAMA VERGİSİ İÇİN BU KISMI KULLANABİLİRSİNİZ
				//$fatura->setKonaklamaVergiOrani(2);
				
				//İHRACAT İÇİN MUHAFİYET KODU GİREBİLİRSİNİZ
				//    $fatura->setKdvMuhafiyetKodu('325');
				
				$fatura->setFaturaKesenFirma($benim_firmam);
				$fatura->setMusteriFirma($musteri_firmasi);
				$fatura->setParaBirimi('TRY');

				//PARA BİRİMİNİZ TRY DIŞINDA BİR PARA BİRİMİ İSE MUTLAKA KUR BİLGİSİ GİRMELİSİNİZ
				//        $fatura->setKurFiyati('18.1540');

				$fatura->setUrunler($fatura_satir);

				$einvoice = $elogo->earsiv_gonder($fatura, $benim_firmam, $musteri_firmasi);
				print_r($einvoice);


			}catch(Exception $err){
				echo $err->getMessage();
			}

		}

	}catch(\Hasokeyk\Elogo\ElogoHata $e){
		echo "Hata : ".$e->getMessage();
	}
```