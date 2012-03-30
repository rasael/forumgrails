package enterprise

class Post {
    
    String text
    Date date
    
    static hasMany = [votes:Vote]
    static belongsTo = [thread:Thread]
}
