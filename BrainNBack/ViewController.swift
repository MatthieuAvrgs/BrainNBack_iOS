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
    @IBOutlet var sliderNiveau: UISlider!
    
    @IBAction func sliderValueUpdate(_ sender: Any) {
        lblNiveau.text = String(Int(sliderNiveau.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMeilleurScore.text = getMeilleurScore()
        lblNiveauLePlusHaut.text = getiveauLePlusHaut()
        lblNbPartiesJouees.text = getbPartiesJouees()
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
    
    func getMeilleurScore() -> String{
        return String(0)+"%";
    }
    func getiveauLePlusHaut() -> String{
        return String(0);
    }
    func getbPartiesJouees() -> String{
        return String(0);
    }
    func getNiveauEnCours() -> String{
        return String(1);
    }


}

