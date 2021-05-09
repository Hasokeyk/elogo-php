<?php


namespace ELogo\Utils;


class GetDocumentStatus
{
    public $soapAction = "http://tempuri.org/IPostBoxService/GetDocumentStatus";
    public $methodName = "GetDocumentStatus";

    public $sessionID;
    public $uuid;
    public $paramList;

    /**
     * @return mixed
     */
    public function getSessionID()
    {
        return $this->sessionID;
    }

    /**
     * @param mixed $sessionID
     */
    public function setSessionID($sessionID)
    {
        $this->sessionID = $sessionID;
    }

    /**
     * @return mixed
     */
    public function getUuid()
    {
        return $this->uuid;
    }

    /**
     * @param mixed $uuid
     */
    public function setUuid($uuid)
    {
        $this->uuid = $uuid;
    }

    /**
     * @return mixed
     */
    public function getParamList()
    {
        return $this->paramList;
    }

    /**
     * @param mixed $paramList
     */
    public function setParamList($paramList)
    {
        $this->paramList = $paramList;
    }



}