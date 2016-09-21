//
//  ViewController.swift
//  Tipper
//
//  Created by Student on 9/13/16.
//  Copyright (c) 2016 Avery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var top: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
         top = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calcTip(sender: AnyObject) {
        
        if (billField.text!.isEmpty) {
            UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.subView.alpha = 0.0
                }, completion: nil)
            
        } else {
            UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.subView.alpha = 1.0
                }, completion: nil)
            
        }

        percentageLabel.text = String(format: "%i%%", Int(slider.value))
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(roundf(slider.value)) / 100.0
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func endEdit(sender: AnyObject) {
        if (top == true && billField.text!.isEmpty) {
            UIView.animateWithDuration(0.4, delay: 0.2, options: [], animations: {
                // Add the transformation in this block
                // self.container is your view that you want to animate
                self.billField.center.y += 120;
                }, completion: nil)
            top = false
        }
        
    }
    @IBAction func beginEdit(sender: AnyObject) {
        if (billField.text!.isEmpty && (top == false)) {
        UIView.animateWithDuration(0.4, delay: 0.2, options: [], animations: {
            // Add the transformation in this block
            // self.container is your view that you want to animate
            self.billField.center.y -= 120;
            }, completion: nil)
            top = true
        }
    }
}

