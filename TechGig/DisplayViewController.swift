//
//  DisplayViewController.swift
//  TechGig
//
//  Created by Ashish Kumar Sonkar on 09/10/17.
//  Copyright © 2017 DeX Home Automation. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet weak var display: UITextView!
    
    var fact = "Nothing Yet"
    override func viewDidLoad() {
        super.viewDidLoad()

        display.text = fact
        styleItem(toStyle: display)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func styleItem(toStyle: UITextView){
        
        toStyle.isEditable = false
        toStyle.isSelectable = false
        toStyle.layer.cornerRadius = 10
        toStyle.layer.masksToBounds = false
        toStyle.layer.shadowColor = UIColor.black.cgColor
        toStyle.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        toStyle.layer.shadowRadius = 10
        toStyle.layer.shadowOpacity = 1
    }

}
