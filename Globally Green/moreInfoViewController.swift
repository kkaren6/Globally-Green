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
        ["- Climate: the average weather of a place\n\n- Climate change: variation in the usual weather of a location\n     ex. change in annual \n     precipitation, change in a \n     location’s usual temperature\n     for a season, etc.\n\n- Global climate change: shift in all of the climates around the world\n\n- Weather can change on a daily basis, climate takes over hundreds of years to change\n\nEarth’s climate is constantly warming and cooling due to natural causes. However, studies have shown that the Earth’s temperature has undergone unprecedented warming since the Industrial Revolution in the 1800s, leading experts to believe that human activity has increasingly accelerated global warming."],
        ["The Intergovernmental Panel on Climate Change (the United Nations body for scientific assessments related to climate change) found that there’s more than a 95% chance that human activities since the 1950s have been the main cause of global warming\n\nGreenhouse effect: the warming of the Earth as a result of various gases in the atmosphere, which trap heat from the sun that would otherwise escape into space\n     These gases are called \n     greenhouse gases and\n     include carbon dioxide, \n     water vapor, nitrous oxide,\n     chlorofluorocarbons, \n     and methane\n\nWhile the natural greenhouse effect keeps the Earth’s temperature habitable, human activities have enhanced the greenhouse effect by greatly increasing the amount of greenhouse gases released. Such activities include:\n\n   - Burning fossil fuels: Fossil fuels such as coal, gas, and oil release carbon dioxide into the atmosphere when burned to power cars, machines, and generate electricity\n\n   - Deforestation: Trees remove and store carbon dioxide from the atmosphere. Consequently, deforestation leads to an increased buildup of carbon dioxide, as there are no trees to absorb the gas. Furthermore, when trees are burned, they release the CO2 stored within them\n\n   - Agriculture: Agriculture contributes to climate change through greenhouse gas emissions, deforestation for agricultural land, accelerated soil erosion, and ocean acidification from agricultural chemical wastes. Many modern crop growing practices use synthetic fertilizers, which contain nitrous oxide. Animals maintained in livestock farming produce methane as they digest their food\n\n   - Industrialization: Manufacturing, especially for products such as steel and cement, is responsible for a third of global greenhouse gas emissions. Industrialization-caused urbanization results in overcrowding, pollution, and poor sanitation, as well as further deforestation and burning of fossil fuels\n\nEach year, 50 billion tonnes of CO2 are emitted globally. Today, the carbon dioxide in the atmosphere is the highest it has been in the past 800,000 years. In addition, CO2 levels rose by 40% during just the 20th and 21st century"],
        ["Global Temperature Rise: since the late 19th century, Earth’s average surface temperature has risen about 2.12 degrees Fahrenheit\n\nExtreme Weather Events: Both the intensity and frequency of extreme weather events (hurricanes, tornadoes, floods, wildfires, etc.) have increased over the past few decades\n\nWarming Ocean: the ocean has absorbed much of the increased heat, with the top 100 meters of ocean warming more than 0.6 degrees Fahrenheit since 1969\n\nSea Level Rise: the global sea level rose around 8 inches over the last century. Additionally, the rate of sea level rise in the last two decades is nearly double that of the last century, and is increasingly accelerating\n\nOcean Acidification: As a result of absorbing human CO2 emissions, the acidity of surface ocean waters has increased by about 30% since the start of the Industrial Revolution\n\nShrinking Ice Sheets: Data shows that between 1993 and 2019, Greenland lost around 279 billion tons of ice per year, and Antarctica lost around 148 billion tons of ice per year\n\nGlacial Retreat: glaciers all around the world are retreating and disappearing\n\nDecreased Snow Cover: satellite observations show that the spring snow cover in the Northern Hemisphere has decreased over the past five decades, and the snow is melting earlier\n\nDeclining Arctic Sea Ice: over the past few decades, the magnitude and thickness of Arctic sea ice has rapidly declined."],
        ["Weather: Warmer temperatures also make weather more extreme. This results in not only more intense major storms, floods, and heavy snowfall, but also longer and more frequent droughts. By the end of this century, what have been once-in-20-year extreme heat days are projected to occur every two or three years over most of the United States\n\nFood: The increase in extreme weather also causes growing crops to become more difficult. The areas where plants and animals can live shift and water supplies decrease\n\nHealth: In urban areas, the warmer atmosphere creates an environment that traps and increases the amount of smog. Exposure to higher levels of smog leads to health problems such as asthma, heart disease, and lung cancer\n\nOceans: Added water from melting ice sheets and the expansion of seawater as it warms causes sea levels to rise and spill out of the oceans, flooding coastal regions. Sea levels are expected to rise 1-8 feet by 2100. Furthermore, by the mid-century, the Arctic Ocean is expected to become essentially ice free during the summer months"],
        ["empty"],
        ["empty"],
        ["tbd"],
        ["tbd"],
        ["tbd"]
    ]
    
    let headers = ["GENERAL INFO", "CLIMATE CHANGE DEFINITION", "HUMAN IMPACT", "EVIDENCE OF CLIMATE CHANGE", "EFFECTS OF CLIMATE CHANGE", "", "WAYS TO HELP", "TRANSPORTATION", "DIET/FOOD", "PRODUCT CONSUMPTION"]
    
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
        cell.textLabel?.font = UIFont(name:"Helvetica Light", size: 22.0)
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
            sectionButton.titleLabel?.font = UIFont(name:"Helvetica Light", size: 22.0)
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
