//
//  Partie.swift
//  BrainNBack
//
//  Created by AVARGUES Matthieu on 18/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import Foundation

class Partie {
    var scorePoint : Int
    var statistiquesPartie : [Statistique]
    var statistiques : [[Int]]
    var listeCarres : [PetitCarre]
    var settingPartie : Settings
    
    init(settingPartie : Settings) {
        self.scorePoint = 0
        self.settingPartie = settingPartie
        self.listeCarres = []
        for _ in 1 ... self.settingPartie.getNbreItems() {
            listeCarres = listeCarres + [PetitCarre(listeCarres : self.listeCarres, niveau : settingPartie.getNiveau())]
        }
        self.statistiquesPartie=[]
        self.statistiques=[]
    }
    
    func getListeCarres() -> [PetitCarre] {
        return listeCarres
    }
    
    func setListeCarres(listeCarres : [PetitCarre]) {
        self.listeCarres = listeCarres
    }
    
    func getSettingPartie() -> Settings{
        return self.settingPartie
    }
    
    func calculerScore(){
        self.obtenirStatistiquesPartie();
        self.compterLesPoints();
    }
    
    func compterLesPoints(){
        var totalBonnesReponses = 0
        var totalMauvaisesReponses = 0
        var totalOublies = 0
        for stat in self.statistiquesPartie {
            totalBonnesReponses += stat.getBonnesReponses()
            totalMauvaisesReponses += stat.getMauvaisesReponses()
            totalOublies += stat.getOublies()
        }
        var denominateur=(totalBonnesReponses+totalOublies)*2
        denominateur=denominateur==0 ? 1 : denominateur
        self.scorePoint = (totalBonnesReponses*2-totalMauvaisesReponses)*100/(denominateur)
        if(self.scorePoint<0){
            self.scorePoint=0
        }
    }
    func obtenirStatistiquesPartie(){
        //initialisation de la hashmap pour les statistiques de la partie
        var localStats : [String : Statistique] = [String : Statistique]()
        localStats["position"] = Statistique()
        if(settingPartie.isSon()==true){
            localStats["son"] = Statistique()
        }
        if(settingPartie.isCouleur()==true){
            localStats["couleur"] = Statistique()
        }
        let niveau = self.settingPartie.getNiveau()
        // initialisation des indices de reponse
        var reponsePosition = 0
        var reponseSon = 0
        var reponseCouleur = 0
        
        //boucle qui permet d'itérer sur chaque PetitCarre
        for index in 0...getSettingPartie().getNbreItems()-1 {
            //si indew>=niveau signifie qu'une réponse de l'utilisateur est possible
            if(index>=niveau){
                //position
                //on donne en paramètre la position du carre actuel et celui N fois avant, on donne aussi la réponse du joueur
                reponsePosition = self.traiterReponseJoueur(infoCarreEnCours : self.listeCarres[index].getPosition(),infoNCarreAvant : self.listeCarres[index-niveau].getPosition(), reponseJoueur : self.listeCarres[index].getReponses()[0])
                //on appelle une méthode de la classe Score qui permet de traiter la réponse obtenue par la méthode traiterReponseJoueur
                localStats["position"]!.traiterReponseStatistique(reponse : reponsePosition)
                //son
                if(settingPartie.isSon()==true){
                    reponseSon = self.traiterReponseJoueur(infoCarreEnCours : self.listeCarres[index].getSon(),infoNCarreAvant : self.listeCarres[index-niveau].getSon(), reponseJoueur : self.listeCarres[index].getReponses()[1])
                    localStats["son"]!.traiterReponseStatistique(reponse : reponseSon)
                }
                //couleur
                if(settingPartie.isCouleur()==true){
                    reponseCouleur = self.traiterReponseJoueur(infoCarreEnCours : self.listeCarres[index].getCouleur(),infoNCarreAvant : self.listeCarres[index-niveau].getCouleur(), reponseJoueur : self.listeCarres[index].getReponses()[2])
                    localStats["couleur"]!.traiterReponseStatistique(reponse : reponseCouleur)
                }
            }
        }
        for (e, value) in localStats {
            value.setTitre(titre: e)
            self.statistiquesPartie = self.statistiquesPartie + [value]
        }
    }
    
    func traiterReponseJoueur(infoCarreEnCours : Int, infoNCarreAvant : Int, reponseJoueur : Bool) -> Int{
    //bonne réponse on retourne 1
        if(infoCarreEnCours == infoNCarreAvant && reponseJoueur == true){
            return 1
        }
        //il a oublié de cliquer on retourne 2
        else if(infoCarreEnCours == infoNCarreAvant && reponseJoueur == false){
            return 2
        }
        //si joueur a appuyer et il ne le fallait pas on retourne 3
        else if (infoCarreEnCours != infoNCarreAvant && reponseJoueur == true){
            return 3
        }
        //cas par defaut
        return 0
    }
    
    func getStatistiquesPartie() -> [Statistique] { return self.statistiquesPartie; }
    
    func getScorePoint() -> Int{
        return self.scorePoint
    }
}
