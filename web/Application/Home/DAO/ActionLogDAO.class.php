<?php

namespace Home\DAO;

class ActionLogDAO extends PSIBaseExDAO
{
  /**
   * 加载操作日志
   * @param $params
   * @return mixed
   */
  public function loadActionLog($params)
  {
    $LogModel = M("file_log", "t_");
    $list = $LogModel
      ->where("is_del = 0")
      ->order('create_time desc')
      ->limit($params['start'], $params['limit'])
      ->select();
    $rs['totalCount'] = $LogModel->where("is_del = 0")->count();
    $rs['dataList'] = $list;
    return $rs;
  }

  /**
   * 添加操作日志
   * @param $params
   */
  public function addLog($params)
  {
    $LogModel = M("file_log", "t_");
    $ActionModel = M("file_log_action", "t_");


    $logData = array(
      "id" => $this->newId(),
      "create_user_id" => $params['login_id'],
      "create_user_name" => $params['login_name'],
      "create_time" => $this->getYMDtime(),
      "type" => $params['action_type'],
      "content" => $params['content'],
      "is_del" => 0
    );
    $LogModel->add($logData);
    foreach ($params['actions'] as $param) {
      $actionData = array(
        "id" => $this->newId(),
        "table_name" => $param['table_name'],
        "field_name" => $param['field_name'],
        "value" => $param['value'],
        "data_id" => $param['data_id'],
        "log_id" => $logData['id']
      );

      $ActionModel->add($actionData);
    }

  }

  /**
   * 退回对应的日志版本
   * @param $params
   * @return array|mixed
   */
  public function revokeVersion($params)
  {
    $LogModel = M("file_log", "t_");
    $ActionModel = M("file_log_action", "t_");

    $logInfo = $LogModel->where("id = '%s'", $params['id'])->find();
    $actionInfo = $ActionModel->where("log_id = '%s'", $logInfo['id'])->select();
    if ($logInfo['type'] == "Added") {
      $Model = M($actionInfo[0]['table_name']);
      $Model->where("id = '%s'", $actionInfo[0]['data_id'])->save(array("is_del = 1"));
    } elseif ($logInfo['type'] == "Deleted") {
      $Model = M($actionInfo[0]['table_name']);
      $Model->where("id = '%s'", $actionInfo[0]['data_id'])->save(array("is_del = 0"));
    } else {
      foreach ($actionInfo as $item) {
        $Model = M($item['table_name']);
        $Model->where("id = '%s'", $item['data_id'])->save(array(
          $item['field_name'] => $item['value']
        ));
      }
    }
    $info = $LogModel->where("id = '%s'", $params['id'])->save(array(
      "is_del" => 1
    ));
    if (!$info) {
      return $this->bad("操作失败");
    }
    return $this->successAction("操作成功");

  }

  /**
   * 根据文件id递归获取之前的文件版本
   * @param $params
   * @return array
   */
  public function getFileVersions($params)
  {
    if (empty($params['id']))
      return array();

    $FileModel = M("file", "t_");
    $file = $FileModel->where("id='%s'", $params['id'])->find();
    $arr = $this->getFileVersions(array(
      "id" => $file['f_id']
    ));
    array_push($arr, $file);
    return $arr;
  }

  /**
   * 撤回文件版本
   * @param $params
   * @return array|mixed
   */
  public function revokeFile($params)
  {
    $FileModel = M("file", "t_");
    $oldInfo = $FileModel->where("id = '%s'", $params['old_id'])->find();
    $currentInfo = $FileModel->where("id = '%s'", $params['current_id'])->find();
    if (empty($oldInfo) || empty($currentInfo))
      return $this->bad("数据出错");
    $FileModel->startTrans();
    $info = $FileModel->where("id = '%s'", $params['old_id'])->save(array(
      "is_del" => 0
    ));
    if (!$info) {
      $FileModel->rollback();
      return $this->bad("操作失败");
    }
    $info = $FileModel->where("id = '%s'", $params['current_id'])->save(array(
      "is_del" => 1
    ));
    if (!$info) {
      $FileModel->rollback();
      return $this->bad("操作失败");
    }

    $this->log_params = array(
      "login_id" => $params['login_id'],
      "login_name" => $params['login_name'],
      "action_type" => "Modified",
      "content" => "用户[${params['login_name']}]撤回了文件[${currentInfo['name']}]的修改",
      "actions" => array([
        "table_name" => $FileModel->getTableName(),
        "field_name" => "is_del",
        "value" => 0,
        "data_id" => $currentInfo['id']
      ],[
        "table_name" => $FileModel->getTableName(),
        "field_name" => "is_del",
        "value" => 1,
        "data_id" => $oldInfo['id']
      ])
    );
    $this->addLog($this->log_params);
    $FileModel->commit();
    return $this->successAction("操作成功");
  }

}
