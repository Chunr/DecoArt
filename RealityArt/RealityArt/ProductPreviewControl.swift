//
//  ProductPreviewControl.swift
//  RealityArt
//
//  Created by Chun Chen on 7/14/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit

class ProductPreviewControl: UIView {

    var productPreviewViewController: ProductPreviewViewController?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func exitPreview(sender: UIButton) {
        self.productPreviewViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    func setParentViewController(viewController : ProductPreviewViewController) {
        self.productPreviewViewController = viewController;
    }
}
