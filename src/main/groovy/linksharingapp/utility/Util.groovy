package linksharingapp.utility

class Util {
    static getRandomPassword() {
        Random random = new Random()
        int randomPassword = 100000 + random.nextInt(9999)
    }
}
