//
//  moreInfoViewController.swift
//  Globally Green
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

let custom1 = UIColor(hexString: "#fcf4ed")
let custom2 = UIColor(hexString: "#464B3B")

class moreInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //dropdown
    @IBOutlet var pagesCollection3: [UIButton]!

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var hiddenSections = Set<Int>()
    let tableViewData = [
        [""],
        ["- Climate: the average weather of a place\n\n- Climate change: variation in the usual weather of a location\n     ex. change in annual \n     precipitation, change in a \n     location’s usual temperature for \n     a season\n\n- Global climate change: shift in all of the climates around the world\n\n- Weather can change on a daily basis, climate takes over hundreds of years to change\n\nEarth’s climate is constantly fluctuating between warmer and cooler due to natural causes. However, studies have shown that the Earth’s temperature has undergone unprecedented warming since the Industrial Revolution in the 1800s, leading experts to believe that human activity has increasingly accelerated global warming."],
        ["The Intergovernmental Panel on Climate Change (the United Nations body for scientific assessments related to climate change) found that there’s more than a 95% chance that human activities since the 1950s have been the main cause of global warming\n\nGreenhouse effect: the warming of the Earth as a result of various gases in the atmosphere, which trap heat from the sun that would otherwise escape into space\n     These gases are called greenhouse gases and include carbon dioxide, water vapor, nitrous oxide, chlorofluorocarbons, and methane"],
        ["tbd"],
        ["tbd"],
        ["tbd"],
        ["tbd"],
        ["tbd"],
        ["tbd"],
        ["tbd"]
    ]
    
    let headers = ["GENERAL INFO", "CLIMATE CHANGE DEFINITION", "HUMAN IMPACT", "CONSEQUENCES OF CLIMATE CHANGE", "POTENTIAL FUTURE EFFECTS", "", "WAYS TO HELP", "TRANSPORTATION", "DIET/FOOD", "PRODUCT CONSUMPTION"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.backgroundColor = UIColor.blue
       
       
        
        for section in 0..<(self.tableViewData.count){
            hideThis(section: section)
        }
        self.tableView.backgroundColor = custom1
        self.tableView.separatorColor = UIColor.clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return 0
        }
        
        return self.tableViewData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.tableViewData[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont(name:"Helvetica Light", size: 20.0)
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = custom1
        
        let view = UIView()
        view.backgroundColor = custom1;        cell.selectedBackgroundView = view
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionButton = UIButton()
        sectionButton.setTitle(headers[section],
                               for: .normal)
        if section != 5 && section != 6 && section != 0 {
            sectionButton.backgroundColor = custom2
            sectionButton.titleLabel?.font = UIFont(name:"Helvetica Light", size: 20.0)
        } else {
            sectionButton.backgroundColor = custom1
            sectionButton.titleLabel?.font = UIFont(name:"Helvetica", size: 35.0)
            sectionButton.setTitleColor(custom2, for: .normal)
            sectionButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        }
        sectionButton.tag = section
        sectionButton.addTarget(self,
                                action: #selector(self.hideSection(sender:)),
                                for: .touchUpInside)
        sectionButton.titleLabel?.numberOfLines = 0
        sectionButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        

        return sectionButton
    }
    
    
    @objc private func hideThis(section: Int) {
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
        
            for row in 0..<self.tableViewData[section].count {
            indexPaths.append(IndexPath(row: row,
                                        section: section))
            }
        
            return indexPaths
        }
    
        if self.hiddenSections.contains(section) {
            if section != 5 && section != 6 && section != 0 {
                self.hiddenSections.remove(section)
                self.tableView.insertRows(at: indexPathsForSection(),
                                  with: .fade)
            }
        } else {
            self.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(),
                                  with: .fade)
        }
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        let section = sender.tag
        
       
        hideThis(section: section)
    }

    
   //dropdown
    
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
