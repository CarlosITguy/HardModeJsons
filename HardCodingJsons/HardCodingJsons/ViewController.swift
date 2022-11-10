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
        
    }
    
    func createUI() {
        self.view.addSubview(self.manualDecodeButton)
        
        self.manualDecodeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.manualDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.manualDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.manualDecodeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true            print(IndicesGame)

    }
    
    
    
    
//    func presentPokemonAlert(pokemon: Pokemon?) {
//        guard let pokemon = pokemon else { return }
//
//        let moveNames = pokemon.DamageRelations.compactMap {
//            return $0.HalfDamageFrom.count
//        }
//
//        let alert = UIAlertController(title: "Glaceon Moves", message: "\(moveNames)", preferredStyle: .alert)
//        let okayAction = UIAlertAction(title: "Okay", style: .default)
//        alert.addAction(okayAction)
//
//        self.present(alert, animated: true)
//
//    }
}
