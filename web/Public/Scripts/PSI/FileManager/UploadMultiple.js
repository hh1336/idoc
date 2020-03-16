Ext.define("PSI.FileManager.UploadMultiple", {
  extend: "PSI.AFX.BaseDialogForm",
  initComponent: function () {
    var me = this;

    Ext.apply(me, {
      header: {
        title: me.formatTitle("上传文件"),
        height: 40
      },
      width: 800,
      height: 600,
      layout: "anchor",
      tbar: [
        {
          xtype: "panel",
          height: 30,
          width: 80,
          html: `<div id="picker" style="height: 30px;">选择文件</div>`
        },
        {
          text: "移除选中文件",
          handler: me.deleteCheckedFiles,
          scope: me
        }
      ],
      items: [me.getUploadGrid()],
      buttons: [{
        text: "全部开始",
        formBind: true,
        iconCls: "PSI-button-ok",
        handler: me.uploadFiles,
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
        },
        close: {
          fn: me.onWndClose,
          scope: me
        }
      }
    });

    me.callParent(arguments);
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
          webkitdirectory: entity['isFilesOrDir'] ? "webkitdirectory" : "",//文件夹上传模式
          server: me.URL("/Home/FileManager/uploadFile"),
          disableGlobalDnd: false,//禁用整个页面的拖着效果
          pick: "#picker",
          multiple: true,
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
          var store = me.getUploadGrid().getStore();
          store.add({
            "id": file["id"],
            "name": file["name"],
            "size": file["size"],
            "status": "待上传"
          });
        });

        uploader.on("uploadBeforeSend", function (object, data) {
          var store = me.getUploadGrid().getStore();
          var storeData = store.getById(data['id']);
          data['parentDirId'] = entity["id"];
          data['version'] = storeData['data']["version"];
          data['remark'] = storeData['data']["remark"];
          storeData['data']['status'] = "上传中";
          var newData = [storeData];
          store.remove(storeData);
          store.add(newData);
        });

        uploader.on("uploadAccept", function (object, ret) {
          var recordId = object['file']['id'];
          var store = me.getUploadGrid().getStore();
          var record = store.getById(recordId);
          record['data']['status'] = ret['msg'];
          var newRecord = [record];
          store.remove(record);
          store.add(newRecord);
        });

        uploader.on("uploadFinished", function () {
          var grid = me.getUploadGrid();
          var el = grid.getEl();
          el.unmask();
          me.getParentForm().freshPanel();
          me.close();
        });

        me.__uploader = uploader;
      }

    });
  },
  //获取文件grid
  getUploadGrid: function () {
    var me = this;
    if (me.__uploadGrid)
      return me.__uploadGrid
    var modelName = "UploadModel";
    Ext.define(modelName, {
      extend: "Ext.data.Model",
      fields: ["id", "version", "name", "status", "size", "remark"]
    });
    var Store = Ext.create('Ext.data.Store', {
      model: modelName,
      data: []
    });
    me.__uploadGrid = Ext.create("Ext.grid.Panel", {
      cls: "PSI",
      border: 1,
      columnLines: true,
      store: Store,
      anchor: '100% 100%',
      selModel: Ext.create('Ext.selection.CheckboxModel', {mode: "MULTI"}),
      selType: 'cellmodel',
      listeners: {
        cellclick: function (thisTab, td, cellIndex, record) {
          if (cellIndex == 6) {
            me.deleteFileByRecord(record, me);
          }
        }
      },
      plugins: [
        Ext.create('Ext.grid.plugin.CellEditing', {
          clicksToEdit: 1
        })
      ],
      columns: [
        {
          header: '版本号',
          width: "10%",
          dataIndex: 'version',
          sortable: false,
          menuDisabled: true,
          field: {
            xtype: 'textfield',
            allowBlank: false
          }
        },
        {header: '文件名', width: "25%", dataIndex: 'name', sortable: false, menuDisabled: true},
        {
          header: '文件大小',
          width: "10%",
          dataIndex: 'size',
          sortable: false,
          menuDisabled: true,
          renderer: function (val) {
            val /= 1024;
            if (val < 1024)
              return val.toFixed(2) + "kb";
            return (val / 1024).toFixed(2) + "M";
          }
        },
        {
          header: '备注',
          width: "30%",
          dataIndex: 'remark',
          sortable: false,
          menuDisabled: true, field: {
            xtype: 'textfield',
            allowBlank: false
          }
        },
        {header: '状态', width: "10%", dataIndex: 'status', sortable: false, menuDisabled: true},
        {
          header: '操作',
          width: "11.5%",
          dataIndex: 'id',
          sortable: false,
          menuDisabled: true,
          renderer: function (id) {
            return "<input type='button' value='移除' file-id='" + id + "'/>";
          }
        }
      ]
    });
    return me.__uploadGrid;
  },
  //上传文件
  uploadFiles: function () {
    var me = this;
    var el = me.getEl();
    el.mask("请稍等......");
    me.__uploader.upload();
  },
  //在队列中删除选中的文件
  deleteCheckedFiles: function () {
    var me = this;
    var grid = me.getUploadGrid();
    var records = grid.getSelectionModel().getSelection();
    Ext.each(records, function (record) {
      me.deleteFileByRecord(record, me);
    });
  },
  //删除队列中的文件
  deleteFileByRecord: function (record, me) {
    var fileId = record['internalId'];
    var store = me.getUploadGrid().getStore();
    var uploader = me.__uploader;
    uploader.getFile(fileId).setStatus("cancelled");
    //删除队列中的文件
    uploader.removeFile(fileId, true);
    store.remove(record);
  },
  onWndClose: function () {
    var me = this;
    var entity = me.getEntity();
    entity['isFilesOrDir'] = false;
    Ext.get(window).un('beforeunload', me.onWindowBeforeUnload);
  },
  onWindowBeforeUnload: function (e) {
    return (window.event.returnValue = e.returnValue = '确认离开当前页面？');
  },
});
