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



    User(String email, String username, String password, String firstName, String lastName, byte photo, Boolean admin, Boolean active) {
        this.email = email
        this.username = username
        this.password = password
        this.firstName = firstName
        this.lastName = lastName
        this.photo = photo
        this.admin = admin
        this.active = active
    }

    static constraints = {
        email(unique: true, email: true, nullable: false)
        username(unique: true, nullable: false)
        password(blank: false, minSize: 5, nullable: false)
        firstName(blank: false, nullable: false)
        lastName(blank: false, nullable: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)

    }

    String toString(){
        return firstName
    }
}
