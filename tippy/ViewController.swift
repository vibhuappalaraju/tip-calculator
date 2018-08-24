//
//  ViewController.swift
//  tippy
//
//  Created by Vibhu Appalaraju on 8/10/18.
//  Copyright © 2018 Vibhu Appalaraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitTitle: UILabel!
    

    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet var myView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    var viewColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var colorNumber: Int!
    
    @IBOutlet weak var totalLeftLabel: UILabel!
    @IBOutlet weak var tipLeftLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var splitSlider: UISlider!
    let defaults = UserDefaults.standard
    
    @IBAction func slider(_ sender: UISlider) {
        splitLabel.text = String(Int(sender.value))
        calculateTip(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         let rowValue = defaults.integer(forKey: "num")
        tipControl.selectedSegmentIndex = rowValue
        
        calculateTip(0)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        let colorNumber = defaults.integer(forKey: "mode")
        
        if(colorNumber == 1){
            viewColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            myView.backgroundColor = viewColor
            
            
            tipLeftLabel.textColor = UIColor.white
            totalLeftLabel.textColor = UIColor.white
            billLabel.textColor = UIColor.white
            tipControl.tintColor = UIColor.white
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            billField.textColor = UIColor.white
            billField.backgroundColor = UIColor.gray
            settingsButton.tintColor = UIColor.black
            splitLabel.textColor = UIColor.white
            splitTitle.textColor = UIColor.white
            splitSlider.tintColor = UIColor.white
            
            
        }
        else{
            viewColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           
            settingsButton.tintColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            myView.backgroundColor = viewColor
            tipLeftLabel.textColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            totalLeftLabel.textColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            billLabel.textColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            tipControl.tintColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            billField.textColor = UIColor.black
             billField.backgroundColor = UIColor.white
            settingsButton.tintColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            
            splitLabel.textColor = UIColor.black
            splitTitle.textColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            splitSlider.tintColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
        }
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        billField.resignFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func onTap(_ sender: Any) {
       view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let splitVal = Double((splitLabel.text)!)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)/splitVal!
        defaults.set(bill, forKey: "bill")
        defaults.synchronize()
        
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = NSLocale.current
        let tipString = currencyFormatter.string(from: tip as NSNumber)
        let totalString = currencyFormatter.string(from: total as NSNumber)
        
        tipLabel.text = tipString
            //String(format: "$%.2f", tip)  //"$\(tip)" without decimal format
        totalLabel.text = totalString
            //String(format: "$%.2f", total) //"$\(total)" without decimal format
    }
}

