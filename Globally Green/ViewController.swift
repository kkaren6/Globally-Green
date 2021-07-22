//
//  ViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteBox: UITextView!
    
    var quotes = [
        "“There are no gray areas when it comes to survival.” - Greta Thunberg",
        "“And yes, we do need hope, of course we do. But the one thing we need more than hope is action. Once we start to act, hope is everywhere.” - Greta Thunberg",
        "“All we have to do is wake up and change.” - Greta Thunberg",
        "“We are the first generation to feel the effects of climate change and the last generation who can do something about it.” - President Obama",
        "“No challenge poses a greater threat to future generations than climate change.” - President Obama",
        "“Climate change is the single biggest thing that humans have ever done on this planet. The one thing that needs to be bigger is our movement to stop it.”",
        "“If I destroy nature, I destroy myself as well. I lose my dignity.” - Hindou Ibrahim",
        "“Earth provides enough to satisfy every man's needs, but not every man's greed.” - Gandhi",
        "“The climate is changing; why aren't we?”",
        "“Humans have wiped out or degraded nearly two-thirds of the world's tropical rainforests.” - Rainforest Foundation Norway",
        "“Climate change poses a major risk to the stability of the US financial system and to its ability to sustain the American economy.”",
        "“The worst impacts of climate change could be irreversible within the next 9 years.”"]
    
    func quoteGenerator () {
        let randomInt = Int.random(in:0..<11)
        let randomQuote = quotes[randomInt]
        quoteBox.text = randomQuote
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteGenerator()
        // Do any additional setup after loading the view.
    }


}

