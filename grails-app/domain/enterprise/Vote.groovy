package enterprise

class Vote {

    int value
    static belongsTo = [post:Post]

    def constraint = {
        value > 0;
        value <= 10;
    }
}
