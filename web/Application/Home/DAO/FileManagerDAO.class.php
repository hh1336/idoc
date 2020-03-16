<?php

namespace Home\DAO;

use Home\Service\SuffixConfigService;
use Think\Exception;

class FileManagerDAO extends PSIBaseExDAO
{
  /**
   * 递归加载树结构目录
   * @param null $parentId
   * @return array
   */
  public function loadDir($parentId = null)
  {
    $this->db;
    $sql = "select d.id,d.name,d.parent_dir_id,d.create_user_name,d.path,
      d.create_time,d.edit_user_name,d.edit_time,d.status,d.remark from t_dir d";

    if (!$parentId) {
      $sql .= " where d.parent_dir_id is null and d.is_del = 0";
    } else {
      $sql .= " where d.parent_dir_id = '%s' and d.is_del = 0";
    }
    $sql .= " order by d.name";
    $list = $parentId ? $this->db->query($sql, $parentId) : $this->db->query($sql);
    $result = [];
    foreach ($list as $i => $v) {
      $result[$i] = $v;
      $result[$i]['children'] = $this->loadDir($v['id']);
      $result[$i]['leaf'] = count($result[$i]['children']) == 0;
      $result[$i]['expanded'] = $parentId ? false : true;
      $result[$i]['iconCls'] = "PSI-FileIcon-Dir";
    }
//    if (!$parentId) {
//      return $result[0];
//    }
    return $result;
  }

  /**
   * 添加和修改文件夹
   * @param $params
   * @return array|mixed
   */
  public function addOrEditDir($params)
  {
    $DirModel = M("dir", "t_");

    if (empty($params['dir_name']))
      return $this->bad("文件夹名称不能为空");
    if (empty($params['parent_dir_id']))
      return $this->bad("上级目录不存在");
    $isSameName = $DirModel
      ->where("parent_dir_id = '%s' and name = '%s' and is_del = 0",
        $params['parent_dir_id'], $params['dir_name'])->find();
    if (!empty($isSameName))
      return $this->bad("这个目录下已存在叫[${$params["dir_name"]}]的文件夹");

    $parentDir = $DirModel->where("id='%s' and is_del = 0", $params['parent_dir_id'])->find();
    $info = 1;

    if (!empty($params['id'])) {//编辑
      $dirInfo = $DirModel->where("id = '%s'", $params['id'])->find();
      if (empty($dirInfo))
        return $this->bad("找不到数据");
      $data['name'] = $params['dir_name'];
      $data['path'] = $parentDir['path'] . $params["dir_name"] . "/";
      $data['edit_user_id'] = $params['login_id'];
      $data['edit_user_name'] = $params['login_name'];
      $data['edit_time'] = $this->getYMDtime();
      $data['remark'] = $params['remark'];
      $info = $DirModel->where("id='%s'", $params['id'])->save($data);
      if (!$info)
        return $this->bad("数据修改失败");

      //添加日志
      $this->log_params = array(
        "login_id" => $params['login_id'],
        "login_name" => $params['login_name'],
        "action_type" => "Modified",
        "content" => "用户[${params['login_name']}]修改了文件夹[${dirInfo['name']}]=>[${data['name']}]",
        "actions" => array(
          [
            "table_name" => $DirModel->getTableName(),
            "field_name" => "name",
            "value" => $dirInfo['name'],
            "data_id" => $dirInfo['id']
          ],
          [
            "table_name" => $DirModel->getTableName(),
            "field_name" => "remark",
            "value" => $dirInfo['remark'],
            "data_id" => $dirInfo['id']
          ]
        )
      );
      $this->addLog();

      return $this->successAction("操作成功");
    }

    $data['id'] = $this->newId();
    $data['name'] = $params['dir_name'];
    $data['path'] = $parentDir['path'] . $params["dir_name"] . "/";
    $data['parent_dir_id'] = $params['parent_dir_id'];
    $data['create_user_id'] = $params['login_id'];
    $data['create_user_name'] = $params['login_name'];
    $data['create_time'] = $this->getYMDtime();
    $data['status'] = 0;
    $data['remark'] = $params['remark'];
    $data['is_del'] = 0;

    $info = $DirModel->add($data);
    if (!$info)
      return $this->bad("插入数据失败");

    $this->log_params = array(
      "login_id" => $params['login_id'],
      "login_name" => $params['login_name'],
      "action_type" => "Added",
      "content" => "用户[${params['login_name']}]添加了文件夹[${data['name']}]",
      "actions" => array([
        "table_name" => $DirModel->getTableName(),
        "data_id" => $data['id']
      ])
    );
    $this->addLog();

    return $this->successAction("操作成功");

  }

