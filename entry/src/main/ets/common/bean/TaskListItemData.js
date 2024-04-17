var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import Logger from '../utils/Logger';
let TaskListItemData = class TaskListItemData {
    constructor() {
        this.id = -1;
        this.start_date_stamp = 0;
        this.due_date_stamp = 0;
        this.detail = '';
        this.subject = 0;
        this.task_name = '';
        this.is_completed = false;
        this.ddl_detail = '0.3-0.5-0.8';
        this.ddl_state = {
            critical: 0.3,
            hard: 0.5,
            medium: 0.8
        };
        this.category = 1;
        this.categoryName = '';
        this.topped = false;
    }
    setAll(categoryList) {
        let ddl_arr = this.ddl_detail.split('-');
        Logger.debug(`TaskDDL Info: arr = ${JSON.stringify(ddl_arr)}, det = ${this.ddl_detail}`);
        this.ddl_state.critical = Number(ddl_arr[0]);
        this.ddl_state.hard = Number(ddl_arr[1]);
        this.ddl_state.medium = Number(ddl_arr[2]);
        this.setCategoryName(categoryList);
    }
    setCategoryName(categoryList) {
        for (let i = 0; i < categoryList.length; ++i) {
            if (categoryList[i].id == this.category) {
                this.categoryName = categoryList[i].name;
                break;
            }
        }
    }
    getDDLState() {
        let taskFullTime = this.due_date_stamp - this.start_date_stamp;
        let nowTime = new Date();
        let remainingTime = this.due_date_stamp - nowTime.getTime();
        let resultPercentage = remainingTime / taskFullTime;
        Logger.debug(`TaskDDL State: full = ${taskFullTime}, remaining = ${remainingTime}, per = ${resultPercentage}`);
        Logger.debug(`TaskDDL ------ due: ${new Date(this.due_date_stamp).toString()}, now: ${new Date().toString()}, start: ${new Date(this.start_date_stamp).toString()}`);
        Logger.debug(`TaskDDL ------: arr = ${JSON.stringify(this.ddl_state)}`);
        if (remainingTime < 0)
            return 'critical';
        if (resultPercentage < this.ddl_state.critical)
            return 'critical';
        else if (resultPercentage < this.ddl_state.hard)
            return 'hard';
        else if (resultPercentage < this.ddl_state.medium)
            return 'medium';
        else
            return 'easy';
    }
    getDDLPer() {
        let taskFullTime = this.due_date_stamp - this.start_date_stamp;
        let nowTime = new Date();
        let remainingTime = this.due_date_stamp - nowTime.getTime();
        if (remainingTime <= 0)
            return 0;
        let resultPercentage = remainingTime / taskFullTime;
        return resultPercentage * 100;
    }
};
TaskListItemData = __decorate([
    Observed
], TaskListItemData);
export { TaskListItemData };
//# sourceMappingURL=TaskListItemData.js.map