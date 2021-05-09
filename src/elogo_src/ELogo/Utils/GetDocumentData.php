<?php


namespace ELogo\Utils;


class GetDocumentData
{
    public $soapAction = "http://tempuri.org/IPostBoxService/GetDocumentData";
    public $methodName = "GetDocumentData";

    public $sessionID;
    public $uuid;
    public $paramList;

    /**
     * @return string
     */
    public function getSoapAction(): string
    {
        return $this->soapAction;
    }

    /**
     * @param string $soapAction
     */
    public function setSoapAction(string $soapAction)
    {
        $this->soapAction = $soapAction;
    }

    /**
     * @return string
     */
    public function getMethodName(): string
    {
        return $this->methodName;
    }

    /**
     * @param string $methodName
     */
    public function setMethodName(string $methodName)
    {
        $this->methodName = $methodName;
    }

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