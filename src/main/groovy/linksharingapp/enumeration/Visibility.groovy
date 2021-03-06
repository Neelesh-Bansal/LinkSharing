package linksharingapp.enumeration

enum Visibility {
    PUBLIC, PRIVATE

    static Visibility stringToEnum(String visibility) {
        return Visibility.valueOf(visibility)
    }
}
