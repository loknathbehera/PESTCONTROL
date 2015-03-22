Ext.require(['Ext.data.*', 'Ext.grid.*']);

Ext.define('Employee', {
    extend: 'Ext.data.Model',
    fields: [{
        name: 'id',
        type: 'int',
        useNull: true
    }, 'dept', 'firstName', 'lastName'],
    validations: [{
        type: 'length',
        field: 'dept',
        min: 1
    }, {
        type: 'length',
        field: 'firstName',
        min: 1
    }, {
        type: 'length',
        field: 'lastName',
        min: 1
    }]
});

Ext.onReady(function(){

    var store = Ext.create('Ext.data.Store', {
        autoLoad: true,
        autoSync: true,
        model: 'Employee',
        proxy: {
            type: 'rest',
            url: restSource,
            reader: {
                type: 'json',
                root: 'data'
            },
            writer: {
                type: 'json'
            }
        },
        listeners: {
            write: function(store, operation){
                var record = operation.records[0],
                    name = Ext.String.capitalize(operation.action),
                    verb;
                    
                if (name == 'Destroy') {
                    verb = 'Destroyed';
                } else {
                    verb = name + 'd';
                }
                Ext.example.msg(name, Ext.String.format("{0} user: {1}", verb, record.getId()));
                
            }
        }
    });
    
    var rowEditing = Ext.create('Ext.grid.plugin.RowEditing');
    
    var grid = Ext.create('Ext.grid.Panel', {
        renderTo: 'employee-table',
        plugins: [rowEditing],
        width: 400,
        height: 300,
        frame: true,
        title: 'Users',
        store: store,
        iconCls: 'icon-user',
        columns: [{
            text: 'ID',
            width: 40,
            sortable: true,
            dataIndex: 'id',
            renderer: function(v){
                if (Ext.isEmpty(v)) {
                    v = '&#160;';
                }
                return v;
            }
        }, {
            text: 'dept',
            flex: 1,
            sortable: true,
            dataIndex: 'dept',
            field: {
                xtype: 'textfield'
            }
        }, {
            header: 'firstName',
            width: 80,
            sortable: true,
            dataIndex: 'firstName',
            field: {
                xtype: 'textfield'
            }
        }, {
            text: 'lastName',
            width: 80,
            sortable: true,
            dataIndex: 'lastName',
            field: {
                xtype: 'textfield'
            }
        }]
    });
});
