//
//  UISettingsTableViewController.swift
//  BrainNBack
//
//  Created by if26 on 14/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class UISettingsTableViewController: UIViewController {

    
    
    @IBOutlet var lblNiveau: UILabel!
    @IBOutlet var sliderNiveau: UISlider!
    
    @IBOutlet var lblTemps: UILabel!
    @IBOutlet var sliderTemps: UISlider!
    
    @IBOutlet var lblNbItems: UILabel!
    @IBOutlet var sliderNbItems: UISlider!
    
    @IBOutlet var switchCouleur: UISwitch!
    @IBOutlet var switchSon: UISwitch!
    
    @IBAction func sliderNiveauUpdate(_ sender: Any) {
        lblNiveau.text = String(Int(sliderNiveau.value))
    }
    
    @IBAction func sliderTempsUpdate(_ sender: Any) {
        lblTemps.text = String(Int(sliderTemps.value))+" ms"
    }
    
    @IBAction func sliderNbItemsUpdate(_ sender: Any) {
        lblNbItems.text = String(Int(sliderNbItems.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNiveau.text = getNiveauBdd()
        lblTemps.text = getTempsBdd()
        lblNbItems.text = getNbItemsBdd()
        switchSon.setOn(getSwitchSonState(), animated: false)
        switchCouleur.setOn(getSwitchCouleurState(), animated: false)
    }

    func getNiveauBdd() -> String{
        return String(1);
    }
    func getTempsBdd() -> String{
        return String(1000)+"ms";
    }
    func getNbItemsBdd() -> String{
        return String(5);
    }
    func getSwitchCouleurState() -> Bool{
        return false;
    }
    func getSwitchSonState() -> Bool{
        return false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
