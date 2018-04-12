package linksharingapp

class AdminController {

    def index() {

    }

    def userList(){

        def max = params.max?:3
        def offset = params.offset?:0
        println("=========")
        List<User> users = User.list(max:max, offset: offset)

        println(users)

        println(users.getTotalCount())
        render(view: '/admin/demo', model: [user1:users,total:users.getTotalCount()])
        //render(template: '/admin/allUsers',collection: users,var: 'user1')
    }
}
