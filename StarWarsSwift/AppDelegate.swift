//
//  AppDelegate.swift
//  StarWarsSwift
//
//  Created by Ivan on 10/05/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
   
        //creamos el modelo
        
        var universe : StarWarsUniverse = StarWarsUniverse();
        
        //valor por defecto para ultimo personaje seleccionado
        var swCharacter : StarWarsCharacter
        
        /*
        let defaults = NSUserDefaults.standardUserDefaults()
        if let last_selected_character = defaults.stringForKey("LAST_SELECTED_CHARACTER")
        {
           
            /*
            let section = last_selected_character.objectAtIndex(0) as! Int
            let pos = last_selected_character.objectAtIndex(1) as! Int
            
            if section == 0
            {
                swCharacter = universe.imperialAtIndex(pos)
            }
            else
            {
                swCharacter = universe.rebelAtIndex(pos)
            }
            */
        }
        else
        {
            defaults.setObject([0:0], forKey: "LAST_SELECTED_CHARACTER")
            defaults.synchronize()
            
            swCharacter = universe.imperialAtIndex(0)
        }
        
        //saco las coordenadas del ultimo personaje
        */
        
       
        
        
        // Crear la UIWindow
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Crear el ViewController de Universe
        var vc = UniverseTableViewController(nibName:"UniverseTableViewController", bundle:nil)
        
        //Crear el viewcontroller de un personaje
        
        var charVC : StarWarsCharacterViewController?
        
        
        /*
        if let char : StarWarsCharacter = swCharacter as StarWarsCharacter?
        {
           charVC = StarWarsCharacterViewController(model: universe.imperialAtIndex(0))
        }
        */
         charVC = StarWarsCharacterViewController(model: universe.imperialAtIndex(0))
        
        //creamos los Navigation Controllers
        
        let uNav : UINavigationController = UINavigationController ()
        uNav.pushViewController(vc, animated: false)
        
        let charNav : UINavigationController = UINavigationController ()
        charNav.pushViewController(charVC!, animated: false)
        
        // Split
        
        var splitVC = UISplitViewController()
        splitVC.viewControllers = [uNav, charNav]
        
        // Asignacion delegados
        
        vc.delegate = charVC
     //   splitVC.delegate = characterVC
        
        window?.rootViewController = splitVC

        
        // Mostrarlo
        window?.makeKeyAndVisible()
        
        
        return true
    }
    

    


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

