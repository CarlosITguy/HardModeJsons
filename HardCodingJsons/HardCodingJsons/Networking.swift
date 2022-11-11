import Foundation




final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
}

// MARK: Manual Decoding
extension NetworkManager {
    
    //    private func parseNameLink(nameLink: [String: Any]) -> NameLink? {
    //        guard let name = nameLink["name"] as? String else { return nil }
    //        guard let url = nameLink["url"] as? String else { return nil }
    //        return NameLink(name: name, url: url)
    //    }
    
    
    func getPokemonManually() -> Pokemon? {
        guard let path = Bundle.main.path(forResource: "SampleJSONDragon", ofType: "json") else {
            return nil
        }
        
        let url = URL(filePath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let jsonObj = try JSONSerialization.jsonObject(with: data)
            guard let baseDict = jsonObj as? [String: Any] else { return nil }
            return self.parsePokemonManually(base: baseDict)
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
    private func parsePokemonManually(base: [String: Any]) -> Pokemon? {
        
        guard let damageTypes = base["damage_relations"] as? [String : Any] else {print("in damage types") ; return nil}
        var returnOfDamageTypes : [DamageType] = []
//        print(returnOfDamageTypes)
        
        guard let dobDamFr = damageTypes["double_damage_from"] as? [[String : Any]] else {return nil }
        
        
        guard let dobDamTo = damageTypes["double_damage_to"] as? [[String : Any]] else {return nil}
        
        
        guard let halfDamFr = damageTypes["half_damage_from"] as? [[String : Any]] else {return nil}
        
        guard let halfDamTo = damageTypes["half_damage_to"] as? [[String : Any]] else {return nil}
        
        guard let noDamFr = damageTypes["no_damage_from"] as? [[String : Any]] else {return nil}
        
        guard let noDamTo = damageTypes["no_damage_to"] as? [[String : Any]] else {return nil}
        
        var DobDamFr    : [NameUrl] = []
        var DobDamTo    : [NameUrl] = []
        var HalfDamFr   : [NameUrl] = []
        var HalfDamTo   : [NameUrl] = []
        var NoDamFr     : [NameUrl] = []
        var NoDamTo     : [NameUrl] = []
        dobDamFr.forEach{
            guard let return1 = self.NameURL(Nameurl: $0) else {return}
            //            print("This is doble damage from \(return1.name)")
            DobDamFr.append(return1)
        }
        
        dobDamTo.forEach{
            guard let return2 = self.NameURL(Nameurl: $0) else { return }
            DobDamTo.append(return2)
        }
        halfDamFr.forEach{
            guard let return3 = self.NameURL(Nameurl: $0) else { return }
            HalfDamFr.append(return3)
        }
        
        halfDamTo.forEach{
            guard let return4 = self.NameURL(Nameurl: $0) else { return }
            HalfDamTo.append(return4)
        }
        
        noDamFr.forEach{
            guard let return5 = self.NameURL(Nameurl: $0) else { return }
            NoDamFr.append(return5)
        }
        noDamTo.forEach{
            guard let return6 = self.NameURL(Nameurl: $0) else { return }
            NoDamTo.append(return6)
            //            print("This is no damage To \(NoDamTo)")
            
        }
        
        
        let alltypesofdamage = DamageType(dobleDamageFrom: DobDamTo, dobleDamageTo: DobDamTo, halfDamageFrom:HalfDamFr, halfDamageTo: HalfDamTo, noDamageFrom: NoDamFr, noDamageTo: NoDamTo)
        
        returnOfDamageTypes.append(alltypesofdamage)
//        print("Append damage types \(alltypesofdamage.dobleDamageFrom[0].name)")
        
        
        guard let GamInd = base["game_indices"] as? [[String : Any]] else {return nil}
        var IndicesGame : [GenIdx] = []
        GamInd.forEach{
            guard let GIndex = $0["game_index"] as? Int else {return}
            guard let Gen = $0["generation"] as? [String : Any] else {return}
            guard let name = Gen["name"] as? String
            else {return }
            guard let ur = Gen["url"] as? String
            else {return}
            let nameurl = NameUrl(name: name, url: ur)
            //            secondind.append(nameurl)
            
            let all = GenIdx(gameIndex: GIndex, generation: nameurl)
            
            IndicesGame.append(all)
            
            
        }
        guard let Id = base["id"]  as? Int else {   return nil}
        
        //         GENERATION
        
        guard let Generation = base["generation"] as? [String : Any] else { return nil }
        
        guard let SAG = NameURL(Nameurl: Generation) else {return nil }
        
        //firt clase kay moveDamageClass
        
        guard let MoveDamageClass = base["generation"] as? [String : Any] else { return nil }
        
        guard let MDC = NameURL(Nameurl: MoveDamageClass) else {return nil }
        
        
        //       fits clas key call moves
        var savemoves : [NameUrl] = []
        guard let moves = base["moves"] as? [[String : Any]] else {return nil}
        moves.forEach{
            guard let move = NameURL(Nameurl: $0) else{return
            }
            
            savemoves.append(move)
//            print("save moves name \(move.name)")
        }
        //        let allmoves =
        guard let unicname  = base["name"] as? String else {return nil}
        
        guard let pookemons = base["pokemon"] as? [[String : Any]] else {return nil}
        var savePokes : [Poke] = []
        pookemons.forEach{
            
            guard let unwrap2ndPokemon = $0["pokemon"] as? [String: Any] else {return}
            
            guard let pokemon = NameURL(Nameurl: unwrap2ndPokemon) else {return }
            
            guard let slot = $0["slot"] as? Int else {return}
            
            let somthingelse = Poke(poke: pokemon, slot: slot)
            
            savePokes.append(somthingelse)
//            print("pokemons name \(pokemon.name)")
        }
        
        
        
        
        
        
        //        let saveAllGenerations = NameUrl(name: name, url: url )
        
        
        return Pokemon(damageRelations: returnOfDamageTypes, gameIndices: IndicesGame, generation: SAG ,id : Id, moveDamageClass: MDC, moves: savemoves, name: unicname, pokemon: savePokes)
    }
    private func NameURL(Nameurl : [String : Any] )-> NameUrl? {
        guard let name = Nameurl["name"] as? String
        else {return nil}
        guard let ur = Nameurl["url"] as? String
        else {return nil}
        return NameUrl(name: name, url: ur)
        
    }
    
    
}


