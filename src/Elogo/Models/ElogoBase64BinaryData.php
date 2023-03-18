<?php

    namespace Hasokeyk\Elogo\Models;

    class ElogoBase64BinaryData extends toArray{
        public $Value;
        public $contentType;

        /**
         * @param mixed $Value
         */
        public function setValue($Value)
        {
            $this->Value = $Value;
        }

        /**
         * @param mixed $contentType
         */
        public function setContentType($contentType)
        {
            $this->contentType = $contentType;
        }
    }