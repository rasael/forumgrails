package enterprise

class Course {

    String name
    Set<Argument> arguments
    static hasMany = [arguments:Argument]

}
