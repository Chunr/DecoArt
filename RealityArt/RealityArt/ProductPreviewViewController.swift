//
//  ProductPreviewViewController.swift
//  RealityArt
//
//  Created by Chun Chen on 7/14/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit
import AVFoundation

class ProductPreviewViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    
    var captureDevice : AVCaptureDevice?
    var previewLayer : AVCaptureVideoPreviewLayer?
    var previewControl : ProductPreviewControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set preview graphic quality
        self.captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
        //Pick camera device
        if self.captureDevice == nil {
            for device in AVCaptureDevice.devices() {
                // Make sure this particular device supports video
                if device.hasMediaType(AVMediaTypeVideo) {
                    // Finally check the position and confirm we've got the back camera
                    if device.position == AVCaptureDevicePosition.Back {
                        self.captureDevice = device as? AVCaptureDevice
                        break
                    }
                }
            }
        }
        
        if self.captureDevice != nil {
            self.beginPreview()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func beginPreview() {
        self.configureDevice()
        
        var err : NSError? = nil
        self.captureSession.addInput(AVCaptureDeviceInput(device: self.captureDevice, error: &err))
        
        if err != nil {
            NSLog("error: \(err?.localizedDescription)")
        }
        
        var minSize = min(self.view.bounds.size.width, self.view.bounds.size.height)
        var bounds: CGRect = CGRectMake(0.0, 0.0, minSize, minSize)
        
        //Setup preview layer
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.previewLayer!.bounds = bounds
        self.previewLayer!.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))
        self.previewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.previewLayer!.frame = self.view.layer.frame
        
        self.view.layer.addSublayer(self.previewLayer)
        self.captureSession.startRunning()
        
        //Setup preview controls
        self.previewControl = (NSBundle.mainBundle().loadNibNamed("ProductPreviewControl", owner: self, options: nil) as NSArray)[0]
            as? ProductPreviewControl
        self.previewControl!.frame = CGRect(x: 0, y: 200, width: bounds.width, height: 100)
        self.previewControl!.setParentViewController(self)
        self.view.addSubview(self.previewControl!)
        
        //Setup preview product
        var button = UIButton()
        button.backgroundColor = UIColor.brownColor()
        button.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
        button.setImage(UIImage(named: "MainListItem"), forState: UIControlState.Normal)
        self.view.addSubview(button)
    }
    
    func configureDevice() {
        self.captureDevice!.lockForConfiguration(nil)
        self.captureDevice!.focusMode = AVCaptureFocusMode.ContinuousAutoFocus
        self.captureDevice!.unlockForConfiguration()
    }
}
