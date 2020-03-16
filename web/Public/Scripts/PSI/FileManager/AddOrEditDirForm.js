Ext.define("PSI.FileManager.AddOrEditDirForm", {
  extend: "PSI.AFX.BaseDialogForm",
  initComponent: function () {
    var me = this;
    var entity = me.getEntity();

    var t = entity["action"] == "add" ? "新增文件夹" : "编辑文件夹";
    var f = entity["action"] != "add"
      ? "edit-form-update.png"
      : "edit-form-create.png";
    var logoHtml = "<img style='float:left;margin:10px 20px 0px 10px;width:48px;height:48px;' src='"
      + PSI.Const.BASE_URL
      + "Public/Images/"
      + f
      + "'></img>"
      + "<h2 style='color:#196d83'>"
      + t
      + "</h2>"
      + "<p style='color:#196d83'>标记 <span style='color:red;font-weight:bold'>*</span>的是必须录入数据的字段</p>";

    Ext.apply(me, {
      header: {
        title: me.formatTitle(PSI.Const.PROD_NAME),
        height: 40
      },
      width: 400,
      height: 330,
      layout: "border",
      items: [{
        region: "north",
        border: 0,
        height: 90,
        html: logoHtml
      }, {
        region: "center",
        border: 0,
        id: "PSI_FileManager_AddOrEditDirForm",
        xtype: "form",
        layout: {
          type: "table",
          columns: 1
        },
        height: "100%",
        bodyPadding: 5,
        defaultType: 'textfield',
        fieldDefaults: {
          labelWidth: 60,
          labelAlign: "right",
          labelSeparator: "",
          msgTarget: 'side'
        },
        items: [{
          xtype: "hidden",
          name: "id",
          value: entity["action"] == "add" ? "" : entity['id']
        }, {
          id: "PSI_FileManager_AddOrEditDirForm_DirName",
          fieldLabel: "文件夹名",
          allowBlank: false,
          blankText: "没有输入文件名",
          beforeLabelTextTpl: PSI.Const.REQUIRED,
          name: "dirName",
          value: entity["action"] == "add" ? "" : entity['name'],
          listeners: {
            specialkey: {
              fn: me.onEditNameSpecialKey,
              scope: me
            }
          },
          width: 370
        }, {
          id: "PSI_FileManager_AddOrEditDirForm_ParentDirId",
          xtype: "hidden",
          name: "parentDirID",
          value: entity["action"] == "add" ? entity['id'] : entity['parent_dir_id']
        }, {
          id: "PSI_FileManager_AddOrEditDirForm_Remark",
          fieldLabel: "描述",
          name: "remark",
          width: 370,
          value: entity["action"] == "add" ? "" : entity['remark']
        }],
        buttons: [{
          text: "确定",
          formBind: true,
          iconCls: "PSI-button-ok",
          handler: me.onOK,
          scope: me
        }, {
          text: "取消",
          handler: function () {
            me.confirm("请确认是否取消操作?", function () {
              me.close();
            });
          },
          scope: me
        }]
      }],
      listeners: {
        close: {
          fn: me.onWndClose,
          scope: me
        }
      }
    });

    me.callParent(arguments);
    me.parentDirId = Ext.getCmp("PSI_FileManager_AddOrEditDirForm_ParentDirId");
    me.dirName = Ext.getCmp("PSI_FileManager_AddOrEditDirForm_DirName");
    me.remark = Ext.getCmp("PSI_FileManager_AddOrEditDirForm_Remark");

    me.form = Ext.getCmp("PSI_FileManager_AddOrEditDirForm");
  },
  onWindowBeforeUnload: function (e) {
    return (window.event.returnValue = e.returnValue = '确认离开当前页面？');
  },
  onWndClose: function () {
    var me = this;
    Ext.get(window).un('beforeunload', me.onWindowBeforeUnload);
  },
  onEditNameSpecialKey: function (field, e) {
    var me = this;
    if (e.getKey() == e.ENTER) {
      me.dirName.focus();
    }
  },
  onOK: function () {
    var me = this;
    var f = me.form;
    var el = f.getEl();
    el.mask("数据保存中...");
    f.submit({
      url: me.URL("Home/FileManager/addOrEditDir"),
      method: "POST",
      success: function (form, action) {
        el.unmask();
        me.close();
        me.getParentForm().freshGrid();
      },
      failure: function (form, action) {
        el.unmask();
        me.showInfo(action["result"]["msg"]);
      }
    });
  }
});
