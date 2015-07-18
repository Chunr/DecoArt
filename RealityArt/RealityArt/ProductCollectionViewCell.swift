//
//  ProductCollectionViewCell.swift
//  RealityArt
//
//  Created by Chun Chen on 7/7/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var cover: UIImageView!
    
    private static var productImages = [Int : UIImage]()
    
    func setup(product: Product) {
        self.name.text = product.name
        self.price.text = "¥ \(product.price!)"
        self.loadCoverImage(product)
    }
    
    private func loadCoverImage(product: Product) {
        if let image = ProductCollectionViewCell.productImages[product.imageId!] {
            self.cover.image = image
        } else {
            self.cover.image = nil
            var url = NSURL(string: "\(Constants.URL_IMAGE_PRODUCT_BASE)\(product.imageId!).jpg")
            var request: NSURLRequest = NSURLRequest(URL: url!)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                var image = UIImage(data: data)
                ProductCollectionViewCell.productImages[product.imageId!] = image
                self.cover.image = image
                self.cover.frame = CGRect(origin: self.cover.frame.origin, size: CGSize(width: self.cover.frame.width, height: self.cover.frame.width))
            })
        }
    }
}
