<?php

    namespace Hasokeyk\Elogo;

    use Exception;
    use Throwable;

    class ElogoHata extends Exception{

        public function __destruct(){
            exit;
        }

    }