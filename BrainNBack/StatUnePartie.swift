//
//  StatUnePartie.swift
//  BrainNBack
//
//  Created by francois on 27/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//
import Foundation


class StatUnePartie {
    var date : String
    var niveau : String
    var couleur : String
    var son : String
    var score : String
    
    init (date : String, niveau : String, couleur : String, son : String, score : String) {
        if date == "generate" {
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            self.date  = formatter.string(from: currentDate)
            
        } else {
            self.date  = date
        }
        self.niveau = niveau
        self.couleur = couleur
        self.son = son
        self.score = score
}
}
