//
//  PersistancePartie.swift
//  BrainNBack
//
//  Created by francois on 24/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import Foundation
import SQLite

class PersistancePartie {
    var insertParam : Dictionary<String, String>?
    var database: Connection!
    
    let historique_table = Table("historique")
    let historique_id = Expression<Int>("id")
    let historique_date = Expression<String>("date")
    let historique_niveau = Expression<String>("niveau")
    let historique_couleur = Expression<String>("couleur")
    let historique_son = Expression<String>("son")
    let historique_score = Expression<String>("score")
    
    static var pk = 1000; // valeur de départ pour la primary key
    var tableExist = false
    
    init() {
        print ("--> viewDidLoad debut")
        
        // Il est possible de créer des fichiers dans le répertoire "Documents" de votre application.
        // Ici, création d'un fichier users.sqlite3
        
        do {
            let documentDirectory = try
                FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("historique").appendingPathExtension("sqlite3")
            let base = try Connection(fileUrl.path)
            self.database = base;
            self.tableExist = true
        }
        catch {
            print (error)
        }
        print ("--> viewDidLoad fin")
    }
    
    func createTable() {
        self.tableExist = false
        print ("--> createTablehistorique debut")
        if !self.tableExist {
            self.tableExist = true
            
            // Instruction pour faire un drop de la table USERS
            let dropTable = self.historique_table.drop(ifExists: true)
            
            // Instruction pour faire un create de la table USERS
            let createTable = self.historique_table.create { table in
                table.column(self.historique_id, primaryKey: true)
                table.column(self.historique_date)
                table.column(self.historique_niveau)
                table.column(self.historique_couleur)
                table.column(self.historique_son)
                table.column(self.historique_score)
            }
            
            do {
                // Exécution du drop et du create
                //                try self.database.run(dropTable)
                try self.database.run(createTable)
                print ("Table historique est créée")
            }
            catch {
                print (error)
            }
        }
        print ("--> createTablehistorique fin")
    }
    
    // ===================================================
    // Création d'un générateur de clé primaire
    
    func getPK() {
        PersistancePartie.pk += 1
    }
    
    func insertPartie() {
        print ("--> insertTablehistorique debut")
        
        print (PersistancePartie.pk)
        getPK()
        let insert = self.historique_table.insert(
            self.historique_id <- 17,
            self.historique_date <- "a",
            //            self.historique_niveau <- self.insertParam?["niveau"]! ??  "value",
            //            self.historique_couleur <- self.insertParam?["couleur"]! ?? "hello",
            //            self.historique_son <- self.insertParam?["son"]! ?? "coucou",
            //            self.historique_score <- self.insertParam?["score"]! ?? "au revoir"
            self.historique_niveau <- "qq",
            self.historique_couleur <- "qq",
            self.historique_son <- "qq",
            self.historique_score <- "qq"
        )
        do {
            print(insert)
            try self.database.run(insert)
            print ("Insert ok")
        }
        catch {
            print (error)
        }
        print ("--> insertTableHistorique fin")
    }
    
    
}
