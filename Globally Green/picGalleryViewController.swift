//
//  picGalleryViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class picGalleryViewController: UIViewController {
    
    
    @IBOutlet var pageCollection4: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSelection4(_ sender: UIButton) {
        pageCollection4.forEach { (button) in
            UIView.animate(withDuration: 0.6, animations:{
            button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func miniQuizzTapped(_ sender: UIButton) {
    }
    
}
