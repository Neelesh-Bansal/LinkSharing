package linksharingapp

class ResourceRating {

    Resource resource
    User user
    Integer score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user: User, resource: Resource]

    static constraints = {
        resource(nullable: false,unique: 'user')//ResoureRating can be given by a user only one time for a resource
        user(nullable: false)
        score(nullable: false,min: 1, max: 5)
    }
}
