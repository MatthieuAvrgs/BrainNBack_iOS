//
//  GameController.swift
//  BrainNBack
//
//  Created by francois on 16/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var carre1: UIView!
    @IBOutlet weak var carre2: UIView!
    @IBOutlet weak var carre3: UIView!
    @IBOutlet weak var carre4: UIView!
    @IBOutlet weak var carre5: UIView!
    @IBOutlet weak var carre6: UIView!
    @IBOutlet weak var carre7: UIView!
    @IBOutlet weak var carre8: UIView!
    @IBOutlet weak var carre9: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listeVueCarre : [UIView]
        listeVueCarre = [carre1, carre2, carre3, carre4, carre5, carre6, carre7, carre8, carre9]
        
        let settingsPartie = Settings ()
        let partie = Partie (settingPartie : settingsPartie)
        
        
        
        
        for i in 0 ... settingsPartie.getNbreItems() {
            //print("carre ",i)
            //print(partie.getListeCarres()[i].getPosition())
            //print(partie.getListeCarres()[i].getSon())
            //print(partie.getListeCarres()[i].getCouleur())

        }
        
        
        
    }
    
    
    func changeColor (listeVueCarre : [UIView], index: Int){
        listeVueCarre[index].backgroundColor=UIColor.blue
    }

    

}
