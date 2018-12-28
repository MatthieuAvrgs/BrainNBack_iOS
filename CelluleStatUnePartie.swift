//
//  CelluleStatUnePartie.swift
//  BrainNBack
//
//  Created by francois on 27/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class CelluleStatUnePartie: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var niveau: UILabel!
    @IBOutlet weak var couleur: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var son: UILabel!
    
    func setCell(statUnePartie : StatUnePartie){
        date.text = statUnePartie.date
        niveau.text = statUnePartie.niveau
        couleur.text = statUnePartie.couleur
        score.text = statUnePartie.score
        son.text = statUnePartie.son
    }
}
