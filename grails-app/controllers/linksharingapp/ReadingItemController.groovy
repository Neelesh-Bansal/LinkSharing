package linksharingapp

class ReadingItemController {

    def index() {}

    def changeIsRead(Long id) {
        Resource resource = Resource.findById(id)
        ReadingItem readingItem = ReadingItem.findByUserAndResource(session.user, resource)
        if ((ReadingItem.executeUpdate('update ReadingItem set isRead=:isRead where id=:id1', [isRead: readingItem.isRead, id1: id])) == 0) {
            render("error")
        } else {
            render("success")
        }
    }

}
