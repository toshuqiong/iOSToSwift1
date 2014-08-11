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
        
        self.tableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.view.addSubview(self.tableView)
        
        self.tableView!.registerClass(MenuCell.classForCoder(), forCellReuseIdentifier: "menucell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {

        let cell = tableView.dequeueReusableCellWithIdentifier("menucell") as MenuCell
        
        return cell
    }
}
