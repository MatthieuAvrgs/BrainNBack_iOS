//
//  Settings.swift
//  BrainNBack
//
//  Created by AVARGUES Matthieu on 18/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import Foundation



class Settings {
    
    struct keys{
        static let prefersNiveau = "prefersNiveau"
        static let prefersTemps = "prefersTemps"
        static let prefersItems = "prefersItems"
        static let prefersSon = "prefersSon"
        static let prefersCouleur = "prefersCouleur"
    }
    
    var niveau : Int = 1
    var temps : Double = 3
    var nbreItems : Int = 5
    var couleur : Bool
    var son : Bool 
    
    let defaults = UserDefaults.standard

    init() {
        let prefersNiveau = defaults.integer(forKey: keys.prefersNiveau)
        if prefersNiveau != 0 {
            niveau = prefersNiveau
        }
        let prefersItems = defaults.integer(forKey: keys.prefersItems)
        if prefersItems != 0 {
            nbreItems = prefersItems
        }
        let prefersTemps = defaults.integer(forKey: keys.prefersTemps)
        if prefersTemps != 0 {
            temps =  Double(prefersTemps) / 1000.0
        }
        son = defaults.bool(forKey: keys.prefersSon)
        couleur = defaults.bool(forKey: keys.prefersCouleur)

    }


    
    func getNbreItems() -> Int{
        return self.nbreItems
    }
    
    
    
    func getNiveau() -> Int{
        return self.niveau
    }
    
    func setNiveau(niveau : Int) {
        self.niveau = niveau
    }
    
    func getTemps() -> Double {
        return self.temps
    }
    
    func setTemps(temps : Double) {
        self.temps = temps
    }
    
    func isCouleur() -> Bool {
        return couleur
    }
    
    func setCouleur(couleur : Bool) {
        self.couleur = couleur
    }
    
    func isSon() -> Bool {
        return self.son
    }
    
    func setSon(son : Bool) {
        self.son = son
    }
}
