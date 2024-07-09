<?php

    namespace Hasokeyk\Elogo\Fatura;

    use Hasokeyk\Elogo\Firma\MusteriFirmasi;
    use Hasokeyk\Elogo\ElogoHata;

    class Fatura{

        public $fatura_no;
        public $fatura_ettn;
        public $fatura_senaryo;
        public $fatura_turu;
        public $fatura_tarihi;
        public $fatura_sevk_tarihi;
        public $fatura_vade_tarihi;
        public $fatura_earsiv_tasarim_dosyasi;
        public $fatura_efatura_tasarim_dosyasi;
        public $kdv_orani;
        public $kdv_muhafiyet_kodu;
        public $fatura_kesen_firma;
        public $musteri_firma;
        public $para_birimi;
        public $kur_fiyati;
        public $genel_indirim_tutari;
        public $ozel_parametreler;
        public $urunler;

        public $fatura_toplam_tutar = 0;
        public $fatura_toplam_kdv_tutar = 0;
        public $fatura_genel_toplam = 0;
        public $fatura_indirim_tutari = 0;

        public $varsayilan_earsiv_tasarim_dosyasi = (__DIR__).'/../FaturaTasarimlari/earsiv_tasarim.xslt';
        public $varsayilan_efatura_tasarim_dosyasi = (__DIR__).'/../FaturaTasarimlari/efatura_tasarim.xslt';

        private $para_birimi_degerleri = [
            "AFA",
            "ALL",
            "DZD",
            "AOA",
            "ARS",
            "AMD",
            "AWG",
            "AUD",
            "AZN",
            "BSD",
            "BHD",
            "BDT",
            "BBD",
            "BYR",
            "BEF",
            "BZD",
            "BMD",
            "BTN",
            "BTC",
            "BOB",
            "BAM",
            "BWP",
            "BRL",
            "GBP",
            "BND",
            "BGN",
            "BIF",
            "KHR",
            "CAD",
            "CVE",
            "KYD",
            "XOF",
            "XAF",
            "XPF",
            "CLP",
            "CNY",
            "COP",
            "KMF",
            "CDF",
            "CRC",
            "HRK",
            "CUC",
            "CZK",
            "DKK",
            "DJF",
            "DOP",
            "XCD",
            "EGP",
            "ERN",
            "EEK",
            "ETB",
            "EUR",
            "FKP",
            "FJD",
            "GMD",
            "GEL",
            "DEM",
            "GHS",
            "GIP",
            "GRD",
            "GTQ",
            "GNF",
            "GYD",
            "HTG",
            "HNL",
            "HKD",
            "HUF",
            "ISK",
            "INR",
            "IDR",
            "IRR",
            "IQD",
            "ILS",
            "ITL",
            "JMD",
            "JPY",
            "JOD",
            "KZT",
            "KES",
            "KWD",
            "KGS",
            "LAK",
            "LVL",
            "LBP",
            "LSL",
            "LRD",
            "LYD",
            "LTL",
            "MOP",
            "MKD",
            "MGA",
            "MWK",
            "MYR",
            "MVR",
            "MRO",
            "MUR",
            "MXN",
            "MDL",
            "MNT",
            "MAD",
            "MZM",
            "MMK",
            "NAD",
            "NPR",
            "ANG",
            "TWD",
            "NZD",
            "NIO",
            "NGN",
            "KPW",
            "NOK",
            "OMR",
            "PKR",
            "PAB",
            "PGK",
            "PYG",
            "PEN",
            "PHP",
            "PLN",
            "QAR",
            "RON",
            "RUB",
            "RWF",
            "SVC",
            "WST",
            "SAR",
            "RSD",
            "SCR",
            "SLL",
            "SGD",
            "SKK",
            "SBD",
            "SOS",
            "ZAR",
            "KRW",
            "XDR",
            "LKR",
            "SHP",
            "SDG",
            "SRD",
            "SZL",
            "SEK",
            "CHF",
            "SYP",
            "STD",
            "TJS",
            "TZS",
            "THB",
            "TOP",
            "TTD",
            "TND",
            "TRY",
            "TMT",
            "UGX",
            "UAH",
            "AED",
            "UYU",
            "USD",
            "UZS",
            "VUV",
            "VEF",
            "VND",
            "YER",
            "ZMK",
        ];
        private $fatura_senaryo_degerleri = ['TICARIFATURA', 'EARSIVFATURA', 'TEMELFATURA', 'IHRACAT', 'KAMU', 'HALFATURA', 'YOLCUBERABER'];
        private $fatura_turu_degerleri = ['SATIS', 'IADE', 'TEVKIFATIADE', 'IHTIYACKAYITLI', 'ISTISNA', 'OZELMATRAH', 'TEVKIFAT', 'SGK', 'KONAKLAMAVERGISI'];
        private $fatura_belge_degerleri = ['EINVOICE', 'APPLICATIONRESPONSE', 'ENVELOPE', 'EARCHIVE', 'CANCELEARCHIVEINVOICE', 'DESPATCHADVICE', 'DESPATCHADVICEENVELOPE', 'RECEIPTADVICE', 'RECEIPTADVICEENVELOPE', 'CANCELTAXFREEINVOICEBYUUID', 'OKCREPORT'];
        private $invoce_prefix = 'HSN';
        private $kdv_muhafiyet_kodulari = [
            201,
            202,
            204,
            205,
            206,
            207,
            208,
            209,
            211,
            212,
            213,
            214,
            215,
            216,
            217,
            218,
            219,
            220,
            221,
            223,
            225,
            226,
            227,
            228,
            229,
            230,
            231,
            232,
            234,
            235,
            236,
            237,
            238,
            239,
            240,
            250,
        ];

        /**
         * @return mixed
         */
        public function getFaturaNo(){
            return $this->fatura_no;
        }

        /**
         * @param mixed $fatura_no
         */
        public function setFaturaNo($fatura_no){
            $this->fatura_no = $fatura_no;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaEttn(){
            return $this->fatura_ettn;
        }

        /**
         * @param mixed $fatura_ettn
         */
        public function setFaturaEttn($fatura_ettn){
            $this->fatura_ettn = $fatura_ettn;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaSenaryo(){
            return $this->fatura_senaryo;
        }

        /**
         * @param mixed $fatura_senaryo
         */
        public function setFaturaSenaryo($fatura_senaryo){
            $this->fatura_senaryo = $fatura_senaryo;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaTuru(){
            return $this->fatura_turu;
        }

        /**
         * @param mixed $fatura_turu
         */
        public function setFaturaTuru($fatura_turu){
            $this->fatura_turu = $fatura_turu;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaTarihi(){
            return $this->fatura_tarihi;
        }

        /**
         * @param mixed $fatura_tarihi
         */
        public function setFaturaTarihi($fatura_tarihi){
            $this->fatura_tarihi = $fatura_tarihi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaSevkTarihi(){
            return $this->fatura_sevk_tarihi;
        }

        /**
         * @param mixed $fatura_sevk_tarihi
         */
        public function setFaturaSevkTarihi($fatura_sevk_tarihi){
            $this->fatura_sevk_tarihi = $fatura_sevk_tarihi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaVadeTarihi(){
            return $this->fatura_vade_tarihi;
        }

        /**
         * @param mixed $fatura_vade_tarihi
         */
        public function setFaturaVadeTarihi($fatura_vade_tarihi){
            $this->fatura_vade_tarihi = $fatura_vade_tarihi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaEarsivTasarimDosyasi(){
            return $this->fatura_earsiv_tasarim_dosyasi;
        }

        /**
         * @param mixed $fatura_earsiv_tasarim_dosyasi
         */
        public function setFaturaEarsivTasarimDosyasi($fatura_earsiv_tasarim_dosyasi){
            $this->fatura_earsiv_tasarim_dosyasi = $fatura_earsiv_tasarim_dosyasi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaEfaturaTasarimDosyasi(){
            return $this->fatura_efatura_tasarim_dosyasi;
        }

        /**
         * @param mixed $fatura_efatura_tasarim_dosyasi
         */
        public function setFaturaEfaturaTasarimDosyasi($fatura_efatura_tasarim_dosyasi){
            $this->fatura_efatura_tasarim_dosyasi = $fatura_efatura_tasarim_dosyasi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getKdvOrani(){
            return $this->kdv_orani;
        }

        /**
         * @param mixed $kdv_orani
         */
        public function setKdvOrani($kdv_orani){
            $this->kdv_orani = $kdv_orani;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getKdvMuhafiyetKodu(){
            return $this->kdv_muhafiyet_kodu;
        }

        /**
         * @param mixed $kdv_muhafiyet_kodu
         */
        public function setKdvMuhafiyetKodu($kdv_muhafiyet_kodu){
            $this->kdv_muhafiyet_kodu = $kdv_muhafiyet_kodu;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFaturaKesenFirma(){
            return $this->fatura_kesen_firma;
        }

        /**
         * @param mixed $fatura_kesen_firma
         */
        public function setFaturaKesenFirma($fatura_kesen_firma){
            $this->fatura_kesen_firma = $fatura_kesen_firma;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getMusteriFirma(){
            return $this->musteri_firma;
        }

        /**
         * @param mixed $musteri_firma
         */
        public function setMusteriFirma($musteri_firma){
            $this->musteri_firma = $musteri_firma;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getParaBirimi(){
            return $this->para_birimi;
        }

        /**
         * @param mixed $para_birimi
         */
        public function setParaBirimi($para_birimi){
            $this->para_birimi = $para_birimi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getKurFiyati(){
            return $this->kur_fiyati;
        }

        /**
         * @param mixed $kur_fiyati
         */
        public function setKurFiyati($kur_fiyati){
            $this->kur_fiyati = $kur_fiyati;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getGenelIndirimTutari(){
            return $this->genel_indirim_tutari;
        }

        /**
         * @param mixed $genel_indirim_tutari
         */
        public function setGenelIndirimTutari($genel_indirim_tutari){
            $this->genel_indirim_tutari = $genel_indirim_tutari;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getOzelParametreler(){
            return $this->ozel_parametreler;
        }

        /**
         * @param mixed $ozel_parametreler
         */
        public function setOzelParametreler($ozel_parametreler){
            $this->ozel_parametreler = $ozel_parametreler;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunler(){

            $toplam_tutar          = 0;
            $toplam_kdv_tutari     = 0;
            $toplam_indirim_tutari = 0;
            if(isset($this->urunler->urunler) and $this->urunler->urunler != null){
                foreach($this->urunler->urunler as $urun){
                    $toplam_tutar          += (($urun['urun_birim_fiyat'] * $urun['urun_adet']));
                    $toplam_kdv_tutari     += (($urun['urun_birim_fiyat'] * $urun['urun_adet']) - ($urun['urun_indirim_tutari'] ?? 0)) * (($urun['urun_kdv_orani'] ?? $this->kdv_orani) / 100);
                    $toplam_indirim_tutari += $urun['urun_indirim_tutari'] ?? 0;
                }
            }

            //FİYAT TOPLA
            $this->fatura_toplam_tutar     = $toplam_tutar;
            $this->fatura_toplam_kdv_tutar = $toplam_kdv_tutari;
            $this->fatura_genel_toplam     = ($toplam_tutar - $toplam_indirim_tutari) + $toplam_kdv_tutari;
            $this->fatura_indirim_tutari   = $toplam_indirim_tutari;
            //FİYAT TOPLA

            return $this->urunler->urunler;
        }

        /**
         * @param mixed $urunler
         */
        public function setUrunler($urunler){
            $this->urunler = $urunler;
            return $this;
        }

        /**
         * @return string
         */
        public function getVarsayilanEarsivTasarimDosyasi(): string{
            return $this->varsayilan_earsiv_tasarim_dosyasi;
        }

        /**
         * @param string $varsayilan_earsiv_tasarim_dosyasi
         */
        public function setVarsayilanEarsivTasarimDosyasi(string $varsayilan_earsiv_tasarim_dosyasi){
            $this->varsayilan_earsiv_tasarim_dosyasi = $varsayilan_earsiv_tasarim_dosyasi;
            return $this;
        }

        /**
         * @return string
         */
        public function getVarsayilanEfaturaTasarimDosyasi(): string{
            return $this->varsayilan_efatura_tasarim_dosyasi;
        }

        /**
         * @param string $varsayilan_efatura_tasarim_dosyasi
         */
        public function setVarsayilanEfaturaTasarimDosyasi(string $varsayilan_efatura_tasarim_dosyasi){
            $this->varsayilan_efatura_tasarim_dosyasi = $varsayilan_efatura_tasarim_dosyasi;
            return $this;
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

        private function date_format_control($date){
            if(preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/", $date)){
                return true;
            }
            else{
                return false;
            }
        }

        private function exchange_format_control($date){
            if(preg_match("/^([0-9]+).[0-9]{4}$/", $date)){
                return true;
            }
            else{
                return false;
            }
        }

        public function __destruct(){

            if(empty($this->fatura_no)){
                throw new ElogoHata("Fatura No Zorunludur");
            }

            if(empty($this->fatura_ettn)){
                throw new ElogoHata("Fatura Ettn Zorunludur");
            }

            if(empty($this->fatura_senaryo)){
                throw new ElogoHata("Fatura Senaryo Zorunludur");
            }
            else if(!empty($this->fatura_senaryo) and !in_array($this->fatura_senaryo, $this->fatura_senaryo_degerleri)){
                throw new ElogoHata("Fatura Senaryo Değeri Yanlıştır. Şu Değerlerden Biri Olmalı. ".implode(', ', $this->fatura_senaryo_degerleri));
            }

            if(empty($this->fatura_turu)){
                throw new ElogoHata("Fatura Türü Zorunludur");
            }
            else if(!empty($this->fatura_turu) and !in_array($this->fatura_turu, $this->fatura_turu_degerleri)){
                throw new ElogoHata("Fatura Türü Değeri Yanlıştır. Şu Değerlerden Biri Olmalı. ".implode(', ', $this->fatura_turu_degerleri));
            }

            if(empty($this->fatura_tarihi)){
                throw new ElogoHata("Fatura Tarihi Zorunludur");
            }
            else if(!empty($this->fatura_tarihi) and $this->date_format_control($this->fatura_tarihi) === false){
                throw new ElogoHata("Fatura Tarih Formatı Hatalıdır. YYYY-AA-GG olarak giriniz");
            }

            //            if(empty($this->fatura_earsiv_tasarim_dosyasi)){
            //                throw new ElogoHata("Fatura E-Arşiv Tasarımı Zorunludur");
            //            }
            //            else if(!empty($this->fatura_earsiv_tasarim_dosyasi) and !file_exists($this->fatura_earsiv_tasarim_dosyasi)){
            //                throw new ElogoHata("Fatura E-Arşiv Tasarımının Yolu Yanlıştır");
            //            }
            //
            //            if(empty($this->fatura_efatura_tasarim_dosyasi)){
            //                throw new ElogoHata("Fatura E-Fatura Tasarımı Zorunludur");
            //            }
            //            else if(!empty($this->fatura_efatura_tasarim_dosyasi) and !file_exists($this->fatura_efatura_tasarim_dosyasi)){
            //                throw new ElogoHata("Fatura E-Fatura Tasarımının Yolu Yanlıştır");
            //            }

            if(!empty($this->kdv_muhafiyet_kodu) and !in_array($this->kdv_muhafiyet_kodu, $this->kdv_muhafiyet_kodulari)){
                throw new ElogoHata("Fatura Kdv Muhafiyet Kodu Değeri Yanlıştır. Şu Değerlerden Biri Olmalı. ".implode(', ', $this->kdv_muhafiyet_kodulari));
            }

            if(empty($this->kdv_orani)){
                throw new ElogoHata("Fatura Kdv Oranı Zorunludur");
            }
            else if(!is_numeric($this->kdv_orani)){
                throw new ElogoHata("Fatura Kdv Oranı Sadece sayı içermelidir. ÖRN. 18");
            }

            if(empty($this->fatura_kesen_firma)){
                throw new ElogoHata("Fatura Kesen Firma Bilgisi Zorunludur");
            }
            else if(gettype($this->fatura_kesen_firma) != "object"){
                throw new ElogoHata("Fatura Kesen Firma Bilgisi Türü Yanlıştır. 'BenimFirmam' sınıfı ile oluşturduğunuz değeri giriniz");
            }

            if(empty($this->musteri_firma)){
                throw new ElogoHata("Fatura Müşteri Firma Bilgisi Zorunludur");
            }
            else if(gettype($this->musteri_firma) != "object"){
                throw new ElogoHata("Fatura Müşteri Firma Bilgisi Türü Yanlıştır. 'MusteriFirmasi' sınıfı ile oluşturduğunuz değeri giriniz");
            }

            if(empty($this->para_birimi)){
                throw new ElogoHata("Para Birimi Zorunludur");
            }
            else if(!empty($this->para_birimi) and !in_array($this->para_birimi, $this->para_birimi_degerleri)){
                throw new ElogoHata("Fatura Para Birimi Değeri Yanlıştır. Şu Değerlerden Biri Olmalı. ".implode(', ', $this->para_birimi_degerleri));
            }
            else if(!empty($this->para_birimi) and $this->para_birimi != 'TRY'){
                if(empty($this->kur_fiyati)){
                    throw new ElogoHata("Kur Fiyatı Zorunludur");
                }
                else if(!empty($this->kur_fiyati) and $this->exchange_format_control($this->kur_fiyati) === false){
                    throw new ElogoHata("Fatura Kur Fiyatı Yanlıştır. Kuruş hanesi 4 hane olarak giriniz. Tam sayı ise 18.0000 olarak giriniz");
                }
            }

            if(empty($this->urunler)){
                throw new ElogoHata("Fatura Ürün Bilgisi Zorunludur");
            }
            else if(gettype($this->urunler) != "object"){
                throw new ElogoHata("Fatura Ürün Değeri Yanlıştır. 'Fatura' sınıfı ile oluşturduğunuz değeri giriniz");
            }

        }

    }