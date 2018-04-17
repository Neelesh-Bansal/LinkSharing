package linksharingapp

class SendNotificationJob {
    boolean lazyInit = false

    UnreadItemService unreadItemService


    static triggers = {
        cron name: 'cronTrigger', cronExpression: '0 0 1 ? * MON *'
        //every monday at 1 AM from http://www.cronmaker.com/
    }

    def execute() {
        // execute job
        unreadItemService.unreaditem()
    }
}
