//
//  StarWarsUniverse.swift
//  StarWarsSwift
//
//  Created by Ivan on 10/05/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

import UIKit

func createStarWarsCharacterByName (Name name: String, andAlias alias:String?, andWikiUrl wikiUrl:String?, andSoundName soundName: String?, andSoundExtension soundExtension: String?, andPhotoName photoName: String?, andPhotoExtension photoextension:String?)->StarWarsCharacter
{
    //character
    var characterSound : NSData?
    var characterImage : UIImage?

    
    if let path = NSBundle.mainBundle().URLForResource(soundName!, withExtension: soundExtension)
    {
        characterSound = NSData(contentsOfURL: path)!
    }
    

    
    let characterURL = NSURL (string: wikiUrl!)!
    
    
    if let fileURL = NSBundle.mainBundle().URLForResource(photoName!, withExtension: photoextension)
    {
        
        let data : NSData = NSData(contentsOfURL: fileURL)!
        let image = UIImage(data: data)
        
        characterImage = image
    }
    
    
    return StarWarsCharacter(Name: name, andAlias: alias, andWikiUrl: characterURL, andSound: characterSound, andPhoto: characterImage)
    
    
}


func createStarWarsCharacterByAlias (Alias alias: String, andWikiUrl wikiUrl:String?, andSoundName soundName: String?, andSoundExtension soundExtension: String?, andPhotoName photoName: String?, andPhotoExtension photoextension:String?)->StarWarsCharacter
{
    //character
    var characterSound : NSData?
    var characterImage : UIImage?
    if let path = NSBundle.mainBundle().URLForResource(soundName!, withExtension: soundExtension)
    {
        characterSound = NSData(contentsOfURL: path)!
    }
    
    
    let characterURL = NSURL (string: wikiUrl!)!
    
    
    if let fileURL = NSBundle.mainBundle().URLForResource(photoName!, withExtension: photoextension)
    {
        
        let data : NSData = NSData(contentsOfURL: fileURL)!
        let image = UIImage(data: data)
        
        characterImage = image
    }
    
    
    return StarWarsCharacter(Alias: alias, andWikiUrl: characterURL, andSound: characterSound, andPhoto: characterImage)
    
    
}

class StarWarsUniverse: NSObject {
    
    var rebels = []
    var imperials = []
    
    
    
    //PROPIEDADES
    
    func rebelsCount () ->Int
    {
    return self.rebels.count;
    }
    
    
    func imperialsCount () ->Int
    {
        return self.imperials.count;
    }
    



    
    //INIT
    override init()
    {
        //vader
        var vaderSound : NSData?
        var vaderImage : UIImage?

        if let path = NSBundle.mainBundle().URLForResource("vader", withExtension: "caf")
        {
            vaderSound = NSData(contentsOfURL: path)!
        }
     
        
        let vaderURL = NSURL (string: "http://en.wikipedia.org/wiki/Darth_Vader")!
     
    
        if let fileURL = NSBundle.mainBundle().URLForResource("darthVader", withExtension: "jpg")
        {
            
            let data : NSData = NSData(contentsOfURL: fileURL)!
            let image = UIImage(data: data)

             vaderImage = image
        }
      

        let vaderCharacter = StarWarsCharacter(Name: "Anakin Skywalker", andAlias: "Darth Vader", andWikiUrl: vaderURL, andSound: vaderSound, andPhoto: vaderImage)
     
        
        //yoda
        var yodaSound : NSData?
        var yodaImage : UIImage?

        
        if let path = NSBundle.mainBundle().URLForResource("yoda", withExtension: "caf")
        {
            yodaSound = NSData(contentsOfURL: path)!
        }
        
        let yodaURL = NSURL (string: "http://en.wikipedia.org/wiki/Yoda")!
        
        
        if let fileURL = NSBundle.mainBundle().URLForResource("yoda", withExtension: "jpg")
        {
            
            let data : NSData = NSData(contentsOfURL: fileURL)!
            let image = UIImage(data: data)
            
            yodaImage = image
        }
        
        
        let yodaCharacter = StarWarsCharacter(Name: "Minch Yoda", andAlias: "Master Yoda", andWikiUrl: yodaURL, andSound: yodaSound, andPhoto: yodaImage)
        
        
        //palpatine
        var palpatineSound : NSData?
        var palpatineImage : UIImage?

        if let path = NSBundle.mainBundle().URLForResource("palpatine", withExtension: "caf")
        {
            palpatineSound = NSData(contentsOfURL: path)!
        }
        
        
        let palpatineURL = NSURL (string: "http://en.wikipedia.org/wiki/Palpatine")!
        
        
        if let fileURL = NSBundle.mainBundle().URLForResource("palpatine", withExtension: "jpg")
        {
            
            let data : NSData = NSData(contentsOfURL: fileURL)!
            let image = UIImage(data: data)
            
            palpatineImage = image
        }
        
        
        let palpatineCharacter = StarWarsCharacter(Name: "Papatine", andAlias: "Darth Sidious", andWikiUrl: palpatineURL, andSound: palpatineSound, andPhoto: palpatineImage)
        
        
        //C3PO
        
        let c3poCharacter = createStarWarsCharacterByAlias(Alias: "C3PO", andWikiUrl: "http://en.wikipedia.org/wiki/C-3PO", andSoundName: "c3po", andSoundExtension: "caf", andPhotoName: "c3po", andPhotoExtension: "jpg")
        
        //R2D2
        
        let r2d2Character = createStarWarsCharacterByAlias(Alias: "R2D2", andWikiUrl: "http://en.wikipedia.org/wiki/R2-D2", andSoundName: "r2-d2", andSoundExtension: "caf", andPhotoName: "R2-D2", andPhotoExtension: "jpg")
        
        //chew
        
        let chewCharacter = createStarWarsCharacterByAlias(Alias: "Chewbacca", andWikiUrl: "http://en.wikipedia.org/wiki/Chewbacca", andSoundName: "chewbacca", andSoundExtension: "caf", andPhotoName: "chewbacca", andPhotoExtension: "jpg")
        
        //tarkin
        
        let tarkinCharacter = createStarWarsCharacterByName(Name:"Wilhuf Tarkin", andAlias: "Grand Moff Tarkin", andWikiUrl: "http://en.wikipedia.org/wiki/Wilhuff_Tarkin", andSoundName: "tarkin", andSoundExtension: "caf", andPhotoName: "tarkin", andPhotoExtension: "jpg")
        
        
        
        imperials = [vaderCharacter, palpatineCharacter, tarkinCharacter];
        rebels = [yodaCharacter,c3poCharacter,r2d2Character,chewCharacter]
    }
    
    
 
    
    
    func rebelAtIndex(indice: Int) -> StarWarsCharacter
    {
      return rebels.objectAtIndex(indice) as! StarWarsCharacter
    }
    func imperialAtIndex(indice: Int) -> StarWarsCharacter
    {
        return imperials.objectAtIndex(indice) as! StarWarsCharacter
    }
}
