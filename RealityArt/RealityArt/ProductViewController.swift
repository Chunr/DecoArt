//
//  ProductViewController.swift
//  RealityArt
//
//  Created by Chun Chen on 7/12/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBAction
    func openPreview(sender: UIButton) {
        
        
        let sb = UIStoryboard(name:"Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("ProductPreviewViewController") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
