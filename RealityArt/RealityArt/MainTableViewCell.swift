//
//  MainTableViewCell.swift
//  RealityArt
//
//  Created by Chun Chen on 6/30/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var cover: UIImageView!
    
    private static var mainItemImages = [Int : UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(mainItem: MainItem) {
        self.name.text = mainItem.description
        self.loadCoverImage(mainItem)
    }
    
    private func loadCoverImage(mainItem: MainItem) {
        if let image = MainTableViewCell.mainItemImages[mainItem.imageId!] {
            self.cover.image = image
        } else {
            self.cover.image = nil
            var url = NSURL(string: "\(Constants.URL_IMAGE_MAIN_BASE)\(mainItem.imageId!).jpg")
            var request: NSURLRequest = NSURLRequest(URL: url!)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                var image = UIImage(data: data)
                MainTableViewCell.mainItemImages[mainItem.imageId!] = image
                self.cover.image = image
            })
        }
    }
    
}
