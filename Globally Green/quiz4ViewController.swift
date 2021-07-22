//
//  quiz4ViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/22/21.
//

import UIKit

class quiz4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var popUpInfo3: UILabel!
    
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        popUpInfo3.text = "You're doing great!"
    }
    
    @IBAction func buttonCorrect3(_ sender: UIButton) {
        numberCorrect += 1
        //first button
    }
    
}
