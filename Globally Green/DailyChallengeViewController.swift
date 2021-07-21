//
//  DailyChallengeViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class DailyChallengeViewController: UIViewController {

    @IBOutlet var pagesCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        pagesCollection.forEach { (button) in
            UIView.animate(withDuration: 0.6, animations:{
            button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func pageTapped(_ sender: UIButton) {
    }
    
}