  /**
   * 递归删除选中文件夹下的所有文件和文件夹
   * @param $params
   * @param bool $is_first
   * @return array|mixed|void
   */
  public function deleteDir($params, $is_first = true)
  {
    if (empty($params['id']))
      return;
    $DirModel = M("dir", "t_");
    $dirInfo = $DirModel->where("id = '%s'", $params['id'])->find();
    if (empty($dirInfo))
      return $this->bad("数据不存在");
    $data['del_user_id'] = $params['login_id'];
    $data['del_user_name'] = $params['login_name'];
    $data['del_time'] = $this->getYMDtime();
    $data['is_del'] = 1;
    $info = $DirModel->where("id='%s'", $params['id'])->save($data);
    if (!$info)
      return $this->bad("操作失败");
    $FileModel = M("file", "t_");
    $FileModel->where("parent_dir_id='%s'", $params['id'])->save($data);
    $dirs = $DirModel->where("parent_dir_id = '%s'", $params['id'])->select();

    foreach ($dirs as $dir) {
      $params['id'] = $dir['id'];
      $this->deleteDir($params, false);
    }

    //添加版本记录
    if ($is_first) {
      $this->log_params = array(
        "login_id" => $params['login_id'],
        "login_name" => $params['login_name'],
        "action_type" => "Deleted",
        "content" => "用户[${params['login_name']}]删除了文件夹[${dirInfo['name']}]",
        "actions" => array([
          "table_name" => $DirModel->getTableName(),
          "data_id" => $dirInfo['id']
        ])
      );
      $this->addLog();
    }


    return $this->successAction("操作成功");
  }

  /**
   * 作废整个文件夹
   * @param $params
   * @param bool $is_first
   * @return array|mixed
   */
  public function invalidDir($params, $is_first = true)
  {
    if (empty($params['id']))
      return $this->bad("id为空");
    $DirModel = M("dir", "t_");
    $dirInfo = $DirModel->where("id = '%s'", $params['id'])->find();
    if (empty($dirInfo))
      return $this->bad("数据不存在");
    $info = $DirModel->where("id='%s'", $params['id'])->save(array("status" => "1"));
    if (!$info)
      return $this->bad("操作失败");
    $FileModel = M("file", "t_");
    $file_ids = $FileModel
      ->where("parent_dir_id = '%s'", $params['id'])
      ->field("id")
      ->select();
    $FileModel->where("parent_dir_id = '%s'", $params['id'])->save(array("status" => "1"));
    $dirs = $DirModel->where("parent_dir_id = '%s'", $params['id'])->select();

    //添加版本记录
    if ($is_first) {
      $this->log_params = array(
        "login_id" => $params['login_id'],
        "login_name" => $params['login_name'],
        "action_type" => "Modified",
        "content" => "用户[${params['login_name']}]作废了文件夹[${dirInfo['name']}]",
        "actions" => array()
      );
    }

    foreach ($dirs as $dir) {
      $params['id'] = $dir['id'];
      $this->invalidDir($params);
    }

    //对数据的改变进行记录
    array_push($this->log_params["actions"], array(
      "table_name" => $DirModel->getTableName(),
      "field_name" => "status",
      "value" => 0,
      "data_id" => $dirInfo['id']
    ));

    foreach ($file_ids as $id) {
      array_push($this->log_params["actions"], array(
        "table_name" => $FileModel->getTableName(),
        "field_name" => "status",
        "value" => 0,
        "data_id" => $id
      ));
    }


    if ($is_first) {
      $this->addLog();
    }

    return $this->successAction("操作成功");
  }

