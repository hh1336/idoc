<?php

namespace Home\Controller;

use Home\Common\FIdConst;
use Home\Service\FileManagerService;
use Home\Service\SuffixConfigService;
use Home\Service\UserService;

class FileManagerController extends PSIBaseController
{
  public function index()
  {
    $this->initVar();
    $us = new UserService();
    if (!$us->hasPermission(FIdConst::WJGL)) {
      $this->gotoLoginPage("/Home/User/index");
    }
    $this->assign("title", "文件管理");

    $this->assign("AddDir", $us->hasPermission(FIdConst::WJGL_DIR_ADD) ? 1 : 0);
    $this->assign("EditDir", $us->hasPermission(FIdConst::WJGL_DIR_EDIT) ? 1 : 0);
    $this->assign("DeleteDir", $us->hasPermission(FIdConst::WJGL_DIR_DEL) ? 1 : 0);
    $this->assign("InvalidDir", $us->hasPermission(FIdConst::WJGL_DIR_INVALID) ? 1 : 0);
    $this->assign("UpFile", $us->hasPermission(FIdConst::WJGL_FILE_ADD) ? 1 : 0);
    $this->assign("EditFile", $us->hasPermission(FIdConst::WJGL_FILE_EDIT) ? 1 : 0);
    $this->assign("DeleteFile", $us->hasPermission(FIdConst::WJGL_FILE_DEL) ? 1 : 0);
    $this->assign("InvalidFile", $us->hasPermission(FIdConst::WJGL_FILE_INVALID) ? 1 : 0);
    $this->assign("ActionLog", $us->hasPermission(FIdConst::WJGL_ACTION_LOG) ? 1 : 0);
    $this->display();
  }

  public function loadDir()
  {
    if (IS_POST) {
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->loadDir());
    }
  }

  public function addOrEditDir()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id"),
        "dir_name" => I("post.dirName"),
        "parent_dir_id" => I("post.parentDirID"),
        "remark" => I("post.remark")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->addOrEditDir($params));
    }
  }

  public function deleteDir()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->deleteDir($params));
    }
  }

  public function invalidDir()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->invalidDir($params));
    }
  }

  public function loadFiles()
  {
    if (IS_POST) {
      $params = array(
        "dir_id" => I("post.dirId")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->loadFiles($params));
    }
  }

  public function uploadFile()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.fileId"),
        "parent_dir_id" => I("post.parentDirId"),
        "version" => I("post.version"),
        "remark" => I("post.remark")
      );

      $suffixService = new SuffixConfigService();
      $upType = $suffixService->getSuffixs();

      $fms = new FileManagerService();
      $upload = new \Think\Upload();// 实例化上传类
      $upload->maxSize = 52428800;// 设置附件上传大小 20M
      $upload->exts = $upType;// 设置附件上传类型
      $upload->savePath = ''; // 设置附件上传（子）目录
      $upload->autoSub = false;
      $upload->hash = false;

      $info = $upload->upload();
      if (!$info) {
        $rs["msg"] = "上传文件出现了：" . $upload->getError();
        $rs['success'] = false;
        $this->ajaxReturn();
      } else {
        $params['name'] = $info['file']['name'];
        $params['size'] = $info['file']['size'];
        $params['ext'] = $info['file']['ext'];
        $params['path'] = 'Uploads/' . $info['file']['savename'];
        $params['save_name'] = $info['file']['savename'];
        $this->ajaxReturn($fms->uploadFile($params));
      }
    }
  }

  public function editFileInfo()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id"),
        "name" => I("post.fileName"),
        "version" => I("post.version"),
        "remark" => I("post.remark")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->editFileInfo($params));
    }
  }

  public function deleteFiles()
  {
    if (IS_POST) {
      $params = array(
        "id_str" => I("post.idStr")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->deleteFiles($params));
    }
  }

  public function invalidFiles()
  {
    if (IS_POST) {
      $params = array(
        "id_str" => I("post.idStr")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->invalidFiles($params));
    }
  }

  public function downLoadFiles()
  {
    if (IS_POST) {
      $params = array(
        "id_str" => I("post.idStr")
      );
      $fms = new FileManagerService();
      $files = $fms->downLoadFiles($params);
      $tmpFile = tempnam('/temp', '');  //临时文件
      $zip = new \ZipArchive();
      $zip->open($tmpFile, \ZipArchive::CREATE);
      foreach ($files as $file) {
        $zip->addFile($file['path'],$file['name'] . "." . $file['ext']);
      }
      $zip->close();
      $root_path = "Uploads/download/";
      if (!is_dir($root_path))
        mkdir($root_path);
      copy($tmpFile, $root_path . Date("Y-m-d H-i-s") . '.zip');
      unlink($tmpFile);
      $rs['success'] = true;
      $rs['msg'] = "../../Uploads/download/" . Date("Y-m-d H-i-s") . '.zip';
      $this->ajaxReturn($rs);
    }
  }

  public function convertFile()
  {
    if (IS_POST) {
      $params = array(
        "id" => I("post.id")
      );
      $fms = new FileManagerService();
      $this->ajaxReturn($fms->convertFileById($params));
    }
  }

  public function previewFile()
  {
    if (IS_GET) {
      $params = array(
        "id" => I("get.id"),
        "ext" => I("get.ext")
      );
      $fms = new FileManagerService();
      $file = $fms->getFileById($params);
      if (empty($file)) {
        $this->show("<h1>找不到文件</h1>","utf-8", "text/html");
      }
      $pdf_path =str_ireplace($file['ext'],"pdf",$file['path']);
      if ($params['ext'] == "pdf") {
        //解决跨域请求问题
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Headers: X-Requested-With,X_Requested_With');
        header("Content-type: text/json; charset=utf-8");
        //按照字节大小返回
        header("Accept-Ranges: bytes");
        header("Pragma:No-cache;");
        header("Cache-Control:No-cache;");
        header("Expires:0;");
        //返回的文件(流形式)
        header("Content-type: application/octet-stream");
        header("Content-Disposition: attachment; filename=" . $file["id"] . "." . "pdf");
        readfile($pdf_path, "预览.pdf");
      } else {
        header("Content-type: " . "image/" . strtolower($params["ext"]));
        readfile($file["path"],"预览." . strtolower($params["ext"]));
      }
    }
  }


}
