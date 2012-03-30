package enterprise

class Argument {
    
    String name
    static hasMany = [threads:Thread]
    static belongsTo = [course:Course]
    
}