  /**
   * 加载文件
   * @param $params
   * @return array
   */
  public function loadFiles($params)
  {
    $FileModel = M("file", "t_");
    $files = $FileModel
      ->where("parent_dir_id = '%s' and is_del = 0", $params['dir_id'])
      ->select();

    $list = [];
    foreach ($files as $file) {
      $file['name'] = $file['name'] . "." . $file['ext'];
      $file['children'] = array();
      $file['leaf'] = true;
      $file['expanded'] = true;
      $file['iconCls'] = "PSI-FileIcon-Dir";
      array_push($list, $file);
    }
    return $list;
  }

  /**
   * 上传文件
   * @param $params
   * @return array|mixed
   */
  public function uploadFile($params)
  {
    $FileModel = M("file", "t_");
    $DirModel = M("dir", "t_");

    $parentDirInfo = $DirModel->where("id = '%s'", $params['parent_dir_id'])->find();

    //处理文件名，因为当前文件名是带后缀的
    $str_len = strlen($params['name']) - strlen("." . $params['ext']);
    $end_len = strlen("." . $params['ext']);
    $params['name'] = substr_replace($params['name'], "", $str_len, $end_len);

    $file = $FileModel
      ->where("name = '%s' and ext = '%s' and parent_dir_id = '%s' and is_del = 0",
        $params['name'], $params['ext'], $params['parent_dir_id'])->find();
    $info = "";
    $FileModel->startTrans();
    if (empty($file) && empty($params['id'])) {
      $data['id'] = $this->newId();
      $data['name'] = $params['name'];
      $data['path'] = $this->getTruePath($params['parent_dir_id']) . $data['id'] . "." . $params['ext'];
      $data['size'] = $params['size'];
      $data['ext'] = $params['ext'];
      $data['parent_dir_id'] = $params['parent_dir_id'];
      $data['version'] = $params['version'];
      $data['create_user_id'] = $params['login_id'];
      $data['create_user_name'] = $params['login_name'];
      $data['create_time'] = $this->getYMDtime();
      $data['status'] = $parentDirInfo['status'];
      $data['remark'] = $params['remark'];
      $data['is_del'] = 0;
      $info = $FileModel->add($data);
      if (!$info) {
        $FileModel->rollback();
        unlink($params['path']);
        return $this->bad("数据插入失败");
      }
      copy($params['path'], $data['path']);
      unlink($params['path']);
      $FileModel->commit();

      //记录日志
      $this->log_params = array(
        "login_id" => $params['login_id'],
        "login_name" => $params['login_name'],
        "action_type" => "Added",
        "content" => "用户[${params['login_name']}]上传了文件[${params['name']}]",
        "actions" => array([
          "table_name" => $FileModel->getTableName(),
          "data_id" => $data['id']
        ])
      );
      $this->addLog();

      $this->convertFileById(array(
        "id" => $data['id']
      ));
      return $this->successAction("上传成功");
    }
    if (!empty($params['id']))
      $file = $FileModel->where("id = '%s'", $params['id'])->find();
    $info = $FileModel->where("id='%s'", $file["id"] ?? $params['id'])->save(array("is_del" => 1));
    if (!$info) {
      $FileModel->rollback();
      unlink($params['path']);
      return $this->bad("数据插入失败");
    }
    $old_name = $file['name'];
    $file['f_id'] = $file["id"] ?? $params['id'];
    $file['id'] = $this->newId();
    $file['name'] = $params['name'];
    $file['path'] = $this->getTruePath($file['parent_dir_id']) . $file['id'] . "." . $params['ext'];
    $file['size'] = $params['size'];
    $file['ext'] = $params['ext'];
    $file['version'] = $params['version'];
    $file['remark'] = $params['remark'];
    $file['edit_user_id'] = $params['login_id'];
    $file['edit_user_name'] = $params['login_name'];
    $file['edit_time'] = $this->getYMDtime();
    $info = $FileModel->add($file);
    if (!$info) {
      $FileModel->rollback();
      unlink($params['path']);
      return $this->bad("数据插入失败");
    }

    copy($params['path'], $file['path']);
    unlink($params['path']);
    $FileModel->commit();

    //记录日志
    $this->log_params = array(
      "login_id" => $params['login_id'],
      "login_name" => $params['login_name'],
      "action_type" => "Modified",
      "content" => "用户[${params['login_name']}]修改了文件[${old_name}]=>[${params['name']}]",
      "actions" => array([
        "table_name" => $FileModel->getTableName(),
        "field_name" => "is_del",
        "value" => 1,
        "data_id" => $file['id']
      ], [
        "table_name" => $FileModel->getTableName(),
        "field_name" => "is_del",
        "value" => 0,
        "data_id" => $file['f_id']
      ])
    );
    $this->addLog();

    $this->convertFileById(array(
      "id" => $file['id']
    ));
    return $this->successAction("上传成功");

  }

