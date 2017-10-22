//
//  randomViewController.swift
//  TechGig
//
//  Created by Ashish Kumar Sonkar on 09/10/17.
//  Copyright © 2017 DeX Home Automation. All rights reserved.
//

import UIKit

class randomViewController: UIViewController {

    @IBOutlet weak var trivia: UIButton!
    @IBOutlet weak var maths: UIButton!
    @IBOutlet weak var date: UIButton!
    @IBOutlet weak var year: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TriviaButton(_ sender: Any) {
        getFact(about: "trivia")
    }
    @IBAction func MathsButton(_ sender: UIButton) {
        getFact(about: "math")
    }
    @IBAction func DateButton(_ sender: UIButton) {
        getFact(about: "date")
    }
    @IBAction func YearButton(_ sender: UIButton) {
        getFact(about: "year")
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
    
    func styleButtons(toStyle: UIButton){
        toStyle.layer.cornerRadius = 10
        toStyle.layer.masksToBounds = false
        toStyle.layer.shadowColor = UIColor.black.cgColor
        toStyle.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        toStyle.layer.shadowRadius = 10
        toStyle.layer.shadowOpacity = 1
    }
    
}
