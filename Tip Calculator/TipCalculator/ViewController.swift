//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yash Mahajan on 1/31/19.
//  Copyright © 2019 Yash Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedPercentage: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipDisplay: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
         let bill = Double(billField.text!) ?? 0
         let tipPercent = [0.1, 0.15, 0.2]
         let tip = bill * tipPercent[selectedPercentage.selectedSegmentIndex]
         tipDisplay.text = String(format: "$%.2f", tip)
         totalDisplay.text = String(format: "$%.2f", tip+bill)
    }
}

