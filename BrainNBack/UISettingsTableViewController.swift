//
//  UISettingsTableViewController.swift
//  BrainNBack
//
//  Created by if26 on 14/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class UISettingsTableViewController: UIViewController {

    struct keys{
        static let prefersNiveau = "prefersNiveau"
        static let prefersTemps = "prefersTemps"
        static let prefersItems = "prefersItems"
        static let prefersSon = "prefersSon"
        static let prefersCouleur = "prefersCouleur"
    }
    

    @IBOutlet var lblNiveau: UILabel!
    @IBOutlet var sliderNiveau: UISlider!
    
    
    @IBOutlet var lblTemps: UILabel!
    @IBOutlet var sliderTemps: UISlider!
    
    @IBOutlet var lblNbItems: UILabel!
    @IBOutlet var sliderNbItems: UISlider!
    
    @IBOutlet var switchCouleur: UISwitch!
    @IBOutlet var switchSon: UISwitch!
    
    let defaults = UserDefaults.standard
    
   
    @IBAction func sliderNiveauUpdate(_ sender: Any) {
        lblNiveau.text = String(Int(sliderNiveau.value))
        defaults.set(sliderNiveau.value, forKey: keys.prefersNiveau)
    }
    
    @IBAction func sliderTempsUpdate(_ sender: Any) {
        lblTemps.text = String(Int(sliderTemps.value))+" ms"
        defaults.set(sliderTemps.value, forKey: keys.prefersTemps)
    }
    
    @IBAction func sliderNbItemsUpdate(_ sender: Any) {
        lblNbItems.text = String(Int(sliderNbItems.value))
        defaults.set(sliderNbItems.value,forKey: keys.prefersItems)
        
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
        let prefersNiveau = defaults.integer(forKey: keys.prefersNiveau)
        var returnvalue = 1
        if prefersNiveau != 0 {
            returnvalue = prefersNiveau
            sliderNiveau.value = Float(returnvalue)
        }
        return String(returnvalue);
    }
    func getNiveauForDisplay() -> String{
        let prefersNiveau = defaults.integer(forKey: keys.prefersNiveau)
        var returnvalue = 1
        if prefersNiveau != 0 {
            returnvalue = prefersNiveau
        }
        return String(returnvalue);
    }
    func getTempsBdd() -> String{
        let prefersTemps = defaults.integer(forKey: keys.prefersTemps)
        var returnvalue = 1000
        if prefersTemps != 0 {
            returnvalue = prefersTemps
            sliderTemps.value = Float(returnvalue)
        }
        return String(returnvalue)+"ms";
    }
    func getNbItemsBdd() -> String{
        let prefersItems = defaults.integer(forKey: keys.prefersItems)
        var returnvalue = 5
        if prefersItems != 0 {
            returnvalue = prefersItems
            sliderNbItems.value = Float(returnvalue)
        }
        return String(returnvalue);
    }
    func getSwitchCouleurState() -> Bool{
        return defaults.bool(forKey: keys.prefersCouleur);
    }
    func getSwitchSonState() -> Bool{
        return defaults.bool(forKey: keys.prefersSon);
    }
    
    @IBAction func SonIsChanged(_ sender: Any) {
        defaults.set(switchSon.isOn, forKey: keys.prefersSon)
    }
    @IBAction func CouleurIsChanged(_ sender: Any) {
        defaults.set(switchCouleur.isOn, forKey: keys.prefersCouleur)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
