package linksharingapp

import linksharingapp.enumeration.Seriousness

class SubscriptionController {

    def index() {}

    def save(Long id) {
        Topic topic = Topic.findById(id)
        Subscription subscription = new Subscription(user: session.user, topic: topic)
        if (subscription.save())
            render("success")
        else
            render("error")
    }

    def update(Long id, String serious) {
        Subscription subscription = Subscription.findById(id)
        Seriousness seriousnes = Seriousness.stringToEnum(serious)
        if (subscription) {
            subscription.seriousness = seriousnes
            if (subscription.save()) {
                render("Success")
            } else {
                render("Subscription not saved")
            }

        } else {
            render("Subscription not found")
        }


    }

    def delete(Long id) {
        Subscription subscription = Subscription.load(id)
        if (subscription) {
            subscription.delete()
            render("Success")
        } else {
            render("Subscription not found with this id - ${id}")
        }
    }
}
