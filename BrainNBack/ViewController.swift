//
//  ViewController.swift
//  BrainNBack
//
//  Created by if26 on 11/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblMeilleurScore: UILabel!
    @IBOutlet var lblNiveauLePlusHaut: UILabel!
    @IBOutlet var lblNbPartiesJouees: UILabel!
    
    @IBOutlet var lblNiveau: UILabel!
    
    var historiqueData : [StatUnePartie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let data =  PersistancePartie()
            let database = try data.database.prepare(data.historique_table)
            for ligne in database {
                self.historiqueData.append(StatUnePartie(date: ligne[data.historique_date], niveau: ligne[data.historique_niveau], couleur: ligne[data.historique_couleur], son: ligne[data.historique_son], score: ligne[data.historique_score]))
            }
        } catch{
            print("--> selectModules est en erreur")
        }
        
        lblMeilleurScore.text = getMeilleurScore(data : self.historiqueData)
        lblNiveauLePlusHaut.text = getiveauLePlusHaut(data : self.historiqueData)
        lblNbPartiesJouees.text = getbPartiesJouees(data : self.historiqueData)
        lblNiveau.text = getNiveauEnCours()
        
        //Database test
        let data =  PersistancePartie()
        data.createTable()
        data.insertPartie()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func getMeilleurScore(data :  [StatUnePartie]) -> String{
        var meilleurScore : Int = 0
        for stat in data {
            var score : Int
            if(Int(stat.score) != nil){
                score = Int(stat.score)!
            } else{
                score = 0
            }
            if(score > meilleurScore){
                meilleurScore = score
            }
        }
        return String(meilleurScore)+"%"
    }
    func getiveauLePlusHaut(data :  [StatUnePartie]) -> String{
        var meilleurNiveau : Int = 0
        for stat in data {
            var lvl : Int
            if(Int(stat.niveau) != nil){
                lvl = Int(stat.niveau)!
            } else{
                lvl = 0
            }
            if(lvl > meilleurNiveau){
                meilleurNiveau = lvl
            }
        }
        return String(meilleurNiveau)
    }
    func getbPartiesJouees(data :  [StatUnePartie]) -> String{
        var compteurParties = 0
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.string(from: currentDate)
        for stat in data {
            if(stat.date == date){
                compteurParties = compteurParties + 1
            }
        }
        return String(compteurParties)
    }
    func getNiveauEnCours() -> String{
        return String(1)
    }


}

