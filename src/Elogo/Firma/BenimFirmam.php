<?php

    namespace Hasokeyk\Elogo\Firma;

    use Hasokeyk\Elogo\ElogoHata;

    class BenimFirmam{

        public $firma_adi;
        public $ticari_sicil_no;
        public $tc_kimlik_no;
        public $vergi_no;
        public $vergi_dairesi;
        public $mersis_no;
        public $telefon;
        public $websitesi;
        public $email;
        public $fax;
        public $acik_adres;
        public $bina_adi;
        public $bina_no;
        public $il;
        public $ilce;
        public $posta_kodu;
        public $ulke;
        public $ulke_kodu;
        public $yetkili_adi;
        public $yetkili_soyadi;

        /**
         * @return mixed
         */
        public function getFirmaAdi(){
            return $this->firma_adi;
        }

        /**
         * @param mixed $firma_adi
         */
        public function setFirmaAdi($firma_adi){
            $this->firma_adi = $firma_adi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getTicariSicilNo(){
            return $this->ticari_sicil_no;
        }

        /**
         * @param mixed $ticari_sicil_no
         */
        public function setTicariSicilNo($ticari_sicil_no){
            $this->ticari_sicil_no = $ticari_sicil_no;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getTcKimlikNo(){
            return $this->tc_kimlik_no;
        }

        /**
         * @param mixed $tc_kimlik_no
         */
        public function setTcKimlikNo($tc_kimlik_no){
            $this->tc_kimlik_no = $tc_kimlik_no;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getVergiNo(){
            return $this->vergi_no;
        }

        /**
         * @param mixed $vergi_no
         */
        public function setVergiNo($vergi_no){
            $this->vergi_no = $vergi_no;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getVergiDairesi(){
            return $this->vergi_dairesi;
        }

        /**
         * @param mixed $vergi_dairesi
         */
        public function setVergiDairesi($vergi_dairesi){
            $this->vergi_dairesi = $vergi_dairesi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getMersisNo(){
            return $this->mersis_no;
        }

        /**
         * @param mixed $mersis_no
         */
        public function setMersisNo($mersis_no){
            $this->mersis_no = $mersis_no;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getTelefon(){
            return $this->telefon;
        }

        /**
         * @param mixed $telefon
         */
        public function setTelefon($telefon){
            $this->telefon = $telefon;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getWebsitesi(){
            return $this->websitesi;
        }

        /**
         * @param mixed $websitesi
         */
        public function setWebsitesi($websitesi){
            $this->websitesi = $websitesi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getEmail(){
            return $this->email;
        }

        /**
         * @param mixed $email
         */
        public function setEmail($email){
            $this->email = $email;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getFax(){
            return $this->fax;
        }

        /**
         * @param mixed $fax
         */
        public function setFax($fax){
            $this->fax = $fax;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getAcikAdres(){
            return $this->acik_adres;
        }

        /**
         * @param mixed $acik_adres
         */
        public function setAcikAdres($acik_adres){
            $this->acik_adres = $acik_adres;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getBinaAdi(){
            return $this->bina_adi;
        }

        /**
         * @param mixed $bina_adi
         */
        public function setBinaAdi($bina_adi){
            $this->bina_adi = $bina_adi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getBinaNo(){
            return $this->bina_no;
        }

        /**
         * @param mixed $bina_no
         */
        public function setBinaNo($bina_no){
            $this->bina_no = $bina_no;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getIl(){
            return $this->il;
        }

        /**
         * @param mixed $il
         */
        public function setIl($il){
            $this->il = $il;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getIlce(){
            return $this->ilce;
        }

        /**
         * @param mixed $ilce
         */
        public function setIlce($ilce){
            $this->ilce = $ilce;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getPostaKodu(){
            return $this->posta_kodu;
        }

        /**
         * @param mixed $posta_kodu
         */
        public function setPostaKodu($posta_kodu){
            $this->posta_kodu = $posta_kodu;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUlke(){
            return $this->ulke;
        }

        /**
         * @param mixed $ulke
         */
        public function setUlke($ulke){
            $this->ulke = $ulke;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUlkeKodu(){
            return $this->ulke_kodu;
        }

        /**
         * @param mixed $ulke_kodu
         */
        public function setUlkeKodu($ulke_kodu){
            $this->ulke_kodu = $ulke_kodu;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getYetkiliAdi(){
            return $this->yetkili_adi;
        }

        /**
         * @param mixed $yetkili_adi
         */
        public function setYetkiliAdi($yetkili_adi){
            $this->yetkili_adi = $yetkili_adi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getYetkiliSoyadi(){
            return $this->yetkili_soyadi;
        }

        /**
         * @param mixed $yetkili_soyadi
         */
        public function setYetkiliSoyadi($yetkili_soyadi){
            $this->yetkili_soyadi = $yetkili_soyadi;
            return $this;
        }


        public function __destruct(){

            if(empty($this->firma_adi)){
                throw new ElogoHata("Firma Adı Zorunludur");
            }

            //            if(empty($this->vergi_no)){
            //                throw new ElogoHata("Vergi No Zorunludur");
            //            }

            //            if(empty($this->vergi_dairesi)){
            //                throw new ElogoHata("Vergi Dairesi Zorunludur");
            //            }

            //            if(empty($this->mersis_no)){
            //                throw new ElogoHata("Mersis No Zorunludur");
            //            }

            if(empty($this->telefon)){
                throw new ElogoHata("Telefon Zorunludur");
            }

            if(empty($this->email)){
                throw new ElogoHata("Email Zorunludur");
            }

//            if(empty($this->websitesi)){
//                throw new ElogoHata("Websitesi Zorunludur");
//            }

            if(empty($this->acik_adres)){
                throw new ElogoHata("Açık Adres Zorunludur");
            }

            if(empty($this->bina_adi)){
                throw new ElogoHata("Bina Adı Zorunludur");
            }

            if(empty($this->bina_no)){
                throw new ElogoHata("Bina No Zorunludur");
            }

            if(empty($this->il)){
                throw new ElogoHata("İl Zorunludur");
            }

            if(empty($this->ilce)){
                throw new ElogoHata("İlce Zorunludur");
            }

            if(empty($this->posta_kodu)){
                throw new ElogoHata("Posta Kodu Zorunludur");
            }

            if(empty($this->ulke)){
                throw new ElogoHata("Ülke Zorunludur");
            }

            if(empty($this->ulke_kodu)){
                throw new ElogoHata("Ülke Kodu Zorunludur");
            }

//            if(empty($this->yetkili_adi)){
//                throw new ElogoHata("Yetkili Adı Zorunludur");
//            }

//            if(empty($this->yetkili_soyadi)){
//                throw new ElogoHata("Yetkili Soyadı Zorunludur");
//            }
        }

    }