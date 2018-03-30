package linksharingapp

class User {

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

    static constraints = {
        email(unique: true, email: true, nullable: false)
        username(unique: true, email: true, nullable: false)
        password(blank: false, size: 5..20, nullable: false)
        firstName(blank: false, nullable: false)
        lastName(blank: false, nullable: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)

    }
}
