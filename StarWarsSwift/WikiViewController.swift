//
//  StarWarsCharacterViewController.swift
//  StarWarsSwift
//
//  Created by Ivan on 12/05/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate{

    var model : StarWarsCharacter

    @IBOutlet weak var browser: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    init (model: StarWarsCharacter)
    {
        self.model=model
        
        super.init(nibName: "WikiViewController", bundle: nil)

        
        self.title = model.name
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        browser.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "tableSelectChange:", name: "didSelectChange", object: nil)
        
        syncViewWithModel()
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    func tableSelectChange(notification: NSNotification) {
        
        let userInfo:Dictionary<String,StarWarsCharacter!> = notification.userInfo as! Dictionary<String,StarWarsCharacter!>
        
        self.model = userInfo["STAR_WARS_CHARACTER"]!
        
        syncViewWithModel()
        
    }

    func syncViewWithModel()->(){
        
        self.title = self.model.name
        
        if let valorWikiURL = self.model.wikiURL
        {
            let requestObj = NSURLRequest(URL: valorWikiURL);
            
            self.browser.loadRequest(requestObj)
    
        }

    }
    
    func webViewDidStartLoad(webView: UIWebView)
    {
        self.activityView.hidden = false
        self.activityView.startAnimating()
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView)
    {
        self.activityView.hidden = true
        self.activityView.stopAnimating()
        
    }
    
}
