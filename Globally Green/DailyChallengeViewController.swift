//
//  DailyChallengeViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class DailyChallengeViewController: UIViewController {
    let easy = ["Open your windows at least 5 minutes each day and reduce the indoor air pollution in your home","Take short showers instead of baths","Purify the air in your home with indoor plants. Plants clean the air from toxins and produce oxygen"]
    let hard = ["Use soap bars instead of liquid soaps","Use safe and environmentally-friendly cleaning products (ex. baking soda, soap flakes, lemon, cornstarch and vinegar)"]
    @IBOutlet weak var challenge: UILabel!
    @IBOutlet var pagesCollection: [UIButton]!
    
    @IBAction func hardBtn(_ sender: Any) {
        challenge.text = easy.randomElement()
        challenge.font = UIFont(name:"Helvetica", size: 20.0)
    }
    @IBAction func easyBtn(_ sender: Any) {
        challenge.text = easy.randomElement()
        challenge.font = UIFont(name:"Helvetica", size: 20.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        challenge.numberOfLines = 0

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
