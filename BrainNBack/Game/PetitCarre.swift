//
//  PetitCarre.swift
//  BrainNBack
//
//  Created by AVARGUES Matthieu on 18/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import Foundation

class PetitCarre {
    var position : Int
    var son : Int
    var couleur : Int
    var reponses : [Bool]
    
    init (listeCarres : [PetitCarre], niveau : Int) {
    self.position  = 1
    self.son = 1
    self.couleur = 1
    self.reponses = []
    self.setPetitCarre(listeCarres:listeCarres, niveau:niveau)
    }
    
    func setPetitCarre (listeCarres : [PetitCarre], niveau : Int){
        self.position  = randomIndex(listeCarres:listeCarres, niveau:niveau, caseToGet:"position")
        self.son = randomIndex(listeCarres:listeCarres, niveau:niveau, caseToGet:"son")
        self.couleur = randomIndex(listeCarres:listeCarres, niveau:niveau, caseToGet:"couleur")
        self.reponses = []
    }
    
    func getPosition() -> Int {
        return position
    }
    
    
    func randomIndex (listeCarres :[PetitCarre], niveau : Int, caseToGet : String) -> Int{
        let nbElements : Int = listeCarres.count

        if(nbElements >= niveau){
            //chance représente la proba que le carré apparaisse à la meme position | proba = 1/ (chance)
            let chance : Int = 3; // 1/3
            let proba : Int = Int(arc4random_uniform(UInt32(chance))) + 1
            switch (proba){
                case 1:
                switch (caseToGet){
                    case "position":
                        return getNPosition(listeCarres : listeCarres, nbElements : nbElements, niveau : niveau)
                    case "son":
                        return getNSon(listeCarres : listeCarres, nbElements : nbElements, niveau : niveau)
                    case "couleur":
                        return getNCouleur(listeCarres : listeCarres, nbElements : nbElements, niveau : niveau)
                    default:
                        return getNPosition(listeCarres : listeCarres, nbElements : nbElements, niveau : niveau)
                }
                default:
                    return Int(arc4random_uniform(UInt32(8))) + 1
            }
        } else{
            return Int(arc4random_uniform(UInt32(8))) + 1
        }
    }
    
    func getNPosition(listeCarres :[PetitCarre], nbElements : Int, niveau : Int) -> Int{
        return listeCarres[nbElements-niveau].getPosition()
    }
    func getNSon(listeCarres :[PetitCarre], nbElements : Int, niveau : Int) -> Int{
        return listeCarres[nbElements-niveau].getSon()
    }
    func getNCouleur(listeCarres :[PetitCarre], nbElements : Int, niveau : Int) -> Int{
        return listeCarres[nbElements-niveau].getCouleur()
    }
    
    func getSon()  -> Int{
        return son
    }
    
    func getCouleur()  -> Int {
        return couleur
    }
    
    func setReponses (tableauReponses : [Bool]){
        self.reponses=tableauReponses
    }
    
    func getReponses () -> [Bool]{
        return self.reponses
    }
}
