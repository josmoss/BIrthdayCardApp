//
//  CameraViewController.swift
//  BirthDay1stVC
//
//  Created by Joe Moss on 7/14/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    var theImage : UIImage?
    var pickedImage : UIImage?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
//        if let backgroundImage = self.theImage {
//        
//            self.imageView.image = theImage
//            
//        }
        
        self.imagePicker.delegate = self
       
    }
    
    @IBAction func chooseImage(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            imagePicker.sourceType = .Camera
            
        } else {
            self.imagePicker.sourceType = .PhotoLibrary
        }
        
        self.imagePicker.allowsEditing = true
        
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            self.imageView.contentMode = .ScaleAspectFit
            self.imageView.image = pickedImage
            self.pickedImage = pickedImage
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextTapped(sender: UIButton) {
        
//        self.selectedBackgroundImage = UIImage
        performSegueWithIdentifier("CombinedSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "CombinedSegue" {
            
            if let controller = segue.destinationViewController as? CombinedViewController {
                
                controller.cameraImage = self.pickedImage
                controller.backImage = self.theImage
                
            } else {
                print("Not the correct segue")
            }
        }

    }
    
}
