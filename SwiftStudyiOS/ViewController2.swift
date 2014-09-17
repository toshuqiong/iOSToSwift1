//
//  ViewController2.swift
//  SwiftStudyiOS
//
//  Created by shuqiong on 8/11/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Parallax"
        self.edgesForExtendedLayout = .None

        self.tableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.separatorStyle = .None
        self.tableView!.scrollEnabled = true
        self.view.addSubview(self.tableView)
        
        self.tableView!.registerClass(MenuCell.classForCoder(), forCellReuseIdentifier: "menucell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        self.scrollViewDidScroll(nil)
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 130
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {

        let cell = tableView.dequeueReusableCellWithIdentifier("menucell") as MenuCell
        
        cell.setContent(nil, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("selected: \(indexPath)")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        let visibleCells = self.tableView!.visibleCells()
        for cell in visibleCells {
            var menuCell = cell as MenuCell
            menuCell.cellOnTableView(self.tableView!, didScrollOnView: self.view)
        }
    }
}
