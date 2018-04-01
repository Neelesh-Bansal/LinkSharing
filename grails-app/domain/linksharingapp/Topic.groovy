package linksharingapp

import enumeration.Visibility
import enumeration.Seriousness
class Topic {

    String name
    User createdBy
    static belongsTo = [createdBy:User]
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions:Subscription,resources:Resource]

    static constraints = {
        name(unique: 'createdBy', blank: false, nullable: false)
        visibility(enum: true,nullable: false)
        createdBy(nullable: false)
    }

    def afterInsert(){
        Topic.withNewSession {
            Subscription subscription = new Subscription(topic: this,user: createdBy, seriousness: Seriousness.VERY_SERIOUS)
            this.addToSubscriptions(subscription)
            subscription.save()
//            if (subscription.save(flush:true)){
//                log.info("Subscription saved  - ${this.addToSubscriptions(subscription)}")
//            }
//            else {
//                log.info("Subscription not saved Error - ${subscription.hasErrors()}")
//            }
        }
    }
}
