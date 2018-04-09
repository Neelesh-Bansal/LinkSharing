package linksharingapp

import linksharingapp.enumeration.Seriousness
import org.springframework.transaction.annotation.Transactional

class SubscriptionController {

    def index() {}

    def save(Long id) {
        Topic topic = Topic.findById(id)
        Subscription subscription = new Subscription(user: session.user, topic: topic)
        Subscription.withNewTransaction {
            if (subscription.save()) {
                flash.message="Success"
                render(controller: 'login', action: 'index')
            }
            else {
                flash.error = "Unsuccess"
                render(controller: 'login', action: 'index')
            }
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
                flash.message="Success"
                render(controller: 'login', action: 'index')
            } else {
                flash.error = "Error while deleting"
                render(controller: 'login', action: 'index')
            }
        }
    }
}
