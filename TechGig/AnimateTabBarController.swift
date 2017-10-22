//
//  AnimateTabBarController.swift
//  TechGig
//
//  Created by Ashish Kumar Sonkar on 20/10/17.
//  Copyright © 2017 DeX Home Automation. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class AnimateTabBarController: RAMAnimatedTabBarController{

    @IBOutlet weak var barOutlet: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
