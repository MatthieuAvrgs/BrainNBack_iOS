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
        for _ in 0 ... self.settingPartie.getNbreItems() {
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
//        self.obtenirStatistiquesPartie();
//        self.compterLesPoints();
    }
    
//    func compterLesPoints(){
//        Iterator<Statistique> it = self.statistiquesPartie.iterator();
//        int totalBonnesReponses=0;
//        int totalMauvaisesReponses=0;
//        int totalOublies=0;
//        while (it.hasNext()) {
//            Statistique stat = it.next();
//            totalBonnesReponses += stat.getBonnesReponses();
//            totalMauvaisesReponses += stat.getMauvaisesReponses();
//            totalOublies += stat.getOublies();
//        }
//        int denominateur=(totalBonnesReponses+totalOublies)*2;
//        denominateur=denominateur==0?1:denominateur;
//        self.scorePoint = (totalBonnesReponses*2-totalMauvaisesReponses)*100/(denominateur);
//        if(self.scorePoint<0){
//            self.scorePoint=0;
//        }
//    }
    
//    func obtenirStatistiquesPartie(){
//        //initialisation de la hashmap pour les statistiques de la partie
//        Map <String, Statistique> localStats = new HashMap<String, Statistique>();
//        localStats.put("position",new Statistique());
//        if(settingPartie.isSon()==true){
//            localStats.put("son",new Statistique());
//        }
//        if(settingPartie.isCouleur()==true){
//            localStats.put("couleur",new Statistique());
//        }
//
//        int niveau = this.settingPartie.getNiveau();
//
//        // initialisation des indices de reponse
//        int reponsePosition = 0;
//        int reponseSon = 0;
//        int reponseCouleur = 0;
//
//        //boucle qui permet d'itérer sur chaque PetitCarre
//        for(int index = 0; index<(getSettingPartie().getNbreItems()); index++) {
//            //si indew>=niveau signifie qu'une réponse de l'utilisateur est possible
//            if(index>=niveau){
//                //position
//                //on donne en paramètre la position du carre actuel et celui N fois avant, on donne aussi la réponse du joueur
//                reponsePosition = this.traiterReponseJoueur(this.listeCarres[index].getPosition(),this.listeCarres[index-niveau].getPosition(),this.listeCarres[index].getReponses()[0]);
//                //on appelle une méthode de la classe Score qui permet de traiter la réponse obtenue par la méthode traiterReponseJoueur
//                localStats.get("position").traiterReponseStatistique(reponsePosition);
//
//                //son
//                if(settingPartie.isSon()==true){
//                    reponseSon = this.traiterReponseJoueur(this.listeCarres[index].getSon(),this.listeCarres[index-niveau].getSon(),this.listeCarres[index].getReponses()[1]);
//                    localStats.get("son").traiterReponseStatistique(reponseSon);
//                }
//                //couleur
//                if(settingPartie.isCouleur()==true){
//                    reponseCouleur = this.traiterReponseJoueur(this.listeCarres[index].getCouleur(),this.listeCarres[index-niveau].getCouleur(),this.listeCarres[index].getReponses()[2]);
//                    localStats.get("couleur").traiterReponseStatistique(reponseCouleur);
//                }
//            }
//        }
//        Iterator<Map.Entry<String, Statistique>> it3 = localStats.entrySet().iterator();
//        while (it3.hasNext()) {
//            Map.Entry<String, Statistique> pair = it3.next();
//            pair.getValue().setTitre(pair.getKey());
//            this.statistiquesPartie.add(pair.getValue());
//        }
//    }
    
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
