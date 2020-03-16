<?php

namespace Home\Service;

use Home\Common\FIdConst;
use Home\DAO\FileManagerDAO;

class FileManagerService extends PSIBaseExService
{
  public function loadDir()
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $dao = new FileManagerDAO($this->db());
    return $dao->loadDir();
  }

  public function addOrEditDir($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $params['dir_name'] = preg_replace('# #', '', $params['dir_name']);
    $fmd = new FileManagerDAO($this->db());
    return $fmd->addOrEditDir($params);
  }

  public function deleteDir($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    if (!$this->hasPermission(FIdConst::WJGL_DIR_DEL)) {
      return $this->notPermission();
    }

    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->deleteDir($params);
  }

  public function invalidDir($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    if (!$this->hasPermission(FIdConst::WJGL_DIR_INVALID)) {
      return $this->notPermission();
    }

    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->invalidDir($params);
  }

  public function loadFiles($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $params['login_id'] = $this->getLoginUserId();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->loadFiles($params);
  }

  public function uploadFile($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }


    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->uploadFile($params);
  }

  public function editFileInfo($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->editFileInfo($params);
  }

  public function deleteFiles($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->deleteFiles($params);
  }

  public function invalidFiles($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $fmd = new FileManagerDAO($this->db());
    return $fmd->invalidFiles($params);
  }

  public function downLoadFiles($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $fmd = new FileManagerDAO($this->db());
    return $fmd->downLoadFiles($params);
  }

  public function convertFileById($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $fmd = new FileManagerDAO($this->db());
    return $fmd->convertFileById($params);
  }

  public function getFileById($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $fmd = new FileManagerDAO($this->db());
    return $fmd->getFileById($params);
  }


}
