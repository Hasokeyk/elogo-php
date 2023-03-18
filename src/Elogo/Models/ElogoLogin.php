<?php

    namespace Hasokeyk\Elogo\Models;

    class ElogoLogin extends toArray{

        protected $appStr;
        protected $passWord;
        protected $source;
        protected $userName;
        protected $version;

        /**
         * @param mixed $appStr
         */
        public function setAppStr($appStr){
            $this->appStr = $appStr;
        }

        /**
         * @param mixed $passWord
         */
        public function setPassWord($passWord){
            $this->passWord = $passWord;
        }

        /**
         * @param mixed $source
         */
        public function setSource($source){
            $this->source = $source;
        }

        /**
         * @param mixed $userName
         */
        public function setUserName($userName){
            $this->userName = $userName;
        }

        /**
         * @param mixed $version
         */
        public function setVersion($version){
            $this->version = $version;
        }


    }