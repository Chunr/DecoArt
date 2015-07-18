//
//  ProductCollectionViewController.swift
//  RealityArt
//
//  Created by Chun Chen on 7/7/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit

class ProductCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var products = [Product]()
    
    @IBOutlet
    var productList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.products = ProductListLoader.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.productList.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCollectionViewCell
        var product = self.products[indexPath.row]
        cell.setup(product)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var width : CGFloat
        if (self.view.frame.size.width > 500) {
            width = self.view.frame.size.width / 3
        } else {
            width = self.view.frame.size.width / 2
        }
        width = width - 5
        return CGSizeMake(width, width * 1.25)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("ProductViewController") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
