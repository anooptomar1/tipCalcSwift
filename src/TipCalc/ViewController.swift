//
//  ViewController.swift
//  TipCalc
//
//  Created by Anoop tomar on 1/3/15.
//  Copyright (c) 2015 devtechie.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipAmtLabel: UILabel!
    @IBOutlet weak var splitAmtLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercents = [10.0, 15.0, 18.0, 20.0]
    var tipValue = 10.0
    
    var splitValue = 1
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tipLabel.text = defaults.objectForKey("dtip") as? String;
        tipAmtLabel.text = "$0.00";
        
        var tempSplit = defaults.objectForKey("dsplit") as? String
        var tempTip = defaults.objectForKey("dtip") as? String
        
        splitLabel.text = tempSplit!
        tipLabel.text = tempTip!
        
        if(tempSplit == nil){
            splitValue = 1
        }else{
            splitValue = splitLabel.text!.toInt()!
        }
        
        if(tempTip == nil){
            tipValue = 10.0
        }else{
            tipValue = (tempTip! as NSString).doubleValue
        }
        
        
        splitAmtLabel.text = "$0.00"
        
        totalLabel.text = "$0.00"
        calculateTotal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnEditingChanged(sender: AnyObject) {
        
        calculateTotal()
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func tipUpBtn(sender: AnyObject) {
        if(tipValue>=50){
            tipValue = 50.0
        }else{
            tipValue++
        }
        calculateTotal()
    }
    
    
    @IBAction func tipDownBtn(sender: AnyObject) {
        if(tipValue<=1){
            tipValue = 1.0
        }else{
            tipValue--
        }
        calculateTotal()
    }
    
    @IBAction func tipChanged(sender: AnyObject) {
        tipValue = tipPercents[tipControl.selectedSegmentIndex]
        calculateTotal()
    }
    func calculateTotal(){
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = 0.0
        tip = billAmount * (Double(tipValue)/100)
        
        var total = billAmount + tip
        
        splitAmtLabel.text = String(format: "$%.2f",total/Double(splitValue))
        splitLabel.text = "\(splitValue)"
        tipLabel.text = String(format: "%.0f", tipValue)
        tipAmtLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
    
    @IBAction func splitUp(sender: AnyObject) {
        if(splitValue>=50){
            splitValue = 50
        }else{
            splitValue++
        }
        calculateTotal()
    }
    
    @IBAction func splitDown(sender: AnyObject) {
        if(splitValue<=1){
            splitValue = 1
        }else{
            splitValue--
        }
        calculateTotal()
    }
    
    
    @IBAction func openSettings(sender: AnyObject) {
        performSegueWithIdentifier("settingSegue", sender: self)
    }
}

