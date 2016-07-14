//
//  BackgroundPicViewController.swift
//  BirthDay1stVC
//
//  Created by Joe Moss on 7/14/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class BackgroundPicViewController: UIViewController {
    
    var selectedBackgroundImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func castleTapped(sender: UIButton) {
        
        self.selectedBackgroundImage = UIImage(named: "castleBackground")
        performSegueWithIdentifier("CameraSegue", sender: self)
        
    }
    
    @IBAction func cityTapped(sender: UIButton) {
        
        self.selectedBackgroundImage = UIImage(named: "cityBackground")
        performSegueWithIdentifier("CameraSegue", sender: self)
        
    }
    
    @IBAction func funTapped(sender: UIButton) {
        
        self.selectedBackgroundImage = UIImage(named: "funBackground")
        performSegueWithIdentifier("CameraSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "CameraSegue" {
            
            if let controller = segue.destinationViewController as? CameraViewController {
                controller.theImage = self.selectedBackgroundImage
                
            } else {
                print("Not the correct segue")
            }
        }
    }

}
