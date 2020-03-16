Ext.define("PSI.ActionLog.ActionLog", {
  extend: "PSI.AFX.BaseDialogForm",
  initComponent: function () {
    var me = this;

    var modelName = "ActionLogModel";
    Ext.define(modelName, {
      extend: "Ext.data.Model",
      fields: ['id', 'create_user_name', 'create_time', 'content']
    });

    var myStore = Ext.create('Ext.data.Store', {
      model: modelName,
      autoLoad: true,
      pageSize: 15,
      proxy: {
        type: 'ajax',
        url: me.URL("Home/ActionLog/loadActionLog"),
        actionMethods: {
          read: "POST"
        },
        extraParams: {},
        reader: {
          type: 'json',
          root: 'dataList',
          totalProperty: 'totalCount'
        }
      }
    });

    Ext.apply(me, {
      title: '版本记录',
      cls: "PSI",
      width: "55%",
      height: "90%",
      id: "ActionLogWindow",
      autoScroll: true,
      modal: true,
      Layout: "fit",
      items: [{
        xtype: 'grid',
        id: "LogGrid",
        border: false,
        sortableColumns: false,
        autoScroll: true,
        columns: {
          defaults: {
            sortable: false,
            menuDisabled: true,
            draggable: false
          },
          items: [
            {
              text: "操作内容",
              dataIndex: "content",
              width: "50%"
            },
            {
              text: '操作时间',
              dataIndex: "create_time",
              width: "25%"
            },
            {
              text: '操作人',
              dataIndex: "create_user_name",
              width: "25%"
            }]
        },
        store: myStore,
        bbar: [
          "->", {
            id: "filePagingToobar",
            xtype: "pagingtoolbar",
            border: 0,
            store: myStore
          },
          "-",
          {
            xtype: "displayfield",
            value: "每页显示"
          }, {
            id: "fileComboCountPerPage",
            xtype: "combobox",
            editable: false,
            width: 60,
            store: Ext.create("Ext.data.ArrayStore", {
              fields: ["text"],
              data: [["5"], ["15"], ["50"], ["100"]]
            }),
            value: 15,
            listeners: {
              change: {
                fn: function () {
                  myStore.pageSize = Ext.getCmp("fileComboCountPerPage").getValue();
                  myStore.currentPage = 1;
                  Ext.getCmp("filePagingToobar").doRefresh();
                },
                scope: me
              }
            }
          }, {
            xtype: "displayfield",
            value: "条记录"
          }]
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
    var grid = Ext.getCmp("LogGrid");
    var data = grid.getSelectionModel().getSelection();
    if (!data.length)
      return me.showInfo("请先选择需要撤回的内容");
    return me.confirm("是否撤回选中版本?", function () {
      me.ajax({
        url: me.URL("Home/ActionLog/revokeVersion"),
        params: {
          id: data[0]['internalId']
        },
        success: function (response) {
          var data = me.decodeJSON(response.responseText);
          if (data) {
            me.showInfo(data['msg'], function () {
              me.getParentForm().freshGrid();
              me.getParentForm().freshPanel();
              me.close();
            });
          }
        }
      })
    });
  }
});
