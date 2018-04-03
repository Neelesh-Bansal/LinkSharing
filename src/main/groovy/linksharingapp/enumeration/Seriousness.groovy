package linksharingapp.enumeration

    enum Seriousness {
            SERIOUS,VERY_SERIOUS,CASUAL

        static Seriousness stringToEnum(String seriousness){
            return Seriousness.valueOf(seriousness)
        }
    }

