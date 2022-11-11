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
        //        button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
        
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
    @objc
    func manualDecodeButtonPressed()  {
        //        var saveStrings : [String]
        print("Manual Button Pressed")
        guard let pokemon = NetworkManager.shared.getPokemonManually() else {
            return
        }
     
        var indexes = pokemon.damageRelations.compactMap {
                    return $0.dobleDamageTo
                        }
        print()
        
//        var Namess = pokemon.gameIndices.compactMap {
//            return $0.generation.name
//                        }
//        print(Namess)
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
        
    }
    
    
    //            return $0.move.name    }
    
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
    
    
}
