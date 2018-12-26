//
//  Settings.swift
//  BrainNBack
//
//  Created by AVARGUES Matthieu on 18/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import Foundation

class Settings {
    var niveau : Int = 1
    var temps : CLong = 3
    var nbreItems : Int = 8
    var couleur : Bool = false
    var son : Bool = true
    
    init() {
//        SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(c);
//        boolean isSon = SP.getBoolean("son", false);
//        boolean isCouleur = SP.getBoolean("couleur",false);
//        String niveauS = SP.getString("niveau","1");
//        String tempsS = SP.getString("temps","2000");
//        String nbCarres = SP.getString("nbCarres","10");
//        this.niveau = Integer.parseInt(niveauS);
//        this.temps = Integer.parseInt(tempsS);
//        this.nbreItems = Integer.parseInt(nbCarres);
//        this.couleur = isCouleur;
//        this.son = isSon;
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
    
    func getTemps() -> CLong {
        return self.temps
    }
    
    func setTemps(temps : CLong) {
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
