<?php

namespace Home\Service;

/**
 * Service 扩展基类
 *
 * @author 李静波
 */
class PSIBaseExService extends PSIBaseService
{
  private $userService = null;

  private function us()
  {
    if (!$this->userService) {
      $this->userService = new UserService();
    }

    return $this->userService;
  }

  /**
   * 验证用户权限
   * @param null $fid
   * @return bool
   */
  protected function hasPermission($fid = null)
  {
    $us = $this->us();
    return $us->hasPermission($fid);
  }

  /**
   * 当前登录用户的id
   *
   * @return string|NULL
   */
  protected function getLoginUserId()
  {
    $us = $this->us();
    return $us->getLoginUserId();
  }

  /**
   * 当前登录用户的姓名
   */
  protected function getLoginUserName()
  {
    $us = $this->us();
    return $us->getLoginUserName();
  }

  /**
   * 当前登录用户的数据域
   */
  protected function getLoginUserDataOrg()
  {
    $us = $this->us();
    return $us->getLoginUserDataOrg();
  }

  /**
   * 当前登录用户所属公司的id
   */
  protected function getCompanyId()
  {
    $us = $this->us();
    return $us->getCompanyId();
  }

  protected function notPermission()
  {
    return $this->bad("您没有权限进行这个操作");
  }

  /**
   * 数据库操作类
   *
   * @return \Think\Model
   */
  protected function db()
  {
    return M();
  }
}
