<?php

namespace Home\Service;

use Home\DAO\ActionLogDAO;

class ActionLogService extends PSIBaseExService
{
  public function addLog($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $ald = new ActionLogDAO($this->db());
    return $ald->addLog($params);
  }

  public function loadActionLog($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $ald = new ActionLogDAO($this->db());
    return $ald->loadActionLog($params);
  }

  public function revokeVersion($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $ald = new ActionLogDAO($this->db());
    return $ald->revokeVersion($params);
  }

  public function getFileVersions($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $ald = new ActionLogDAO($this->db());
    return $ald->getFileVersions($params);
  }

  public function revokeFile($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }
    $params['login_id'] = $this->getLoginUserId();
    $params['login_name'] = $this->getLoginUserName();
    $ald = new ActionLogDAO($this->db());
    return $ald->revokeFile($params);
  }
}
