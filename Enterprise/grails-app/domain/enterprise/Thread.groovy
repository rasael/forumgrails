package enterprise

class Thread {
    
    String title
    String text
    //    String commitTest
    static hasMany = [posts:Post]
    static belongsTo = [argument:Argument]
    
    static constrains = {
        
        title blank:false, nullable:false, size:3..100
        text nullable:true,size:1..256
    }
}
