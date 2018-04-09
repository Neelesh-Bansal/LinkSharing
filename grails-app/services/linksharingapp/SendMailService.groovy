package linksharingapp

import grails.gorm.transactions.Transactional

@Transactional
class SendMailService {

    def mailService

    void sendMailMethod(String to1, String subject1, String html1) {

        mailService.sendMail {
            to to1
            subject subject1
            html html1
        }

    }

}
