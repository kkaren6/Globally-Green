//
//  quizResultsViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/22/21.
//

import UIKit

class quizResultsViewController: UIViewController {

   
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalScore.text = "You got \(numberCorrect) out of 3 correct!"
        
        if numberCorrect == 0 {
            message.text = "Better Luck Next Time"
        } else if numberCorrect == 1 {
            message.text = "Not bad. Try again."
        } else {
            message.text = "Wow! Congrats!"
        }
    }
    
    
    

}
