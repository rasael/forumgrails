package enterprise

class Thread {
    
    String title
    String text
    Date date = new Date()
    User author
    
    //    String commitTest
    static hasMany = [posts:Post]
    static belongsTo = [argument:Argument]
    
    static constrains = {
        
        title blank:false, nullable:false, size:3..100
        text nullable:true,size:1..256
        date blank:false,nullable:false
        author nullable:true
    }
}
