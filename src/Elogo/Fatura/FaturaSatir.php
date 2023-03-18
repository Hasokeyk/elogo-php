<?php

    namespace Hasokeyk\Elogo\Fatura;

    use Hasokeyk\Elogo\ElogoHata;

    class FaturaSatir{

        private $urun_adi;
        private $urun_aciklama;
        private $urun_adet;
        private $urun_birim_fiyat;
        private $urun_kdv_orani;
        private $urun_kdv_tutari;
        private $urun_indirim_tutari;
        private $urun_not;
        private $urun_sira = -1;

        public $urunler = [];

        /**
         * @param int $urun_sira
         */
        public function setYeniUrun(){
            $this->urun_sira++;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunAdi(){
            return $this->urunler[$this->urun_sira]['urun_adi'] ?? null;
        }

        /**
         * @param mixed $urun_adi
         */
        public function setUrunAdi($urun_adi){
            $this->urunler[$this->urun_sira]['urun_adi'] = $urun_adi;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunAciklama(){
            return $this->urunler[$this->urun_sira]['urun_aciklama'];
        }

        /**
         * @param mixed $urun_aciklama
         */
        public function setUrunAciklama($urun_aciklama){
            $this->urunler[$this->urun_sira]['urun_aciklama'] = $urun_aciklama;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunAdet(){
            return $this->urunler[$this->urun_sira]['urun_adet'];
        }

        /**
         * @param mixed $urun_adet
         */
        public function setUrunAdet($urun_adet){
            $this->urunler[$this->urun_sira]['urun_adet'] = $urun_adet;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunBirimFiyat(){
            return $this->urunler[$this->urun_sira]['urun_birim_fiyat'];
        }

        /**
         * @param mixed $urun_birim_fiyat
         */
        public function setUrunBirimFiyat($urun_birim_fiyat){
            $this->urunler[$this->urun_sira]['urun_birim_fiyat'] = $urun_birim_fiyat;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunKdvOrani(){
            return $this->urunler[$this->urun_sira]['urun_kdv_orani'];
        }

        /**
         * @param mixed $urun_kdv_orani
         */
        public function setUrunKdvOrani($urun_kdv_orani){
            $this->urunler[$this->urun_sira]['urun_kdv_orani'] = $urun_kdv_orani;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunIndirimTutari(){
            return $this->urunler[$this->urun_sira]['urun_indirim_tutari'];
        }

        /**
         * @param mixed $urun_indirim_tutari
         */
        public function setUrunIndirimTutari($urun_indirim_tutari){
            $this->urunler[$this->urun_sira]['urun_indirim_tutari'] = $urun_indirim_tutari;
            return $this;
        }

        /**
         * @return mixed
         */
        public function getUrunNot(){
            return $this->urunler[$this->urun_sira]['urun_not'];
        }

        /**
         * @param mixed $urun_not
         */
        public function setUrunNot($urun_not){
            $this->urunler[$this->urun_sira]['urun_not'] = $urun_not;
            return $this;
        }

        /**
         * @throws ElogoHata
         */
        public function __destruct(){

            for($i = 0; $i <= $this->urun_sira; $i++){

                if(empty($this->urunler[$i]['urun_adi'])){
                    throw new ElogoHata($i.". Ürün Adı Zorunludur");
                }

                if(empty($this->urunler[$i]['urun_adet'])){
                    throw new ElogoHata($i.". Ürün Adeti Zorunludur");
                }
                else if(!empty($this->urunler[$i]['urun_adet']) and !is_int($this->urunler[$i]['urun_adet'])){
                    throw new ElogoHata($i.". Ürün Adeti Bilgisini Tam Sayı Olarak Giriniz");
                }

                if(empty($this->urunler[$i]['urun_birim_fiyat'])){
                    throw new ElogoHata($i.". Ürün Birim Fiyat Zorunludur");
                }
                else if(!empty($this->urunler[$i]['urun_birim_fiyat']) and !is_numeric($this->urunler[$i]['urun_birim_fiyat'])){
                    throw new ElogoHata($i.". Ürün Birim Fiyat Bilgisini Sayı Olarak Giriniz");
                }

                if(!empty($this->urunler[$i]['urun_indirim_tutari'])){
                    if($this->urunler[$i]['urun_indirim_tutari'] > $this->urunler[$i]['urun_birim_fiyat']){
                        throw new ElogoHata($i.". Ürünün İskonto Tutarı, Birim Fiyattan büyük olamaz");
                    }
                }
            }

        }

    }