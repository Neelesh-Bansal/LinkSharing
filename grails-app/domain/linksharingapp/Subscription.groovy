package linksharingapp

import enumeration.Seriousness;

class Subscription {

    Topic topic
    User user
    Date dateCreated
    Date lastUpdated
    Seriousness seriousness

    static belongsTo = [user:User, topic:Topic]

    static constraints = {

        user(nullable: false,unique: 'topic')
        topic(nullable: false)
        seriousness(nullable: false)
    }
}
