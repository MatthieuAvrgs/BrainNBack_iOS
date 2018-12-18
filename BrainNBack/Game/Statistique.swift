//
//  Statistique.swift
//  BrainNBack
//
//  Created by AVARGUES Matthieu on 18/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import Foundation

class Statistique {
    var titre : String
    var bonnesReponses : Int
    var mauvaisesReponses : Int
    var oublies : Int
    
    //constructeur, initialisation des attributs
    init(){
        self.titre=""
        self.bonnesReponses=0
        self.mauvaisesReponses=0
        self.oublies=0
    }
    
    //compteur de réponses
    func traiterReponseStatistique(reponse : Int){
        switch (reponse){
            //bonne réponse
            case 1:
                self.bonnesReponses = self.bonnesReponses + 1
                break
            //oublie d'appuyer de la part de l'utilisateur
            case 2:
                self.oublies = self.oublies + 1
                break
            //mauvaise réponse de l'utilisateur (il ne fallait pas appuyer, il l'a fait
            case 3:
                self.mauvaisesReponses = self.mauvaisesReponses + 1
                break
            default:
                break
        }
    }
    
    func setTitre(titre : String){
        self.titre=titre
    }
    
    func getTitre() -> String{
        return self.titre
    }
    
    func getBonnesReponses() -> Int{
        return self.bonnesReponses
    }
    
    func getMauvaisesReponses() -> Int{
        return self.mauvaisesReponses
    }
    
    func getOublies() -> Int{
        return self.oublies
    }
}
