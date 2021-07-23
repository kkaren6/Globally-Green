//
//  picGalleryViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class picGalleryViewController: UIViewController {
    
    //photo group 1
    @IBOutlet var GG_3Tapped: UIButton!
    @IBAction func GG_3Tapped(_ sender: Any) {
        GG_4Tapped.isHidden = false
        GG_3Tapped.isHidden = true
    }
    @IBOutlet var GG_4Tapped: UIButton!
    @IBAction func GG_4Tapped(_ sender: Any) {
        caption1Tapped.isHidden = false
        GG_4Tapped.isHidden = true
    }
    @IBOutlet var caption1Tapped: UIButton!
    @IBAction func caption1Tapped(_ sender: Any) {
        GG_3Tapped.isHidden = false
        caption1Tapped.isHidden = true
    }
    
    //photo group 2
    @IBOutlet var GG_6Tapped: UIButton!
    @IBAction func GG_6Tapped(_ sender: Any) {
        GG_7Tapped.isHidden = false
        GG_6Tapped.isHidden = true
    }
    @IBOutlet var GG_7Tapped: UIButton!
    @IBAction func GG_7Tapped(_ sender: Any) {
        caption2Tapped.isHidden = false
        GG_7Tapped.isHidden = true
    }
    @IBOutlet var caption2Tapped: UIButton!
    @IBAction func caption2Tapped(_ sender: Any) {
        GG_6Tapped.isHidden = false
        caption2Tapped.isHidden = true
    }
    
    //photo group 3
    @IBOutlet var GG_28Tapped: UIButton!
    @IBAction func GG_28Tapped(_ sender: Any) {
        caption3Tapped.isHidden = false
        GG_28Tapped.isHidden = true
    }
    @IBOutlet var caption3Tapped: UIButton!
    @IBAction func caption3Tapped(_ sender: Any) {
        GG_28Tapped.isHidden = false
        caption3Tapped.isHidden = true
    }
    
    //photo group 4
    @IBOutlet var GG_10Tapped: UIButton!
    @IBAction func GG_10Tapped(_ sender: Any) {
        caption4Tapped.isHidden = false
        GG_10Tapped.isHidden = true
    }
    @IBOutlet var caption4Tapped: UIButton!
    @IBAction func caption4Tapped(_ sender: Any) {
        GG_10Tapped.isHidden = false
        caption4Tapped.isHidden = true
    }
    
    //photo group 5
    @IBOutlet var GG_11Tapped: UIButton!
    @IBAction func GG_11Tapped(_ sender: Any) {
        GG_12Tapped.isHidden = false
        GG_11Tapped.isHidden = true
    }
    @IBOutlet var GG_12Tapped: UIButton!
    @IBAction func GG_12Tapped(_ sender: Any) {
        caption5Tapped.isHidden = false
        GG_12Tapped.isHidden = true
    }
    @IBOutlet var caption5Tapped: UIButton!
    @IBAction func caption5Tapped(_ sender: Any) {
        GG_11Tapped.isHidden = false
        caption5Tapped.isHidden = true
    }
    
    
    
    
    @IBOutlet var pageCollection4: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GG_4Tapped.isHidden = true
        caption1Tapped.isHidden = true
        
        GG_7Tapped.isHidden = true
        caption2Tapped.isHidden = true
        
        caption3Tapped.isHidden = true
        
        caption4Tapped.isHidden = true
        
        GG_12Tapped.isHidden = true
        caption5Tapped.isHidden = true
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
