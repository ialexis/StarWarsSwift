//
//  StarWarsCharacterViewController.swift
//  StarWarsSwift
//
//  Created by Ivan on 11/05/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

import UIKit

class StarWarsCharacterViewController: UIViewController, UniverseTableViewControllerDelegate, UISplitViewControllerDelegate {
    
    // MARK: - Properties
    
    var player:CafPlayer?
    var model: StarWarsCharacter?

    @IBOutlet weak var photoView: UIImageView!
    
    
    
    init (model: StarWarsCharacter)
    {
        
        super.init(nibName: "StarWarsCharacterViewController", bundle: nil)
        self.model=model
        
        self.title = model.alias
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        
        syncViewAndModel()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - IBACTIONS
    
    @IBAction func playSound(sender: AnyObject)
    {
        
        
        self.player = CafPlayer()
        self.player?.playSoundData(self.model?.sound)
      
    }
    
    @IBAction func displayWiki(sender: AnyObject)
    {
        
        var wikiVC : WikiViewController = WikiViewController(model: self.model!)
        
        self.navigationController?.pushViewController(wikiVC, animated: true)
        
    }

    // MARK: - Utils
    
    func syncViewAndModel()
    {
        self.photoView.image = self.model?.photo
        self.title = model!.alias
    }
    
    
    
    // MARK: - UniverseTableViewControllerDelegate
    
    func didselectChange(universeVC: UniverseTableViewController, selectedCharacter swCharacter: StarWarsCharacter) {
        
        self.model=swCharacter
        
        self.syncViewAndModel()

        
    }
    
    //MARK: - UISplitViewControllerDelegate
    
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
    }



}
