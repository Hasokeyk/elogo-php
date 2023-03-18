<?php

    namespace Hasokeyk\Elogo;

    use Throwable;

    class ElogoHata extends \Exception{

        public function __destruct(){
            echo 1;
        }

    }