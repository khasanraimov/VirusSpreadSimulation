//
//  ViewController.swift
//  Virus Spread Simulator
//
//  Created by mac on 09.05.2023.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int?
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func groupSize(_ sender: Any) {
    }
    
    @IBAction func infectionFactor(_ sender: Any) {
    }
    
    @IBAction func timeInSeconds(_ sender: Any) {
    }
    @IBAction func startSimulator(_ sender: Any) {
        performSegue(withIdentifier: "SimulationViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SimulationViewController" {
            if let secondVC = segue.destination as? SimulationViewController {
                secondVC.count = Int(textField.text ?? "")
            }
        }
    }
}

