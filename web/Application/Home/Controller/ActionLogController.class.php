<?php

namespace Home\Controller;

use Home\Service\ActionLogService;

class ActionLogController extends PSIBaseController
{
  public function loadActionLog()
  {
    $params = array(
      "limit" => I("post.limit"),
      "start" => I("post.start")
    );
    $als = new ActionLogService();
    $this->ajaxReturn($als->loadActionLog($params));
  }

  public function revokeVersion()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id")
      );
      $als = new ActionLogService();
      $this->ajaxReturn($als->revokeVersion($params));
    }
  }

  public function getFileVersions()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id")
      );
      $als = new ActionLogService();
      $this->ajaxReturn($als->getFileVersions($params));
    }
  }

  public function revokeFile()
  {
    if (IS_POST) {
      $params = array(
        "old_id" => I("post.oldId"),
        "current_id" => I("post.currentId")
      );
      $als = new ActionLogService();
      $this->ajaxReturn($als->revokeFile($params));
    }
  }
}
