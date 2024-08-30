<?php

namespace Hasokeyk\Elogo;

use Exception;

class ElogoHata extends Exception
{
    // Özelleştirilmiş hata mesajları ve hata kodları ekleyebilirsiniz
    public function __construct($message = "", $code = 0, Exception $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
}
// ELOGO tarafından gelen hataları kontrol edilebilir hale getirir.
