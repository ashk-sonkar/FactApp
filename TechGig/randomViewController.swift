//
//  randomViewController.swift
//  TechGig
//
//  Created by Ashish Kumar Sonkar on 09/10/17.
//  Copyright © 2017 DeX Home Automation. All rights reserved.
//

import UIKit
import BEMCheckBox

class randomViewController: UIViewController {

    var categories  = ""
    var search = ""
    var fact = ""
    
    var group : BEMCheckBoxGroup!
    var group2 : BEMCheckBoxGroup!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var trivia: BEMCheckBox!
    @IBOutlet weak var maths: BEMCheckBox!
    @IBOutlet weak var date: BEMCheckBox!
    @IBOutlet weak var year: BEMCheckBox!
    
    @IBOutlet weak var random: BEMCheckBox!
    @IBOutlet weak var selected: BEMCheckBox!
    
    @IBOutlet weak var enterSearch: UITextField!
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var factContainer: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.group =  BEMCheckBoxGroup(checkBoxes: [trivia, maths, date, year])
        self.group2 = BEMCheckBoxGroup(checkBoxes: [random, selected])
        self.group.mustHaveSelection = true
        group2.mustHaveSelection = true
        
        group.selectedCheckBox = trivia
        group2.selectedCheckBox = random
        
        factContainer.isHidden = true
        cancelButton.isHidden = true
        
        style(toStyle: containerView)
        style(toStyle: factContainer)
        if(random.isEnabled == true){
            enterSearch.isHidden = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func getFact(about str: String){
        var fact = "fetching..."
        let url = URL(string: "http://numbersapi.com/random/\(str)")
        do{
            
            fact = try NSString(contentsOf:  url!, encoding: 2) as String
            print(fact)
            
        }catch{
            print("Caught")
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "displayVC") as! DisplayViewController
        vc.fact = fact
        present(vc, animated: true, completion: nil)
    }
    
    func style(toStyle: UIView){
        toStyle.layer.cornerRadius = 10
        toStyle.layer.masksToBounds = false
        toStyle.layer.shadowColor = UIColor.black.cgColor
        toStyle.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        toStyle.layer.shadowRadius = 10
        toStyle.layer.shadowOpacity = 1
    }
    
    @IBAction func randomOpted(_ sender: BEMCheckBox) {
        if(random.isEnabled == true){
            enterSearch.isHidden = true
        }
    }
    @IBAction func selectedOpted(_ sender: Any) {
        if(selected.isEnabled == true){
            enterSearch.isHidden = false
        }
        
    }
    
    func getCategory(){
        if(group.selectedCheckBox == trivia){
            categories = "trivia"
        }else if( group.selectedCheckBox == maths){
            categories = "math"
        }else if(group.selectedCheckBox == date){
            categories = "date"
        }else if(group.selectedCheckBox == year){
            categories = "year"
        }
    }
    @IBAction func getFactButton(_ sender: UIButton) {
        getCategory()
        print(categories)
        
        getfact()
        
        containerView.isHidden = true
        factContainer.isHidden = false
        cancelButton.isHidden = false
        
    }
    func getfact(){
        
        if(group2.selectedCheckBox == selected){
            let url = URL(string: "http://numbersapi.com/\( enterSearch.text!)/\(categories)")
            do{
                
                fact = try NSString(contentsOf:  url!, encoding: 2) as String
                print(fact)
                
            }catch{
                fact = "Error"
            }
        }
        else{
            let url = URL(string: "http://numbersapi.com/random/\(categories)")
            do{
                
                fact = try NSString(contentsOf:  url!, encoding: 2) as String
                print(fact)
                
            }catch{
                fact = "Error"
            }
        }
        factLabel.text = fact
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        factContainer.isHidden = true
        cancelButton.isHidden = true
        containerView.isHidden = false
        
    }
}
