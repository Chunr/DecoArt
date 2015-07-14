//
//  ProductViewController.swift
//  RealityArt
//
//  Created by Chun Chen on 7/12/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit
import AVFoundation

class ProductViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    
    var captureDevice : AVCaptureDevice?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    @IBAction
    func openLiveView(sender: UIButton) {
        self.captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func beginPreview() {
        self.configureDevice()
        
        var err : NSError? = nil
        self.captureSession.addInput(AVCaptureDeviceInput(device: self.captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        var minSize = min(self.view.bounds.size.width, self.view.bounds.size.height)
        var bounds: CGRect = CGRectMake(0.0, 0.0, minSize, minSize)
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.previewLayer?.bounds = bounds
        self.previewLayer?.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))
        self.previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.previewLayer?.frame = self.view.layer.frame
        
        self.view.layer.addSublayer(self.previewLayer)
        self.captureSession.startRunning()
        
        
        var previewControl = (NSBundle.mainBundle().loadNibNamed("ProductPreviewControl", owner: self, options: nil) as NSArray)[0]
            as! ProductPreviewControl
        previewControl.frame = CGRect(x: 0, y: 200, width: bounds.width, height: 100)
        self.view.addSubview(previewControl)
    }
    
    func configureDevice() {
        if let device = self.captureDevice {
            device.lockForConfiguration(nil)
            device.focusMode = AVCaptureFocusMode.ContinuousAutoFocus
            device.unlockForConfiguration()
        }
    }
}
