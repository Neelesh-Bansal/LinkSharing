package linksharingapp

class SubscriptionController {

    def index() {}

    def save(Long id) {
        Topic topic = Topic.findById(id)
        Subscription subscription = new Subscription(user: session.user, topic: topic)
        Subscription.withNewTransaction {
            if (subscription.save()) {
                flash.message = "Success"
                render(controller: 'login', action: 'index')
            } else {
                flash.error = "Unsuccess"
                render(controller: 'login', action: 'index')
            }
        }
    }

    def update() {
        Subscription subscription = Subscription.findById(params.id)
//        Seriousness seriousnes = Seriousness.stringToEnum(params.value)
        Subscription.withNewTransaction {
            if (subscription) {
                subscription.seriousness = params.seriousness
                subscription.save()
                flash.message = "Seriousness Updated"
                redirect(controller: 'login', action: 'index')
            } else {
                flash.error = "Seriousness Not Updated"
                redirect(controller: 'login', action: 'index')
            }
        }
    }

    def delete(Long id) {
        Subscription subscription = Subscription.load(id)
        Subscription.withNewTransaction {
            if (subscription) {
                subscription.delete(flush: true)
                flash.message = "Success"
                redirect(controller: 'login', action: 'index')
            } else {
                flash.error = "Error while deleting"
                redirect(controller: 'login', action: 'index')
            }
        }
    }
}
