package linksharingapp

class User {

    String name
    String email
    String username
    String password
    String firstName
    String lastName
    byte photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated

    static hasMany = [topics:Topic , subscriptions:Subscription , readingItems:ReadingItem, resources:Resource]

    String getName() {
        this.name = this.firstName+ " " +this.lastName
        return name
    }
    static constraints = {
        email(unique: true, email: true, nullable: false)
        username(unique: true, nullable: false)
        password(blank: false, minSize: 5, nullable: false)
        firstName(blank: false, nullable: false)
        lastName(blank: false, nullable: false)
        photo(nullable: true, sqlType: 'longblob')
        admin(nullable: true)
        active(nullable: true)

    }
    static transients = ['name']

    String toString(){
        return firstName
    }
}
