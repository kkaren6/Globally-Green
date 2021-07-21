//
//  quizViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class quizViewController: UIViewController {

    @IBOutlet var pagesCollection2: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pageCollection2(_ sender: UIButton) {
        pagesCollection2.forEach { (button) in
            UIView.animate(withDuration: 0.6, animations:{
            button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    

    @IBAction func homeTapped(_ sender: UIButton) {
    }
    
}
