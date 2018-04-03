package linksharingapp

import linksharingapp.co.ResourceSearchCO

abstract class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy:User, topic:Topic]

    static hasMany = [ratings:ResourceRating, readingItems:ReadingItem]

    static constraints = {

        description(type: 'text')
    }

    static namedQueries = {
        search {ResourceSearchCO resourceSearchCO ->
                eq('topic.id', resourceSearchCO.topicId)
        }
    }

}
