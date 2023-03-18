<?php

    namespace Hasokeyk\Elogo\Models;

    class ElogoGetInvoiceList extends toArray{

        public $beginDate = null;
        public $endDate = null;
        public $opType = null;
        public $sessionID = null;
        public $dateBy = null;

        /**
         * @return null
         */
        public function getBeginDate(){
            return $this->beginDate;
        }

        /**
         * @param null $beginDate
         */
        public function setBeginDate($beginDate){
            $this->beginDate = $beginDate;
        }

        /**
         * @return null
         */
        public function getEndDate(){
            return $this->endDate;
        }

        /**
         * @param null $endDate
         */
        public function setEndDate($endDate){
            $this->endDate = $endDate;
        }

        /**
         * @return null
         */
        public function getOpType(){
            return $this->opType;
        }

        /**
         * @param null $opType
         */
        public function setOpType($opType){
            $this->opType = $opType;
        }

        /**
         * @return null
         */
        public function getSessionID(){
            return $this->sessionID;
        }

        /**
         * @param null $sessionID
         */
        public function setSessionID($sessionID){
            $this->sessionID = $sessionID;
        }

        /**
         * @return null
         */
        public function getDateBy(){
            return $this->dateBy;
        }

        /**
         * @param null $dateBy
         */
        public function setDateBy($dateBy){
            $this->dateBy = $dateBy;
        }


    }