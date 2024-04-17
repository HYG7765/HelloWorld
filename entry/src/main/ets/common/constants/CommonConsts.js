import relationalStore from '@ohos.data.relationalStore';
import DDLDetail from '../bean/DDLDetailClass';
export default class CommonConstants {
}
CommonConstants.STORE_CONFIG = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
};
CommonConstants.PREF_STORE_CONFIG = {
    name: 'pref_database.db',
    securityLevel: relationalStore.SecurityLevel.S1
};
CommonConstants.CATEGORY_STORE_CONFIG = {
    name: 'category_database.db',
    securityLevel: relationalStore.SecurityLevel.S1
};
CommonConstants.TASK_TABLE_INIT = {
    tableName: 'taskTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS taskTable' +
        '(id INTEGER PRIMARY KEY AUTOINCREMENT, task_name TEXT, ' +
        'subject INTEGER, start_date_stamp INTEGER, due_date_stamp INTEGER, ' +
        'is_completed BOOLEAN, detail TEXT, ddl_detail TEXT, category INTEGER, topped BOOLEAN)',
    columns: ['id', 'due_date_stamp', 'start_date_stamp', 'subject', 'detail', 'task_name', 'is_completed', 'ddl_detail', 'category', 'topped']
};
CommonConstants.PREF_TABLE_INIT = {
    tableName: 'prefTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS prefTable' +
        '(id INTEGER PRIMARY KEY AUTOINCREMENT, pref TEXT)',
    columns: ['id', 'pref']
};
CommonConstants.CATEGORY_TABLE_INIT = {
    tableName: 'categoryTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS categoryTable' +
        '(id INTEGER PRIMARY KEY AUTOINCREMENT, color TEXT, name TEXT)',
    columns: ['id', 'color', 'name']
};
CommonConstants.RDB_TAG = "[DebugRDB]";
CommonConstants.DDL_COLOR = {
    easy: '#A5D61D',
    medium: '#F7CE00',
    hard: '#F9A01E',
    critical: '#E84026'
};
CommonConstants.COLUMN_TYPE = {
    id: 'double',
    due_date_stamp: 'double',
    start_date_stamp: 'double',
    category: 'double',
    subject: 'string',
    detail: 'string',
    task_name: 'string',
    is_completed: 'boolean',
    ddl_detail: 'string',
    topped: 'boolean',
};
CommonConstants.DDL_DETAIL_PRESET = [
    new DDLDetail('不急', '0.2-0.45-0.6'),
    new DDLDetail('放松', '0.2-0.5-0.8'),
    new DDLDetail('正常', '0.3-0.5-0.8'),
    new DDLDetail('紧急', '0.3-0.75-0.9'),
    new DDLDetail('非常紧急', '0.5-0.8-0.99')
];
CommonConstants.CATEGORY_COLOR = [
    '#564AF7',
    '#46B1E3',
    '#64BB5C',
    '#A5D61D',
    '#AC49F5',
    '#E64566',
    '#E84026',
    '#ED6F21'
];
CommonConstants.BACKUP_FILEPATH = "Document/HomeworkTasklist/backup/";
CommonConstants.BACKUP_FILE = "backup.png";
//# sourceMappingURL=CommonConsts.js.map