//
//  StarWarsCharacter.swift
//  StarWarsSwift
//
//  Created by Ivan on 10/05/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

import UIKit

class StarWarsCharacter: NSObject {
    // Propiedades de instancia
    
    var name : String?
    var alias : String?
    var wikiURL :NSURL?
    var sound : NSData?
    var photo: UIImage?
    
    // Inits
    
    init(Name name: String, andAlias alias:String?, andWikiUrl wikiUrl:NSURL?, andSound sound: NSData?, andPhoto photo: UIImage?)
    {     // designate
        self.name = name
        self.alias = alias
        self.wikiURL = wikiUrl
        self.sound = sound
        self.photo=photo
    }
    

    
    
    // Designado: crea un Jedi completo, alicatado hasta el techo
    // con maestro incluido.
    convenience init(Alias alias:String?, andWikiUrl wikiUrl:NSURL?, andSound sound: NSData?, andPhoto photo: UIImage?)
    {
        self.init (Name: "",andAlias: alias,andWikiUrl: wikiUrl,andSound: sound,andPhoto: photo)
        
    }
    
   
}
