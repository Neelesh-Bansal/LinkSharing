package linksharingapp

import linksharingapp.enumeration.Seriousness;

class Subscription {

    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated
    Date lastUpdated


    static belongsTo = [user:User, topic:Topic]

    static constraints = {

        user(nullable: false,unique: 'topic')
        topic(nullable: false)
        seriousness(nullable: false)
    }
}
