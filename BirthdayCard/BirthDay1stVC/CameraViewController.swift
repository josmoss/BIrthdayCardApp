//
//  CameraViewController.swift
//  BirthDay1stVC
//
//  Created by Joe Moss on 7/14/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var theImage : UIImage?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        if let backgroundImage = self.theImage {
        
        self.imageView.image = theImage
            
        }
       
    }

}
