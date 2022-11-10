import Foundation



struct Pokemon {
    
    let damageRelations : [DamageType]
    let gameIndices : [GenIdx]
    let generation : NameUrl
    let id : Int
    let moveDamageClass: NameUrl
    let moves : NameUrl
    let name : String
    let pokemon : [Poke]
    
}

struct DamageType {
    
    let dobleDamageFrom : [NameUrl]
    let dobleDamageTo : [NameUrl]
    let halfDamageFrom : [NameUrl]
    let halfDamageTo : [NameUrl]
    let noDamageFrom : [NameUrl]
    let noDamageTo : [NameUrl]
    
    
}

struct GenIdx {
    
    let gameIndex : Int
    let generation : NameUrl
    
}

struct Poke {
    
    let poke : NameUrl
    let slot : Int
    
    
}


struct NameUrl {
    
    let name : String
    let url : String
}

