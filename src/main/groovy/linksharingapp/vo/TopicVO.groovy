package linksharingapp.vo

import linksharingapp.User
import linksharingapp.enumeration.Visibility

class TopicVO {

    Long id
    String name
    Visibility visibility
    Integer count
    User createdBy


    @Override
    public String toString() {
        return "TopicVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", visibility=" + visibility +
                ", count=" + count +
                ", createdBy=" + createdBy +
                '}'
    }
}
