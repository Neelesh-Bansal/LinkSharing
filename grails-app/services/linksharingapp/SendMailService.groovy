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


    def sendInvitation(EmailDTO emailDTO)
    {
        println("in email service")
        mailService.sendMail {
            to emailDTO.to
            subject emailDTO.subject
            html view: '/email/_invite', model: [link: "${emailDTO.linkId}",email:"${emailDTO.to}"]
        }
    }

}
