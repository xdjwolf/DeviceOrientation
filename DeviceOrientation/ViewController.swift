//
//  ViewController.swift
//  DeviceOrientation
//
//  Created by Apple on 16/4/22.
//  Copyright © 2016年 xidian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orientationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedRotation:", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        UIDevice.currentDevice().endGeneratingDeviceOrientationNotifications()
        
    }
    func receivedRotation(notification:NSNotification)
    {
        let device = UIDevice.currentDevice()
        switch device.orientation
        {
        case .Portrait:
            self.orientationLabel.text = "竖直向上"
        case .PortraitUpsideDown:
            self.orientationLabel.text = "竖直向下"
        case.LandscapeLeft:
            self.orientationLabel.text = "水平向左"
        case.LandscapeRight:
            self.orientationLabel.text  = "水平向右"
        case.FaceUp:
            self.orientationLabel.text = "面朝上"
        case.FaceDown:
            self.orientationLabel.text = "面朝下"
        case.Unknown:
            self.orientationLabel.text = "未知"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

