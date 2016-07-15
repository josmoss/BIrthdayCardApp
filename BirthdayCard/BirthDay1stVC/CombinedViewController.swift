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

    @IBOutlet weak var camPicImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.camPicImageView.image = self.cameraImage
        self.backgroundImageView.image = self.backImage
        
        self.backgroundPlayer = self.getAudioPlayer("actionable", fileExt: "mp3")
        
        self.backgroundPlayer?.play()
        
        self.soundeffectsPlayer?.numberOfLoops = -1

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
