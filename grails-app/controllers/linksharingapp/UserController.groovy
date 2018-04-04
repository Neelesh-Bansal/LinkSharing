package linksharingapp

import linksharingapp.co.SearchCO
import linksharingapp.enumeration.Visibility

class UserController {

    def index() {
        render "User Dahsboard -- "
        render (session?.user?.username)
    }


    def show(){
        SearchCO searchCO = new SearchCO()
        searchCO.setQ("Topic0")
        searchCO.setMax(10)
        searchCO.setOffset(0)
        render(User?.getUnReadResources(searchCO))

    }

}
