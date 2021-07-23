//
//  quiz3ViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/22/21.
//

import UIKit

class quiz3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var popUpInfo2: UILabel!
    
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        popUpInfo2.text = "You got this!"
    }
    
    @IBAction func correctButton2(_ sender: UIButton) {
        numberCorrect += 1
        //third button
    }
    
    
}
