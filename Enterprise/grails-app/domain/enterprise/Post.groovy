package enterprise

class Post {
    
    String text
    Date date = new Date()
    User author
    
    static hasMany = [votes:Vote]
    static belongsTo = [thread:Thread]
    
    static constrains = {
        text blank:false,nullable:false,size:1..1024
        date blank:false,nullable:false
        author nullable:true
    }
}
