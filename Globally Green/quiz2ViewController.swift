//
//  quiz2ViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/22/21.
//

import UIKit

var numberCorrect = 0

class quiz2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var popUpInfo1: UILabel!
    
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        popUpInfo1.text = "Keep going!"
    }
    
   
    @IBAction func rightAnswer1(_ sender: UIButton) {
        numberCorrect += 1
        //second button
    }
    
}
