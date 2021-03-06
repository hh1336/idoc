<?php

namespace Home\Service;

use Home\DAO\FormDAO;

/**
 * 自定义表单Service
 *
 * @author 李静波
 */
class FormService extends PSIBaseExService
{
  private $LOG_CATEGORY = "自定义表单";

  /**
   * 自定义表单列表
   */
  public function categoryList()
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $params = [
      "loginUserId" => $this->getLoginUserId()
    ];

    $dao = new FormDAO($this->db());

    return $dao->categoryList($params);
  }

  /**
   * 新增或编辑表单分类
   */
  public function editFormCategory($params)
  {
    if ($this->isNotOnline()) {
      return $this->notOnlineError();
    }

    $id = $params["id"];
    $name = $params["name"];

    $db = $this->db();
    $db->startTrans();

    $log = null;
    $dao = new FormDAO($db);
    if ($id) {
      // 编辑
      $rc = $dao->updateFormCategory($params);
      if ($rc) {
        $db->rollback();
        return $rc;
      }

      $log = "编辑表单分类：{$name}";
    } else {
      // 新增
      $rc = $dao->addFormCategory($params);
      if ($rc) {
        $db->rollback();
        return $rc;
      }

      $id = $params["id"];
      $log = "新增表单分类：{$name}";
    }

    // 记录业务日志
    $bs = new BizlogService($db);
    $bs->insertBizlog($log, $this->LOG_CATEGORY);

    $db->commit();

    return $this->ok($id);
  }

  /**
   * 删除表单分类
   */
  public function deleteFormCategory($params)
  {
    if ($this->isNotOnline()) {
      return $this->notOnlineError();
    }

    $db = $this->db();
    $db->startTrans();

    $dao = new FormDAO($db);
    $rc = $dao->deleteFormCategory($params);
    if ($rc) {
      $db->rollback();
      return $rc;
    }

    $name = $params["name"];
    $log = "删除表单分类：{$name}";

    // 记录业务日志
    $bs = new BizlogService($db);
    $bs->insertBizlog($log, $this->LOG_CATEGORY);

    $db->commit();

    return $this->ok();
  }

  /**
   * 表单分类自定义字段 - 查询数据
   */
  public function queryDataForCategory($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $dao = new FormDAO($this->db());
    return $dao->queryDataForCategory($params);
  }

  /**
   * 新增或编辑表单
   */
  public function editForm($params)
  {
    if ($this->isNotOnline()) {
      return $this->notOnlineError();
    }

    $id = $params["id"];
    $name = $params["name"];

    $pyService = new PinyinService();
    $py = $pyService->toPY($name);
    $params["py"] = $py;

    $db = $this->db();
    $db->startTrans();

    $log = null;
    $dao = new FormDAO($db);
    if ($id) {
      // 编辑
      $rc = $dao->updateForm($params);
      if ($rc) {
        $db->rollback();
        return $rc;
      }

      $log = "编辑表单[{$name}]的主表元数据";
    } else {
      // 新增
      $rc = $dao->addForm($params);
      if ($rc) {
        $db->rollback();
        return $rc;
      }

      $id = $params["id"];
      $log = "新增表单：{$name}";
    }

    // 记录业务日志
    $bs = new BizlogService($db);
    $bs->insertBizlog($log, $this->LOG_CATEGORY);

    $db->commit();

    return $this->ok($id);
  }

  /**
   * 某个分类下的表单列表
   */
  public function formList($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $dao = new FormDAO($this->db());
    return $dao->formList($params);
  }

  /**
   * 表单主表列
   */
  public function formColList($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $dao = new FormDAO($this->db());
    return $dao->formColList($params);
  }

  /**
   * 表单明细表列表
   */
  public function formDetailList($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $dao = new FormDAO($this->db());
    return $dao->formDetailList($params);
  }

  /**
   * 表单明细表的列的列表
   */
  public function formDetailColList($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $dao = new FormDAO($this->db());
    return $dao->formDetailColList($params);
  }

  /**
   * 删除表单元数据
   */
  public function deleteForm($params)
  {
    if ($this->isNotOnline()) {
      return $this->notOnlineError();
    }

    $db = $this->db();
    $db->startTrans();

    $dao = new FormDAO($db);
    $rc = $dao->deleteForm($params);
    if ($rc) {
      $db->rollback();
      return $rc;
    }

    $name = $params["name"];
    $log = "删除表单[$name]的元数据";

    // 记录业务日志
    $bs = new BizlogService($db);
    $bs->insertBizlog($log, $this->LOG_CATEGORY);

    $db->commit();

    return $this->ok();
  }

  /**
   * 获得表单主表元数据
   */
  public function formInfo($params)
  {
    if ($this->isNotOnline()) {
      return $this->emptyResult();
    }

    $dao = new FormDAO($this->db());
    return $dao->formInfo($params);
  }
}
