//
//  GameController.swift
//  BrainNBack
//
//  Created by francois on 16/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit
import AVFoundation

class GameController: UIViewController {
    
    @IBOutlet weak var carre1: UIView!
    @IBOutlet weak var carre2: UIView!
    @IBOutlet weak var carre3: UIView!
    @IBOutlet weak var carre4: UIView!
    @IBOutlet weak var carre5: UIView!
    @IBOutlet weak var carre6: UIView!
    @IBOutlet weak var carre7: UIView!
    @IBOutlet weak var carre8: UIView!
    @IBOutlet weak var carre9: UIView!
    
    @IBOutlet weak var boutonPosition: UIButton!
    @IBOutlet weak var boutonSon: UIButton!
    @IBOutlet weak var boutonCouleur: UIButton!
    
    var reponses : [Bool] = [false,false,false]
    var finJeu : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listeVueCarre : [UIView]
        listeVueCarre = [carre1, carre2, carre3, carre4, carre5, carre6, carre7, carre8, carre9]
        
        let settingsPartie = Settings ()
        let partie = Partie (settingPartie : settingsPartie)

        var colorMap : [Int : UIColor] = [Int : UIColor]()
        colorMap[1]=UIColor.brown
        colorMap[2]=UIColor.blue
        colorMap[3]=UIColor.black
        colorMap[4]=UIColor.cyan
        colorMap[5]=UIColor.yellow
        colorMap[6]=UIColor.green
        colorMap[7]=UIColor.magenta
        colorMap[8]=UIColor.orange
        colorMap[9]=UIColor.red

        var sonMap : [Int : String] = [Int : String]()
        sonMap[1]="a"
        sonMap[2]="b"
        sonMap[3]="c"
        sonMap[4]="d"
        sonMap[5]="e"
        sonMap[6]="f"
        sonMap[7]="g"
        sonMap[8]="h"
        sonMap[9]="i"
        
        self.finJeu = false
        self.designBouton(btn : boutonPosition)
        self.designBouton(btn : boutonSon)
        self.designBouton(btn : boutonCouleur)

        
        
        //on affiche ou pas les boutons
        if(settingsPartie.isSon() == true){
            boutonSon.isHidden = false
        } else {
            boutonSon.isHidden = true
        }
        if(settingsPartie.isCouleur() == true){
            boutonCouleur.isHidden = false
        } else {
            boutonCouleur.isHidden = true
        }
        
        
        DispatchQueue.global(qos:.background).async {
            var color : UIColor = UIColor.blue
            var text : String
            for i in 0 ... settingsPartie.getNbreItems() {
                if(self.finJeu == false){
                    //initialisation des réponses
                    self.reponses[0]=false
                    self.reponses[1]=false
                    self.reponses[2]=false
                    
                    //manage la couleur du carré
                    if(settingsPartie.isCouleur() == true){
                        color = colorMap[partie.getListeCarres()[i].getCouleur()]!
                    }
                    
                    print("carre ",i)
                    //print(settingsPartie.getNbreItems())
                    //print(partie.getListeCarres()[i].getPosition())
                    //print(partie.getListeCarres()[i].getSon())
                    //print(partie.getListeCarres()[i].getCouleur())
                    //carré à afficher
                    DispatchQueue.main.async {
                        self.changeColor(listeVueCarre: listeVueCarre, index: partie.getListeCarres()[i].getPosition(), color : color)
                    }
                    
                    // manage le son du carré
                    if(settingsPartie.isSon() == true){
                        text = sonMap[partie.getListeCarres()[i].getSon()]!
                        let utterance = AVSpeechUtterance(string: text)
                        utterance.voice = AVSpeechSynthesisVoice (language: "fr-FR")
                        let synth = AVSpeechSynthesizer()
                        synth.speak(utterance)
                    }
                    
                    //désaffichage
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        self.changeColorGrey(listeVueCarre: listeVueCarre, index: partie.getListeCarres()[i].getPosition())
                    }
                    
                    //temps entre 2 carrés
                    Thread.sleep(until: Date(timeIntervalSinceNow: TimeInterval(settingsPartie.getTemps())))
                    
                    //enregistrement des réponses
                    let repBool : [Bool] = [self.reponses[0],self.reponses[1],self.reponses[2]]
                    print(repBool)
                    partie.getListeCarres()[i].setReponses(tableauReponses: repBool)
                }
            }
            if(self.finJeu == false){
                partie.calculerScore()
                print("SCORE ",partie.getScorePoint())
                DispatchQueue.main.async {
                    self.afficherDialog(partie : partie)
                }

            }
        }
        
        
        
    }
   
    @IBAction func pressBoutonPosition(_ sender: Any) {
        reponses[0] = true
    }
    
    @IBAction func pressBoutonSon(_ sender: Any) {
        reponses[1] = true
    }
    
    @IBAction func pressBoutonCouleur(_ sender: Any) {
        reponses[2] = true
    }
    
    func afficherDialog (partie : Partie){
        let score = partie.getScorePoint()
        let alertController = UIAlertController(title: "Fin de la partie",
                                                message: String(score)+" %",
                                                preferredStyle: .alert)
        
        
        alertController.addAction(UIAlertAction(title: "Rejouer", style: UIAlertAction.Style.default, handler: { action in
            self.viewDidLoad()
        }))
        alertController.addAction(UIAlertAction(title: "Menu", style: UIAlertAction.Style.cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        let tableViewController = CustomViewController()
        tableViewController.updateUI(items: partie.getStatistiquesPartie())
        tableViewController.preferredContentSize = CGSize(width: 272, height: partie.getStatistiquesPartie().count * 44) // 44 => 1 cell
        alertController.setValue(tableViewController, forKey: "contentViewController")
        
        self.present(alertController, animated: true)
        {
            // ...
        }
        /*let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        // add the actions (buttons)
        alertController.addAction(UIAlertAction(title: "Rejouer", style: UIAlertAction.Style.default, handler: { action in
            self.viewDidLoad()
        }))
        alertController.addAction(UIAlertAction(title: "Menu", style: UIAlertAction.Style.cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        let contentViewController = CustomViewController()
        //contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        contentViewController.updateUI(items: partie.getStatistiquesPartie())

        // show the alert
        self.present(alertController, animated: true, completion: nil)*/
    }

    func changeColor (listeVueCarre : [UIView], index: Int, color: UIColor){
        listeVueCarre[index].backgroundColor=color
    }
    func changeColorGrey (listeVueCarre : [UIView], index: Int){
        listeVueCarre[index].backgroundColor=UIColor.lightGray
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParentViewController {
            self.finJeu = true
        }
    }
    
    func designBouton (btn : UIButton){
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
        
    }

}
