package enterprise

class Thread {
    String title
    String text
    static hasMany = [posts:Post]
    static belongsTo = [argument:Argument]
}
