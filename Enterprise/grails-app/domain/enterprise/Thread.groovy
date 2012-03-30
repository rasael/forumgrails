package enterprise

class Thread {
    String title
    String text
    String commitTest
    static hasMany = [posts:Post]
    static belongsTo = [argument:Argument]
}
