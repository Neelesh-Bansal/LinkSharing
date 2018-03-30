package linksharingapp

import java.beans.Visibility

class Topic {

    String name
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
