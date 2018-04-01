package linksharingapp

abstract class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy:User, topic:Topic]


    static constraints = {

        description(type: 'text')
    }

}
