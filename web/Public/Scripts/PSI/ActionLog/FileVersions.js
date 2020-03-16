Ext.define("PSI.ActionLog.FileVersions", {
  extend: "PSI.AFX.BaseDialogForm",
  initComponent: function () {
    var me = this;
    var entity = me.getEntity();
    var modelName = "FileVersionModel";
    Ext.define(modelName, {
      extend: "Ext.data.Model",
      fields: ['id', 'create_user_name', 'create_time', 'name', 'version',
        'edit_user_name', 'edit_time', 'remark']
    });

    var myStore = Ext.create('Ext.data.Store', {
      model: modelName,
      autoLoad: true,
      pageSize: 15,
      proxy: {
        type: 'ajax',
        url: me.URL("Home/ActionLog/getFileVersions"),
        actionMethods: {
          read: "POST"
        },
        extraParams: {
          id: entity['id']
        },
        reader: {
          type: 'json'
        }
      }
    });

    Ext.apply(me, {
      title: '文件历史版本',
      cls: "PSI",
      width: "55%",
      height: "90%",
      id: "FileVersionsWindow",
      autoScroll: true,
      modal: true,
      Layout: "column",
      items: [{
        xtype: 'grid',
        id: "VersionGrid",
        height: "90%",
        border: false,
        sortableColumns: false,
        autoScroll: true,
        listeners: {
          itemClick: {
            fn: function (node, record) {
              Ext.get("FileActionInfo").dom.innerHTML = record.data.remark;
            },
            scope: me
          }
        },
        columns: {
          defaults: {
            sortable: false,
            menuDisabled: true,
            draggable: false
          },
          items: [
            {
              text: "版本号",
              dataIndex: "version",
              width: "13%"
            },
            {
              text: '文件名',
              dataIndex: "name",
              width: "21%",
              listeners: {
                click: {
                  fn: me.onPreviewFile,
                  scope: me
                }
              },
              renderer: function (name) {
                return "<a href='#'>" + name + "</a>";
              }
            },
            {
              text: '创建人',
              dataIndex: "create_user_name",
              width: "15%"
            },
            {
              text: '创建时间',
              dataIndex: "create_time",
              width: "18%"
            },
            {
              text: '编辑人',
              dataIndex: "edit_user_name",
              width: "15%"
            },
            {
              text: '编辑时间',
              dataIndex: "edit_time",
              width: "18%"
            }]
        },
        store: myStore
      },
        {
          xtype: "panel",
          width: "100%",
          id: "action_panel",
          height: 175,
          html: "<textarea id='FileActionInfo' readonly style='border: none;width: 100%;height: 175px;'></textarea>"
        }],
      buttons: [
        {
          text: "撤回到选中版本",
          handler: me.onOk,
          scope: me
        }
      ]
    });

    me.callParent(arguments);
  },
  onOk: function () {
    var me = this;
    var entity = me.getEntity();
    var data = Ext.getCmp("VersionGrid").getSelectionModel().getSelection();
    if (!data.length)
      return me.showInfo("请选择需要退回的版本");
    if (data[0]["data"]['id'] == entity['id'])
      return me.showInfo("选择的版本是当前版本，请选择旧版本");
    me.confirm("是否退回到对应的版本?", function () {
      me.ajax({
        url: me.URL("/Home/ActionLog/revokeFile"),
        params: {
          oldId: data[0]["data"]['id'],
          currentId: entity['id']
        },
        success: function (response) {
          var data = me.decodeJSON(response['responseText']);
          me.showInfo(data['msg']);
          me.getParentForm().freshPanel();
          me.close();
        }
      });
    });
  },
  onPreviewFile: function () {
    var me = this;
    var data = Ext.getCmp("VersionGrid").getSelectionModel().getSelection();
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

  }
});
