package linksharingapp

class User {

    String name
    String email
    String username
    String password
    String confirmPassword
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
        confirmPassword(nullable: true,blank: true)
        firstName(blank: false, nullable: false)
        lastName(blank: false, nullable: false)
        photo(nullable: true, sqlType: 'longblob')
        admin(nullable: true)
        active(nullable: true)
        password(nullable: false,blank: false,minSize: 5 ,validator: { password, obj ->
            def newPassword = obj.confirmPassword
            password == newPassword ? true : ['invalid.passwordmismatch']
        })

    }
    static transients = ['name','confirmPassword']


    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                '}';
    }
}
