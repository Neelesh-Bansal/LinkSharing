package linksharingapp

import grails.gorm.transactions.Transactional
import linksharingapp.dto.EmailDTO

@Transactional
class UnreadItemService {

    boolean lazyInit = false

    SendMailService sendMailService

    def unreaditem() {

        List<User> userList = User.findAll()
        List<String> topicName = []
        List<String> createdBy =[]

        userList.each { user ->
            List<ReadingItem> readingItemList = ReadingItem.findAllByUserAndIsRead(user, false)

            readingItemList.resource.each { list ->

                topicName.add(list.topic.topicName)
                createdBy.add(list.createdBy.getName())
            }

            EmailDTO emailDTO = new EmailDTO(to: user.email, subject: "Unread Resources", itemList: topicName, createrList:createdBy )

            sendMailService.sendUnreadResourcesEmail(emailDTO)


            topicName = []
            createdBy=[]

        }
    }

    def inbox(User user) {

        List result=[]

        List<ReadingItem> readingItemList = ReadingItem.findAllByUserAndIsRead(user, false)

        readingItemList.resource.each { list ->
            result.add(list)
        }
    }
}
