Ext.define('PSI.FileManager.MainForm', {
  extend: "PSI.AFX.BaseMainExForm",
  config: {
    AddDir: null,
    EditDir: null,
    DeleteDir: null,
    InvalidDir: null,
    UpFile: null,
    DeleteFile: null,
    EditFile: null,
    InvalidFile: null,
    ActionLog: null
  },
  initComponent: function () {
    var me = this;
    Ext.apply(me, {
      items: [
        {
          id: "panelQueryCmp",
          region: "north",
          border: 0,
          height: 35,
          header: false,
          collapsible: true,
          collapseMode: "mini",
          layout: {
            type: "table",
            columns: 4
          },
          items: me.getQueryCmp()
        },
        {
          id: "panelFileManager",
          xtype: "panel",
          region: "west",
          layout: "fit",
          width: "50%",
          split: true,
          collapsible: true,
          header: false,
          border: 0,
          items: [me.getTree()]
        }, {
          region: "center",
          xtype: "panel",
          layout: "fit",
          border: 0,
          items: [me.getPanel()]
        }]
    });

    me.callParent(arguments);
  },
  getQueryCmp: function () {
    var me = this;
    return [{
      id: "editQueryName",
      labelWidth: 60,
      labelAlign: "right",
      labelSeparator: "",
      fieldLabel: "名称",
      margin: "5, 0, 0, 0",
      xtype: "textfield"
    },
      {
        xtype: "container",
        items: [{
          xtype: "button",
          text: "查询",
          width: 100,
          height: 26,
          margin: "5, 0, 0, 20",
          handler: me.onQuery,
          scope: me
        }, {
          xtype: "button",
          text: "清空查询条件",
          width: 100,
          height: 26,
          margin: "5, 0, 0, 5",
          handler: me.onClearQuery,
          scope: me
        }, {
          xtype: "button",
          text: "隐藏查询条件栏",
          width: 130,
          height: 26,
          iconCls: "PSI-button-hide",
          margin: "5 0 0 10",
          handler: function () {
            Ext.getCmp("panelQueryCmp").collapse();
          },
          scope: me
        }]
      }];
  },
  getTree: function () {
    var me = this;
    if (me.__tree)
      return me.__tree;

    var modelName = "DirModel";
    Ext.define(modelName, {
      extend: "Ext.data.Model",
      fields: ["id", "name", "path", "parent_dir_id", "create_user_name", "create_time",
        "edit_user_name", "edit_time", "status", "remark", "children", "leaf"]
    });
    var Store = Ext.create('Ext.data.TreeStore', {
      model: modelName,
      proxy: {
        type: "ajax",
        actionMethods: {
          read: "POST"
        },
        extraParams: {},
        url: me.URL("Home/FileManager/loadDir"),
        reader: {
          type: 'json'
        }
      },
      root: {expanded: true}
    });

    me.__tree = Ext.create('Ext.tree.Panel', {
      cls: "PSI",
      header: false,
      store: Store,
      animate: true, // 开启动画效果
      rootVisible: false,
      useArrows: true,
      viewConfig: {
        loadMask: true,
      },
      tbar: [
        {
          text: "新建文件夹",
          disabled: me.getAddDir() == "0",
          handler: me.onAddDir,
          scope: me
        }, {
          text: "编辑文件夹",
          disabled: me.getEditDir() == "0",
          handler: me.onEditDir,
          scope: me
        }, {
          text: "删除文件夹",
          disabled: me.getDeleteDir() == "0",
          handler: me.onDeleteDir,
          scope: me
        }, {
          text: "作废",
          disabled: me.getInvalidDir() == "0",
          handler: me.onInvalidDir,
          scope: me
        }, {
          text: "权限设置",
          handler: me.onInvalidDir,
          scope: me
        },
        {
          text: "刷新",
          handler: me.freshGrid,
          scope: me
        }, "-",
        {
          text: "操作记录",
          hidden: me.getActionLog() == "0",
          handler: me.onLookActionLog,
          scope: me
        }],
      columns: {
        defaults: {
          sortable: false,
          menuDisabled: true,
          draggable: false
        },
        items: [{
          xtype: "treecolumn",
          text: "名称",
          dataIndex: "name",
          width: "25%"
        }, {
          text: "创建人",
          dataIndex: "create_user_name",
          width: "15%"
        }, {
          text: "创建时间",
          dataIndex: "create_time",
          width: "20%"
        }, {
          text: "状态",
          dataIndex: "status",
          width: "15%",
          renderer: function (val) {
            return val == '0' ? "正常" : "作废";
          }
        }, {
          text: "备注",
          dataIndex: "remark",
          width: "25%"
        }]
      }
    });
    me.__tree.on("itemclick", function (self, record) {
      var dirId = record['data']['id'];
      var store = me.getPanel().getStore();
      store.proxy.extraParams = {
        dirId: dirId
      };
      store.reload();
    }, me);
    return me.__tree;
  },
  getPanel: function () {
    var me = this;
    if (me.__filePanel)
      return me.__filePanel;

    var modelName = "FileModel";
    Ext.define(modelName, {
      extend: "Ext.data.Model",
      fields: ["id", "name", "parent_dir_id", "create_user_name", "create_time", "edit_user_name",
        "edit_time", "status", "remark", "version", "f_id", "children", "leaf"]
    });

    var Store = Ext.create('Ext.data.TreeStore', {
      model: modelName,
      proxy: {
        type: "ajax",
        url: me.URL("Home/FileManager/loadFiles"),
        actionMethods: {
          read: "POST"
        },
        extraParams: {
          name: ""
        },
        reader: {
          type: 'json'
        }
      },
      root: {expanded: true}
    });
    me.__filePanel = Ext.create("Ext.tree.Panel", {
      cls: "PSI",
      header: false,
      animate: true, // 开启动画效果
      rootVisible: false,
      useArrows: true,
      viewConfig: {
        loadMask: true,
      },
      store: Store,
      selModel: Ext.create('Ext.selection.CheckboxModel', {mode: "MULTI"}),
      tbar: [
        {
          text: "上传文件",
          handler: me.onUploadFile,
          scope: me
        },
        {
          text: "按文件夹上传",
          handler: me.onUseDirUploadFile,
          scope: me
        },
        {
          text: "编辑文件",
          handler: me.onEditFile,
          scope: me
        },
        {
          text: "删除文件",
          handler: me.onDeleteFile,
          scope: me
        },
        {
          text: "版本控制",
          handler: me.onCheckFileVersions,
          scope: me
        },
        {
          text: "作废",
          handler: me.onInvalidFile,
          scope: me
        },
        {
          text: "预览",
          handler: me.onPreviewFile,
          scope: me
        },
        {
          text: "下载",
          handler: me.onDownLoad,
          scope: me
        }, {
          text: "设置权限",
          handler: me.onFilePermission,
          scope: me
        }, {
          text: "刷新",
          handler: me.freshPanel,
          scope: me
        }],
      columns: {
        defaults: {
          sortable: false,
          menuDisabled: true,
          draggable: false
        }, items: [
          {header: "文件名称", dataIndex: "name", width: "20%"},
          {header: "版本", dataIndex: "version", width: "10%"},
          {header: "上传用户", dataIndex: "create_user_name", width: "15%"},
          {header: "上传时间", dataIndex: "create_time", width: "20%"},
          {
            text: "状态",
            dataIndex: "status",
            width: "8%",
            renderer: function (val) {
              return val == '0' ? "正常" : "作废";
            }
          },
          {header: "备注", dataIndex: "remark", width: "14.5%"},
          {
            header: "预览",
            dataIndex: "id",
            width: "10%",
            listeners: {
              click: {
                fn: me.onPreviewFile,
                scope: me
              }
            },
            renderer: function () {
              return "<a href='#'>预览</a>"
            }
          }
        ]
      }
    });

    return me.__filePanel;
  },
  onQuery: function () {

  },
  onClearQuery: function () {
    Ext.getCmp("editQueryName").setValue(null);
  },
  //得到选中的文件夹
  getSelectTreeNodeData: function (action) {
    let me = this;
    let panel = me.__tree;
    let selected = panel.getSelectionModel().selected;
    let id = selected.keys[0];
    if (!selected.map[id]) {
      return {};
    }
    let data = selected.map[id].data;
    data["action"] = action;
    return data;
  },
  //刷新树
  freshGrid: function () {
    var me = this;
    me.getTree().getStore().reload();
  },
  onAddDir: function () {
    var me = this;
    if (me.getAddDir() == "0") {
      return me.showInfo("没有权限");
    }
    var data = me.getSelectTreeNodeData("add");
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先选择添加文件夹的位置");
    var form = Ext.create("PSI.FileManager.AddOrEditDirForm", {
      parentForm: me,
      entity: data
    });
    form.show();
  },
  onEditDir: function () {
    var me = this;
    if (me.getEditDir() == "0") {
      return me.showInfo("没有权限");
    }
    var data = me.getSelectTreeNodeData("edit");
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先选择添加文件夹的位置");
    var form = Ext.create("PSI.FileManager.AddOrEditDirForm", {
      parentForm: me,
      entity: data
    });
    form.show();
  },
  onDeleteDir: function () {
    var me = this;
    if (me.getDeleteDir() == "0") {
      return me.showInfo("没有权限");
    }
    var data = me.getSelectTreeNodeData();
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先选择添加文件夹的位置");

    me.confirm("是否删除文件夹？", function () {
      me.ajax({
        url: me.URL("/Home/FileManager/deleteDir"),
        params: {
          id: data["id"]
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          me.showInfo(data['msg']);
          me.freshGrid();
        }
      })
    });
  },
  onInvalidDir: function () {
    var me = this;
    if (me.getInvalidDir() == "0") {
      return me.showInfo("没有权限");
    }
    var data = me.getSelectTreeNodeData();
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先选择添加文件夹的位置");

    me.confirm("确定将整个文件夹标记为作废？", function () {
      me.ajax({
        url: me.URL("/Home/FileManager/invalidDir"),
        params: {
          id: data['id']
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          me.showInfo(data["msg"]);
          me.freshGrid();
        }
      });
    });
  },
  //得到选中的文件
  getSelectFileNodeData: function () {
    let me = this;
    let panel = me.__filePanel;
    let selected = panel.getSelectionModel().selected;
    let id = selected.keys[0];
    if (!selected.map[id]) {
      return {};
    }
    let data = selected.map[id].data;
    return data;
  },
  //刷新文件列表
  freshPanel: function () {
    var me = this;
    me.getPanel().getStore().reload();
  },
  onUploadFile: function () {
    var me = this;
    if (me.getUpFile() == "0") {
      return me.showInfo("没有权限");
    }
    var data = me.getSelectTreeNodeData();
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先在左侧选择上传的位置");
    var form = Ext.create("PSI.FileManager.UploadMultiple", {
      parentForm: me,
      entity: data
    });
    form.show();
  },
  onUseDirUploadFile: function () {
    var me = this;
    if (me.getUpFile() == "0") {
      return me.showInfo("没有权限");
    }
    var data = me.getSelectTreeNodeData();
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先在左侧选择上传的位置");
    data['isFilesOrDir'] = true;
    var form = Ext.create("PSI.FileManager.UploadMultiple", {
      parentForm: me,
      entity: data
    });
    form.show();
  },
  onEditFile: function () {
    var me = this;
    var data = me.getSelectFileNodeData();
    if (Ext.JSON.encode(data) == "{}")
      return me.showInfo("请先选择要编辑的文件");
    var form = Ext.create("PSI.FileManager.EditFile", {
      parentForm: me,
      entity: data
    });
    form.show();
  },
  onDeleteFile: function () {
    var me = this;
    var data = me.__filePanel.getSelectionModel().getSelection();
    if (data.length == 0)
      return me.showInfo("请先选择需要操作的文件");
    me.confirm("您确定要删除这些文件吗？", function () {
      var idStr = "";
      Ext.each(data, function (file) {
        idStr += file['data']['id'] + ",";
      });
      me.ajax({
        url: me.URL("/Home/FileManager/deleteFiles"),
        params: {
          idStr: idStr
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          me.showInfo(data['msg']);
          me.freshPanel();
        }
      });
    });

  },
  onInvalidFile: function () {
    var me = this;
    var data = me.__filePanel.getSelectionModel().getSelection();
    if (data.length == 0)
      return me.showInfo("请先选择需要操作的文件");
    me.confirm("您确定要作废这些文件吗？", function () {
      var idStr = "";
      Ext.each(data, function (file) {
        if (file['data']['status'] == "0") {
          idStr += file['data']['id'] + ",";
        }
      });
      if (!idStr) {
        return me.showInfo("选择的文件都已作废");
      }
      me.ajax({
        url: me.URL("/Home/FileManager/invalidFiles"),
        params: {
          idStr: idStr
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          me.showInfo(data['msg']);
          me.freshPanel();
        }
      });
    });
  },
  onDownLoad: function () {
    var me = this;
    var data = me.__filePanel.getSelectionModel().getSelection();
    if (!data.length)
      return me.showInfo("请选择需要下载的文件");
    var idStr = "";
    Ext.each(data, function (file) {
      idStr += file['data']['id'] + ",";
    });
    me.ajax({
      url: me.URL("/Home/FileManager/downLoadFiles"),
      params: {
        idStr: idStr
      },
      success: function (response) {
        var data = me.decodeJSON(response['responseText']);
        if (data['success'])
          return window.open(data['msg']);
        me.showInfo(data['msg']);
      }
    });
  },
  onPreviewFile: function () {
    var me = this;
    var data = me.__filePanel.getSelectionModel().getSelection();
    if (!data.length)
      return me.showInfo("请选择需要预览的文件");
    var url = "";
    Ext.each(data, function (record) {
      me.ajax({
        url: me.URL("/Home/FileManager/convertFile"),
        params: {
          id: record['data']['id']
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          if (!data['success'])
            return me.showInfo(data['msg']);

          if (data['data']['ext'] == 'pdf') {
            url = me.URL("Public/pdfjs/web/viewer.html?file="
              + me.URL("Home/FileManager/previewFile/id/" +
                data['data']['id'] +
                "/ext/" + data['data']['ext']));
          } else {
            url = me.URL("Home/FileManager/previewFile?id=" +
              data['data']['id'] + "&ext=" + data['data']['ext']);
          }
          window.open(url);
        }
      });

    });

  },
  onLookActionLog: function () {
    var me = this;
    var form = Ext.create("PSI.ActionLog.ActionLog", {
      parentForm: me
    });
    form.show();
  },
  onFilePermission: function () {

  },
  onCheckFileInfo: function () {

  },
  onCheckFileVersions: function () {
    var me = this;
    var data = me.__filePanel.getSelectionModel().getSelection();
    var form = Ext.create("PSI.ActionLog.FileVersions", {
      parentForm: me,
      entity: data[0]['data']
    });
    form.show();
  }
});
