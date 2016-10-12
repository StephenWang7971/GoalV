//
//  CheckViewController.swift
//  DreamComeTrue
//
//  Created by 水蒸气很快乐 on 16/10/12.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController,UITableViewDelegate,UITableViewDataSource

{
    var tableView : UITableView?
    var items :NSMutableArray?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "储蓄历史"
        self.navigationController?.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.white]
        setupTableView()
    }
    func setupTableView()
    {
        self.tableView = UITableView(frame:self.view!.frame)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.register(CheckTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view?.addSubview(self.tableView!)
    }
    // tableView 的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = String(format: "%i", indexPath.row+1)
        return cell
    }
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
