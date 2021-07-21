//
//  moreInfoViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class moreInfoViewController: UIViewController {

    @IBOutlet var pagesCollection3: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSelection3(_ sender: UIButton) {
        pagesCollection3.forEach { (button) in
            UIView.animate(withDuration: 0.6, animations:{
            button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func photoGalleryTapped(_ sender: UIButton) {
    }
    

}
