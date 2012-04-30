package enterprise

class User {

    Long id
    Long version
    
    String email
    String password
    UserRole role
   
    String toString(){"$email"}
            
    static constraints = {
        email email:true, unique:true
        password blank:false, password:true
        role nullable:false
    }
}
