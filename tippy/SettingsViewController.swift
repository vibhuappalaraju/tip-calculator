//
//  SettingsViewController.swift
//  tippy
//
//  Created by Vibhu Appalaraju on 8/11/18.
//  Copyright © 2018 Vibhu Appalaraju. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Access UserDefaults
    let defaults = UserDefaults.standard

    @IBOutlet weak var backButton: UINavigationItem!
    
    @IBOutlet weak var moonImage: UIImageView!
    @IBOutlet var myView: UIView!
    @IBOutlet weak var mySwitch: UISwitch!
    
    var viewColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var colorNumber: Int!

    
    
    
    
    @IBOutlet weak var themeLabel: UILabel!
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    let dataPicker = [18,20,25]
    override func viewDidLoad() {
        super.viewDidLoad()
        let rowValue = defaults.integer(forKey: "num")
        
        // Do any additional setup after loading the view.
        picker.selectRow(rowValue,inComponent: 0,animated: true)
        
        let colorNumber = defaults.integer(forKey: "mode")
    
        
        if(colorNumber == 1){
            mySwitch.setOn(true, animated: true)
            switchClicked(0)
        }
        else{
            mySwitch.setOn(false, animated: false)
            switchClicked(0)
            
        }
        
   
    }

    
    
    // Number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataPicker.count
    }

 
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let string = String(self.dataPicker[row]) + "%"
         let colorNumber = defaults.integer(forKey: "mode")
        if(colorNumber == 1 ){
            return NSAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
        else{
            return NSAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])}
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // saving default tip value
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaults.set(row, forKey: "num")
        defaults.synchronize()
    }
    
    
    @IBAction func switchClicked(_ sender: Any) {
        if (mySwitch.isOn == true){
            let colorNum = defaults.integer(forKey: "mode")
            if(colorNum == 1){
                 viewColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                 myView.backgroundColor = viewColor
            }
            else{ viewColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                UIView.animate(withDuration: 1, animations: {
                    self.myView.backgroundColor = self.viewColor
                }, completion: nil)
            }
           
            defaultTipLabel.textColor = UIColor.white
            themeLabel.textColor = UIColor.white
            mySwitch.onTintColor = UIColor.blue
            let image : UIImage = UIImage(named:"moongrey")!
            moonImage = UIImageView(image: image)
            
            colorNumber = 1
        UserDefaults.standard.set(colorNumber, forKey: "mode")
            defaults.synchronize()
            //pickerView(picker, attributedTitleForRow: 2, forComponent: 1)
          // picker.setNeedsDisplay();
            self.picker.reloadAllComponents();
        
        }else {
            viewColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            UIView.animate(withDuration: 1, animations: {
                self.myView.backgroundColor = self.viewColor
            }, completion: nil)
           // myView.backgroundColor = viewColor
            defaultTipLabel.textColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            themeLabel.textColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            mySwitch.onTintColor = UIColor(red: 0.2275, green: 0.8588, blue: 0.0824, alpha: 1.0) /* #3adb15 */
            let image : UIImage = UIImage(named:"moongreen")!
            moonImage = UIImageView(image: image)
        
            colorNumber = 2
            defaults.set(colorNumber, forKey: "mode")
            UserDefaults.standard.synchronize()
            self.picker.reloadAllComponents();
            
        }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
