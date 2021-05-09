<?php


namespace ELogo\Utils;

/**
 * E-Logo sistemine belge göndermeye yardımcı fonksiyon.
 *
 * Class DocumentType
 * @package ELogo\Utils
 */
class DocumentType extends ToArrayable
{
    protected $binaryData;
    protected $currentDate;
    protected $fileName;
    protected $hash;

    /**
     * @param mixed $binaryData
     */
    public function setBinaryData($binaryData)
    {
        $this->binaryData = $binaryData;
    }

    /**
     * @param mixed $currentDate
     */
    public function setCurrentDate($currentDate)
    {
        $this->currentDate = $currentDate;
    }

    /**
     * @param mixed $fileName
     */
    public function setFileName($fileName)
    {
        $this->fileName = $fileName;
    }

    /**
     * @param mixed $hash
     */
    public function setHash($hash)
    {
        $this->hash = $hash;
    }


}