//
//  CombinedViewController.swift
//  BirthDay1stVC
//
//  Created by Joe Moss on 7/15/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit
import AVFoundation

class CombinedViewController: UIViewController {
    
    var backImage : UIImage?
    
    var cameraImage : UIImage?
    
    var backgroundPlayer:AVAudioPlayer?
    
    var soundeffectsPlayer:AVAudioPlayer?
    
    var timer : NSTimer?
    
    var pinchCharacter : PinchZoomImageView?

    @IBOutlet weak var camPicImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var flameImageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.camPicImageView.image = self.cameraImage
        
        self.backgroundImageView.image = self.backImage
        
        self.backgroundPlayer = self.getAudioPlayer("actionable", fileExt: "mp3")
        
        self.backgroundPlayer?.play()
        
        self.soundeffectsPlayer?.numberOfLoops = -1
        
        self.gestureControl()
        
        self.animateFlame()

    }
    
    func animateFlame() {
        
        var imagesArray = [UIImage]()
        
        for i in 1...31 {
            if let image = UIImage(named: "flame\(i)") {
                imagesArray.append(image)
//                print("flame\(i)")
            }
        }
        
        flameImageVIew.animationImages = imagesArray
        flameImageVIew.animationDuration = 1.0
        flameImageVIew.animationRepeatCount = 0
        flameImageVIew.startAnimating()
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(moveFlame), userInfo: nil, repeats: true)
    }
    
    func moveFlame() {
        
        let width = self.view.frame.size.width * 0.5
        let height = self.view.frame.size.height * 0.2
        
        
        let xCoordinate : CGFloat = CGFloat(width)
        let yCoordinate : CGFloat = CGFloat(height)
        
        UIView.animateWithDuration(2.0) {
            
            self.flameImageVIew.center = CGPoint(x: xCoordinate, y: yCoordinate)
            
        }
        
    }
    
    func gestureControl() {
        
        self.pinchCharacter = PinchZoomImageView(image: UIImage(named: "minion"))
        
        if let myChar = self.pinchCharacter {
            
            let width = self.view.frame.size.width / 2
            let height = self.view.frame.size.height / 2
            
            let randomX = CGFloat(arc4random_uniform(UInt32(width)))
            
            let randomY = CGFloat(arc4random_uniform(UInt32(height)))
            
            let newFrame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            
            myChar.frame = newFrame
            
            self.view.addSubview(myChar)
            
        }

    }
    
    func getAudioPlayer(filename: String, fileExt: String) -> AVAudioPlayer? {
        
        var audioPlayer : AVAudioPlayer?
        
        // Get a pointer to the reference of the file
        if let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileExt) {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: filePath)
                
                audioPlayer?.volume = 1.0
                audioPlayer?.prepareToPlay()
                
            } catch {
                
                print("An error occured")
                
            }
            
        } else {
            print("I cant find the file")
        }
        
        return audioPlayer
    }

}
