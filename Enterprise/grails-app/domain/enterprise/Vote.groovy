package enterprise

class Vote {

    int value
    static belongsTo = [post:Post]

    def constraint = {
        value (min: 0, max:10)
    }
}
