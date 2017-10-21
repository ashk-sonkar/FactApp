//
//  ViewController.swift
//  TechGig
//
//  Created by Ashish Kumar Sonkar on 06/10/17.
//  Copyright © 2017 DeX Home Automation. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var currentFact: UIView!
    @IBOutlet weak var factImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var factLabel: UILabel!
    
    let reachability = Reachability()!
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        self.view.backgroundColor = UIColor.blue
        reachability.whenReachable = { _ in
            print("Reachable")
            DispatchQueue.main.async {
                self.view.backgroundColor = UIColor.green
            }
        }
        reachability.whenUnreachable = { _ in
            DispatchQueue.main.async {
                self.view.backgroundColor = UIColor.red
            }
        }
            NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: Notification.Name.reachabilityChanged, object: reachability)
            do{
                try reachability.startNotifier()
            }catch{
                print("Could not start Notifier")
        }
        
        
        
    }
    @objc func internetChanged(note: Notification){
        let  reachability =  note.object as! Reachability
        if reachability.connection != .none{
            DispatchQueue.main.async {
                self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                self.displayCurrentFact()
                self.currentFact.isHidden = false
                self.factLabel.isHidden = false
                
                self.currentFact.layer.shadowOpacity = 1
                
                
            }
        }
            else{
                DispatchQueue.main.async {
                    self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.backgroundImage.image = nil
                    self.factLabel.text = "NO INTERNET CONNECTION"
                    self.factLabel.isHidden = true
                    self.factImage.image = #imageLiteral(resourceName: "error2")
                    self.currentFact.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.currentFact.layer.shadowOffset = CGSize(width: 0, height: 0)
                    
                    
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayCurrentFact(){

        // fetching current date
        super.viewDidLoad()
        let  date = NSDate()
        let format = DateFormatter()
        format.dateFormat = "MM/dd"
        let stringDate = format.string(from: date as Date)
        print(stringDate)
        
        // styling
        self.backgroundImage.image = #imageLiteral(resourceName: "bg3")
        factImage.image = #imageLiteral(resourceName: "cartoon1")
        factImage.alpha = 1
        currentFact.backgroundColor = UIColor.white
        currentFact.layer.cornerRadius = 10
        currentFact.layer.shadowColor = UIColor.black.cgColor
        currentFact.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        currentFact.layer.shadowRadius = 10
        currentFact.layer.shadowOpacity = 1
        currentFact.layer.masksToBounds = false
        
        //fetching and displaying fact
        var fact = ""
        let url = URL(string: "http://numbersapi.com/\(stringDate)/date")
        do{
            
            fact = try NSString(contentsOf:  url!, encoding: 2) as String
            print(fact)
            
        }catch{
            fact = "Error"
        }
        factLabel.text = fact
    }
    
    
}