  /**
   * 根据文件id递归创建文件夹
   * @param $parent_dir_id
   * @return string
   */
  public function getTruePath($parent_dir_id)
  {
    if (empty($parent_dir_id))
      return "Uploads/";
    $DirModel = M("dir", "t_");
    $dirInfo = $DirModel->where("id = '%s'", $parent_dir_id)->find();
    $parentPath = $this->getTruePath($dirInfo['parent_dir_id']);
    $path = $parentPath . $dirInfo['id'] . "/";
    mkdir($path);
    return $path;
  }

  /**
   * 修改文件信息
   * @param $params
   * @return array|mixed
   */
  public function editFileInfo($params)
  {
    $FileModel = M("file", "t_");
    $fileInfo = $FileModel->where("id = '%s' and is_del = 0", $params['id'])->find();
    if (empty($fileInfo))
      return $this->bad("数据不存在");
    $info = $FileModel->where("id = '%s'", $params['id'])->save(array("is_del" => 1));
    if (!$info)
      return $this->bad("操作失败");

    $old_name = $fileInfo['name'];
    $fileInfo['id'] = $this->newId();
    if (!empty($params['name']))
      $fileInfo['name'] = $params['name'];

    $fileInfo['f_id'] = $params['id'];
    $fileInfo['version'] = $params['version'];
    $fileInfo['remark'] = $params['remark'];
    $fileInfo['edit_user_id'] = $params['login_id'];
    $fileInfo['edit_user_name'] = $params['login_name'];
    $fileInfo['edit_time'] = $this->getYMDtime();
    $info = $FileModel->add($fileInfo);
    if (!$info)
      return $this->bad("操作失败");

    //记录日志
    $this->log_params = array(
      "login_id" => $params['login_id'],
      "login_name" => $params['login_name'],
      "action_type" => "Modified",
      "content" => "用户[${params['login_name']}]修改了文件[${old_name}]的信息",
      "actions" => array([
        "table_name" => $FileModel->getTableName(),
        "field_name" => "is_del",
        "value" => 0,
        "data_id" => $params['id']
      ],[
        "table_name" => $FileModel->getTableName(),
        "field_name" => "is_del",
        "value" => 1,
        "data_id" => $fileInfo['id']
      ])
    );
    $this->addLog();

    return $this->successAction("操作成功");
  }

  /**
   * 批量删除文件
   * @param $params
   * @return array|mixed
   */
  public function deleteFiles($params)
  {
    $FileModel = M("file", "t_");
    $id_arr = explode(",", $params['id_str']);
    $sql = "";
    foreach ($id_arr as $id) {
      if (!empty($id)) {
        $sql .= " id = '%s' or";
        $fileInfo = $FileModel->where("id = '%s'", $id)->find();
        $this->log_params = array(
          "login_id" => $params['login_id'],
          "login_name" => $params['login_name'],
          "action_type" => "Deleted",
          "content" => "用户[${params['login_name']}]删除了文件[${fileInfo['name']}]",
          "actions" => array([
            "table_name" => $FileModel->getTableName(),
            "data_id" => $fileInfo['id']
          ])
        );
        $this->addLog();
      }
    }
    if (!empty($sql)) {
      $sql = substr($sql, 0, strlen($sql) - 2);
      $info = $FileModel->where($sql, $id_arr)
        ->save(array(
          "is_del" => 1,
          "del_user_id" => $params['login_id'],
          "del_user_name" => $params['login_name'],
          "del_time" => $this->getYMDtime()
        ));
      if (!$info)
        return $this->bad("操作失败");

      return $this->successAction("操作成功");
    }
    return $this->bad("数据不存在");
  }

