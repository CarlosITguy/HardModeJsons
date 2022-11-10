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
        
        
        
//                var secondind : [NameUrl]
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
        return Pokemon(gameIndices: IndicesGame)
        //            guard let gameIndecesArr = base["game_indices"] as? [[String: Any]] else { return nil }
        //            var returnGameIndeces: [GameIndex] = []
        //            gameIndecesArr.forEach{
        //                guard let gameIndex = $0["game_index"] as? Int else { return }
        //                guard let version = $0["version"] as? [String: Any] else { return }
        //                guard let returnVersion = self.parseNameLink(nameLink: version) else { return }
        //                let gameIndece = GameIndex(gameIndex: gameIndex, version: returnVersion)
        //                returnGameIndeces.append(gameIndece)
    }
}


