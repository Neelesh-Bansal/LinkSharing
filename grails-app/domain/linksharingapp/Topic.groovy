package linksharingapp

import enumeration.Visibility

class Topic {

    String name
    User createdBy
    static belongsTo = [createdBy:User]
    Date dateCreated
    Date lastUpdated
    Visibility visibility



    static constraints = {
        name(unique: 'createdBy', blank: false, nullable: false)
        visibility(enum: true,nullable: false)
        createdBy(nullable: false)
    }
}
