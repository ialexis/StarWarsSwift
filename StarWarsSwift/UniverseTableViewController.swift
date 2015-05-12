//
//  UniverseTableViewController.swift
//  StarWarsSwift
//
//  Created by Ivan on 10/05/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

import UIKit


// Creación del protocolo para el delegado

protocol UniverseTableViewControllerDelegate {
    func didselectChange(universeVC: UniverseTableViewController, selectedCharacter : StarWarsCharacter)
}


class UniverseTableViewController: UITableViewController {
    
    // Declaro el delegado
    
    var delegate : UniverseTableViewControllerDelegate?
    
    
    
    //Declaro el modelo general
    var model = StarWarsUniverse();
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if (section == 0)
        {
            return model.imperialsCount()
        }
       else
        {
            return model.rebelsCount()
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0)
        {
            return "Imperials"
        }
        else
        {
            return "Rebels"
        }

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var swCharacter: StarWarsCharacter
        //Averiguamos el personaje
        if indexPath.section == 0
        {
            swCharacter = model.imperialAtIndex(indexPath.row)
        }
        else
        {
            swCharacter = model.rebelAtIndex(indexPath.row)

        }

        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        // Configure the cell...
        
        
        
            cell.imageView?.image = swCharacter.photo
            cell.textLabel?.text = swCharacter.alias
            cell.detailTextLabel?.text=swCharacter.name
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //averiguamos el modelo seleccionado
        
        var selectedCharacter = characterAtIndexPath(indexPath)
        
        
        
        
        //avisar al delegado
        
        self.delegate?.didselectChange(self, selectedCharacter: selectedCharacter)
        
        
        //mandamos notificacion
        let notification : NSNotificationCenter = NSNotificationCenter.defaultCenter()
        
        var userInfo = ["STAR_WARS_CHARACTER" : selectedCharacter]
        
        notification.postNotificationName("didSelectChange", object: self, userInfo: userInfo)
        
    }
    
    func characterAtIndexPath(indexpath : NSIndexPath)->StarWarsCharacter{
        
        var selectedCharacter : StarWarsCharacter
        
        if indexpath.section == 0{
            
            selectedCharacter = self.model.imperialAtIndex(indexpath.row)
            
        }else{
            
            selectedCharacter = self.model.rebelAtIndex(indexpath.row)
        }
        return selectedCharacter
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UniverseTableViewControllerDelegate

    func didselectChange(universeVC: UniverseTableViewController, swCharacter: StarWarsCharacter) {
        
        var characterVC : StarWarsCharacterViewController = StarWarsCharacterViewController(model: swCharacter)
        
        self.navigationController?.pushViewController(characterVC, animated: true)
        
        
    }

}
