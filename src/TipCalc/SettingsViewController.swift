//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Anoop tomar on 1/6/15.
//  Copyright (c) 2015 devtechie.com. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UITextField!
    
    @IBOutlet weak var defaultSplit: UITextField!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTip.text = defaults.objectForKey("dtip") as? String
        
        defaultSplit.text = defaults.objectForKey("dsplit") as? String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingSave(sender: AnyObject) {
        
        var newTip = defaultTip.text!.toInt()
        var newSplit = defaultSplit.text!.toInt()
        
        var saveAble = false
        
        if(newTip >= 1 && newTip <= 50){
            defaults.setObject(defaultTip.text, forKey: "dtip")
        }
        
        if(newSplit >= 1 && newSplit<=25){
            defaults.setObject(defaultSplit.text, forKey: "dsplit")
        }
        
        defaults.synchronize()
        dismissViewControllerAnimated(true, nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
