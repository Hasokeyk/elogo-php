<?php


namespace ELogo\Utils;

/**
 * E-Logo sistemine belge gönderiminde belge içeriğini saklayan fonksiyon.
 *
 * Class Base64BinaryData
 * @package ELogo\Utils
 */
class Base64BinaryData extends ToArrayable
{
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