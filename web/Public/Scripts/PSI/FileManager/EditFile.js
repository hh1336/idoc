Ext.define("PSI.FileManager.EditFile", {
  extend: "PSI.AFX.BaseDialogForm",
  initComponent: function () {
    var me = this;
    var entity = me.getEntity();
    Ext.apply(me, {
      header: {
        title: me.formatTitle("修改文件"),
        height: 40
      },
      width: 550,
      height: 600,
      layout: "fit",
      items: [me.getEditPanel()],
      buttons: [{
        text: "确定",
        formBind: true,
        iconCls: "PSI-button-ok",
        handler: me.ok,
        scope: me
      }, {
        text: "取消",
        handler: function () {
          me.confirm("请确认是否取消操作?", function () {
            me.close();
          });
        },
        scope: me
      }],
      listeners: {
        show: {
          fn: me.loadPlugin,
          scope: me
        }
      }
    });

    me.callParent(arguments);
  },
  getEditPanel: function () {
    var me = this;
    if (me.__editPanel)
      return me.__editPanel;
    var entity = me.getEntity();

    var html = `<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;width: 100%;height: 100%;}
.tg td{ sans-serif;font-size:14px;padding:5px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{ sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-0lax{text-align:center;vertical-align:top;}
</style>
<table class="tg" style="undefined;table-layout: fixed; width: 536px">
<colgroup>
<col style="width: 34px">
<col style="width: 34px">
<col style="width: 25px">
<col style="width: 131px">
<col style="width: 69px">
<col style="width: 75px">
<col style="width: 143px">
<col style="width: 25px">
</colgroup>
  <tr>
    <th class="tg-c3ow" colspan="8">文件信息</th>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="3">文件名：</td>
    <td class="tg-0lax" colspan="1">
    <textarea style="width: 100%;height: 100%;" id="FileName">${entity['name']}</textarea>
</td>
    <td class="tg-0lax" colspan="2">版本：</td>
    <td class="tg-0lax" colspan=2">
    <textarea style="width: 100%;height: 100%;" id="Version">${entity['version']}</textarea>
</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="3">状态：</td>
    <td class="tg-0lax" colspan="5">
    ${entity['status'] == 0 ? "正常" : "作废"}
</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="3">创建人：</td>
    <td class="tg-0lax" colspan="1">
    ${entity['create_user_name']}
</td>
    <td class="tg-0lax" colspan="2">最后一次编辑人：</td>
    <td class="tg-0lax" colspan="2">
    ${entity['edit_user_name'] ?? ""}
</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="3">创建时间:</td>
    <td class="tg-0lax" colspan="1">
    ${entity['create_time']}
</td>
    <td class="tg-0lax" colspan="2">最后一次编辑时间：</td>
    <td class="tg-0lax" colspan="2">
    ${entity['edit_time']}
</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="8">备注</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="8" rowspan="4">
    <textarea style="width: 100%;"rows="4" id="Remark">${entity['remark']}</textarea>
</td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="3"><div id="picker">选择文件</div></td>
    <td class="tg-0lax" colspan="5"><div id="FileInfo"></div></td>
  </tr>
</table>`;

    me.__editPanel = Ext.create("Ext.panel.Panel", {
      header: false,
      cls: "PSI",
      height: "100%",
      html: html
    });

    return me.__editPanel;
  },
  ok: function () {
    var me = this;
    var entity = me.getEntity();
    var el = me.getEl();
    var uploadArr = me.__uploader.getFiles();
    el.mask("保存中");
    if (uploadArr.length) {
      me.__uploader.upload();
    } else {
      var fileName = Ext.get("FileName").dom.value == entity['name'] ? "" : Ext.get("FileName").dom.value;
      var version = Ext.get("Version").dom.value;
      var remark = Ext.get("Remark").dom.value;
      var id = entity['id'];
      me.ajax({
        url: me.URL("/Home/FileManager/editFileInfo"),
        params: {
          id: id,
          fileName: fileName,
          version: version,
          remark: remark
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          if (data['success']) {
            me.getParentForm().freshPanel();
            me.close();
          }
          el.unmask();
          me.showInfo(data['msg']);
        }
      });
    }

  },
  loadPlugin: function () {
    var me = this;
    var entity = me.getEntity();

    me.ajax({
      url: me.URL("/Home/SuffixConfig/loadSuffix"),
      params: {},
      success: function (response) {
        var suffixs = me.decodeJSON(response['responseText']);
        var officeSuffix = suffixs['office'].replace(/-/g, ",");
        var pictureSuffix = suffixs['picture'].replace(/-/g, ",");
        var otherSuffix = suffixs['other'].replace(/-/g, ",");
        var allSuffix = officeSuffix + "," + pictureSuffix + "," + otherSuffix;
        var uploader = new WebUploader.Uploader({
          swf: me.URL("Public/webuploader/Uploader.swf"),
          auto: false,
          server: me.URL("/Home/FileManager/uploadFile"),
          disableGlobalDnd: false,//禁用整个页面的拖着效果
          pick: "#picker",
          multiple: false,
          method: 'POST',
          accept: {
            extensions: allSuffix, // 允许的文件后缀，不带点，多个用逗号分割，这里支持老版的Excel和新版的
            mimeTypes: 'application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,' +
              'text/plain,image/*,application/msword,application/vnd.ms-powerpoint,application/x-ppt'
          }
        });


        //文件添加事件
        uploader.on('fileQueued', function (file) {
          file.setStatus("queued");
          Ext.get("FileName").dom.value = file['name'];
          Ext.get("FileName").dom.disabled = true;
          Ext.get("FileInfo").dom.innerHTML = "已选择文件：" + file['name'];
        });

        uploader.on("uploadBeforeSend", function (object, data) {
          data['fileId'] = entity['id'];
          data['parentDirId'] = entity["parent_dir_id"];
          data['version'] = Ext.get("Version").dom.value;
          data['remark'] = Ext.get("Remark").dom.value;
        });

        uploader.on("uploadAccept", function (object, ret) {
          var grid = me.getEditPanel();
          var el = grid.getEl();
          el.unmask();
          me.getParentForm().freshPanel();
          me.close();
          me.showInfo(ret['msg']);
        });

        me.__uploader = uploader;
      }

    });
  },
});
