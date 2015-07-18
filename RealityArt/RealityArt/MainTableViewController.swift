//
//  MainTableViewController.swift
//  RealityArt
//
//  Created by Chun Chen on 6/30/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource  {

    private var mainItems : [MainItem]?
    
    @IBOutlet
    var mainList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        self.mainList.registerNib(nib, forCellReuseIdentifier: "cell")
        self.mainItems = MainItemListLoader.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(Float(self.view.frame.size.width) * Constants.UI_MAIN_TABLE_CELL_RATIO)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("ProductCollectionViewController") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = self.mainItems {
            return items.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.mainList.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainTableViewCell
        cell.name.text = self.mainItems![indexPath.row].description
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
}
