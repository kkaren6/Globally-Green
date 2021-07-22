//
//  DailyChallengeViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class DailyChallengeViewController: UIViewController {
    let easy = ["Open your windows at least 5 minutes each day and reduce the indoor air pollution in your home","Take short showers instead of baths","Purify the air in your home with indoor plants. Plants clean the air from toxins and produce oxygen", "Use old clothes as cleaning rags","Avoid purchasing bottled water","Choose to have receipts emailed", "Pasta/rice water is great for watering plants: full of starch and rich in minerals and vitamins, it acts as a natural fertilizer (make sure it is not salted though!)", "Bring in natural light more often (instead of making your electricity bill go higher)","Hang or line-dry your laundry instead of using a tumble dryer", "Use soap bars instead of liquid soaps"]
    let hard = ["Use safe and environmentally-friendly cleaning products (ex. baking soda, soap flakes, lemon, cornstarch and vinegar)", "Make your own hand sanitizer using rubbing alcohol, aloe vera gel, essential oil drops, and a reusable bottle", "Buy furniture made from reclaimed wood or recycled materials", "Buying loose tea and using a tea strainer requires zero-waste and are generally of higher quality because they are made of whole, unbroken leaves compared to individual tea bags"]
    @IBOutlet weak var challenge: UILabel!
    @IBOutlet var pagesCollection: [UIButton]!
    
    @IBAction func hardBtn(_ sender: Any) {
        challenge.text = hard.randomElement()
        challenge.font = UIFont(name:"Helvetica Light", size: 20.0)
    }
    @IBAction func easyBtn(_ sender: Any) {
        challenge.text = easy.randomElement()
        challenge.font = UIFont(name:"Helvetica Light", size: 20.0)
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