  /**
   * 作废文件
   * @param $params
   * @return array|mixed
   */
  public function invalidFiles($params)
  {
    $FileModel = M("file", "t_");
    $id_arr = explode(",", $params['id_str']);
    $sql = "";
    foreach ($id_arr as $id) {
      if (!empty($id)) {
        $sql .= " id = '%s' or";
        $fileInfo = $FileModel->where("id = '%s'", $id)->find();
        $this->log_params = array(
          "login_id" => $params['login_id'],
          "login_name" => $params['login_name'],
          "action_type" => "Modified",
          "content" => "用户[${params['login_name']}]作废了文件[${fileInfo['name']}]",
          "actions" => array([
            "table_name" => $FileModel->getTableName(),
            "field_name" => "status",
            "value" => 0,
            "data_id" => $fileInfo['id']
          ])
        );
        $this->addLog();
      }
    }
    if (!empty($sql)) {
      $sql = substr($sql, 0, strlen($sql) - 2);
      $info = $FileModel->where($sql, $id_arr)
        ->save(array("status" => 1));
      if (!$info)
        return $this->bad("操作失败");
      return $this->successAction("操作成功");
    }
    return $this->bad("数据已作废");
  }

  /**
   * 获取文件信息
   * @param $params
   * @return array|mixed
   */
  public function downLoadFiles($params)
  {
    $FileModel = M("file", "t_");
    $id_arr = explode(',', $params['id_str']);
    $sql = "";
    foreach ($id_arr as $id) {
      if (!empty($id)) {
        $sql .= " id = '%s' or";
      }
    }
    if (empty($sql)) {
      return array();
    }
    $sql = substr($sql, 0, strlen($sql) - 2);
    return $FileModel->where($sql, $id_arr)->select();
  }

  /**
   * 根据文件id转换文件
   * @param $params
   * @return array|mixed
   */
  public function convertFileById($params)
  {
    $FileModel = M("file", "t_");
    $file = $FileModel->where("id = '%s'", $params['id'])->find();
    if (!$file)
      return $this->bad("文件不存在");

    $suffixService = new SuffixConfigService();
    $officeType = $suffixService->getSuffixs('office');
    $imgType = $suffixService->getSuffixs('picture');

    //图片和pdf不需要转换
    if (in_array(strtolower($file["ext"]), $imgType) || $file["ext"] == "pdf") {
      return $this->successAction("转换成功", array(
        "id" => $file['id'],
        "ext" => $file['ext']
      ));
    }

    //为office格式
    if (in_array(strtolower($file["ext"]), $officeType)) {
      $outpath = $this->getTruePath($file['parent_dir_id']);

      $is_exists =str_ireplace($file['ext'],"pdf",$file['path']);
      if (file_exists($is_exists)) {
        return $this->successAction("转换成功", array(
          "id" => $file['id'],
          "ext" => "pdf"
        ));
      }

      try {
        //openoffice
//        $p = C('JDK_PATH') . " -jar " . realpath(C("JODCONVERTER_PATH")) . " " .
//          $path . " " . $outpath . $data[0]["file_version"] . '.pdf 2>&1 ';

        //liberoffice
        $p = "soffice --headless --convert-to pdf " .
          realpath($file["path"]) . " --outdir " . $outpath;
        $log = "";
        $arr = [];
        exec($p, $log, $arr);
//        exec($p);
        if ($arr) {
          return $this->bad("转换失败");
        }

      } catch (Exception $e) {
        return $this->bad("转换失败" . $e->getMessage());
      }

      return $this->successAction("转换成功", array(
        "id" => $file['id'],
        "ext" => "pdf"
      ));
    }

    return $this->bad("暂不支持这种格式的转换");
  }

  /**
   * 根据id获取文件
   * @param $params
   * @return mixed
   */
  public function getFileById($params)
  {
    $FileModel = M("file", "t_");
    return $FileModel->where("id = '%s'", $params['id'])->find();
  }

}
