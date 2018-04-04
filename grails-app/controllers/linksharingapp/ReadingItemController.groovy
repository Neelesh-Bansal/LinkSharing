package linksharingapp

class ReadingItemController {

    def index() { }

    def changeIsRead(Long id,boolean isRead) {
        ReadingItem.withNewTransaction {
            if (ReadingItem.executeUpdate("update ReadingItem set isRead=:isRead where id=:id", [isRead: isRead, id: id]) == 0) {
                render("error")
            } else
                render("success")
        }
    }

}
