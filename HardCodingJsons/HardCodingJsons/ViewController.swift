//
//  ViewController.swift
//  HardCodingJsons
//
//  Created by Consultant on 11/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view.
    //    }
    
    lazy var manualDecodeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Manual Decode", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.manualDecodeButtonPressed()
        
    }
    
    func createUI() {
        self.view.addSubview(self.manualDecodeButton)
        
        self.manualDecodeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.manualDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.manualDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.manualDecodeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    var counter : Int = 0
    @objc
    func manualDecodeButtonPressed()  {
        //        var counter : Int = 0
        counter = counter+1
        guard let pokemon = NetworkManager.shared.getPokemonManually() else {
            return
        }
        popUpAlert(pokemon:pokemon)
        
    }
    
    
    func popUpAlert(pokemon : Pokemon){
       
        let Namess = pokemon.pokemon.compactMap {
            return $0.poke.name
                        }
        print(Namess)
        
        let alert = UIAlertController(title: " pokenames", message: "\(Namess)", preferredStyle: .alert)
               let okayAction = UIAlertAction(title: "Okay", style: .default)
               alert.addAction(okayAction)
       
        self.present(alert, animated: true)
        
    }
    
   
    
}


//var counter : Int = 0
//@objc
//func manualDecodeButtonPressed()  {
////        var counter : Int = 0
//    counter = counter+1
//    guard let pokemon = NetworkManager.shared.getPokemonManually() else {
//        return
//    }
//    popUpAlert(pokemon:pokemon)
//
//    //        var saveStrings : [String]
//        print("Manual Button Pressed \(counter  )")
//        guard let pokemon = NetworkManager.shared.getPokemonManually() else {
//            return
//        }
//        var Namess = pokemon.pokemon.compactMap {
//            return $0.poke.name
//                        }
////        print(Namess)
//
//        let alert = UIAlertController(title: " pkenames", message: "\(Namess)", preferredStyle: .alert)
//               let okayAction = UIAlertAction(title: "Okay", style: .default)
//               alert.addAction(okayAction)
//
//               self.present(alert, animated: true)
   
//}

//            return $0.move.name    }

//
//        var urls = pokemon.gameIndices.compactMap {
//            return $0.generation.url
//                        }
//        print(urls)
        
        //        if let pokemon = moveNames {print(pokemon)}
        
        //        if let pokemon = pokemon { print(pokemon)}
        
       
        
        
        
        
        
        
        //        var moveNames = pokemon?.gameIndices.compactMap {
        //            return $0.gameIndex
        //                }
        //        var forPrint = pokemon?.gameIndices.compactMap{return $0.generation.name}
        //
        ////        let prueba : [String]?
        //
        //        if let saveStrings = forPrint {print(saveStrings)
        ////            return saveStrings
        //        }
        
        
        //        guard let indice = moveNames! as? [Int] else { return }
        //        guard let forprint1 = prueba! as? [String] else {
        //            return
        //        }
        //
        //        print(indice)
        //        print(prueba)
        //
        //
        ////        self.presentPokemonAlert(pokemon: pokemon)
        //


//    func presentPokemonAlert(pokemon: Pokemon?) {
//        guard let pokemon = pokemon else { return }
//
//        let moveNames = pokemon.gameIndices.compactMap {
//            return $0.move.name
//        }
//
//        let alert = UIAlertController(title: "Glaceon Moves", message: "\(moveNames)", preferredStyle: .alert)
//        let okayAction = UIAlertAction(title: "Okay", style: .default)
//        alert.addAction(okayAction)
//
//        self.present(alert, animated: true)
//
//
//
//    }
