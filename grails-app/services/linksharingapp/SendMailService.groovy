package linksharingapp

import grails.gorm.transactions.Transactional
import linksharingapp.dto.EmailDTO
import org.springframework.context.MessageSource

@Transactional
class SendMailService {

    static transactional = false
    def mailService

    def sendMail(EmailDTO emailDTO) {
        mailService.sendMail {
            to emailDTO.to
            subject emailDTO.subject
            body emailDTO.content
        }
    }


    def sendInvitation(EmailDTO emailDTO) {
        mailService.sendMail {
            to emailDTO.to
            subject emailDTO.subject
            html view: '/email/_invite', model: [link: "${emailDTO.linkId}", email: "${emailDTO.to}"]
        }
    }

    def sendUnreadResourcesEmail() {
        mailService.sendMail {
            to emailDTO.to
            subject emailDTO.subject
            html view: "/email/UnreadResources", model: [list1: "${emailDTO.itemList}", list2: "${emailDTO.createrList}"]
        }
    }

}
