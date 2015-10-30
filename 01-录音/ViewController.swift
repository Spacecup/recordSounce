//
//  ViewController.swift
//  01-录音
//
//  Created by 余丽丽 on 15/10/30.
//  Copyright © 2015年 余丽丽. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    
    
    @IBAction func start(sender: AnyObject) {
        
        recorder.record()
        print("开始录音")
    }
    
    @IBAction func pause(sender: AnyObject) {
        recorder.pause()
        print("暂停录音")
    }
    
    @IBAction func end(sender: AnyObject) {
        recorder.stop()
        print("结束录音")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //获取沙盒路径
        print(fileUrl)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func paly(sender: AnyObject) {
        
        //定义音效的ID
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(self.fileUrl, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        
    }
    
    private lazy var recorder:AVAudioRecorder = {
        
        let setting = [AVEncoderAudioQualityKey: AVAudioQuality.High.rawValue]
        let recorder = try! AVAudioRecorder(URL: self.fileUrl, settings: setting)
        
    
        return recorder
    }()

    private lazy var fileUrl:NSURL = {
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!
        
        let file = path.stringByAppendingString("/abc.caf")
        let fileUrl = NSURL(fileURLWithPath: file)
        
        return fileUrl
        
        }()
    

}

