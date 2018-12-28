//
//  ItemTableViewCell.swift
//  BrainNBack
//
//  Created by AVARGUES1 on 28/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var bonnesRep: UILabel!
    @IBOutlet weak var mauvaiseRep: UILabel!
    @IBOutlet weak var oublie: UILabel!
    
    
    
    func updateUI(stat : Statistique) {
        print(titre)
        print(bonnesRep)
        print(mauvaiseRep)
        print(oublie)
        titre?.text = stat.getTitre()
        bonnesRep?.text = String(stat.getBonnesReponses())
        mauvaiseRep?.text = String(stat.getMauvaisesReponses())
        oublie?.text = String(stat.getOublies())

    }
    
}

