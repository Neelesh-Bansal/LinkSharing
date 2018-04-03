package linksharingapp

import linksharingapp.enumeration.Seriousness
import org.springframework.transaction.annotation.Transactional

class SubscriptionController {

    def index() {}

    def save(Long id) {
        Topic topic = Topic.findById(id)
        Subscription subscription = new Subscription(user: session.user, topic: topic)
        Subscription.withNewTransaction {
            if (subscription.save())
                render("success")
            else
                render("error")
        }
    }

    def update(Long id, String serious) {
        Subscription subscription = Subscription.findById(id)
        Seriousness seriousnes = Seriousness.stringToEnum(serious)
        Subscription.withNewTransaction {
            if (subscription) {
                subscription.seriousness = seriousnes
                subscription.save()
                    render("Success")
                }
            else {
                render("Subscription not found")
            }
        }
    }

    def delete(Long id) {
        Subscription subscription = Subscription.get(id)
        Subscription.withNewTransaction {
            if (subscription) {
                subscription.delete()
                render("Success")
            } else {
                render("Subscription not found with this id - ${id}")
            }
        }
    }
}
