package linksharingapp

class AdminController {

    def index() {

    }

    def userList(){
        List<User> users = User.findAll()
        render(view: '/admin/demo', model: [user1:users])
        //render(template: '/admin/allUsers',collection: users,var: 'user1')
    }
}
