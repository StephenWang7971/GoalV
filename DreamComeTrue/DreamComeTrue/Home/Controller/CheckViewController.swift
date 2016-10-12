//
//  CheckViewController.swift
//  DreamComeTrue
//
//  Created by 水蒸气很快乐 on 16/10/12.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit
import CoreData
class CheckViewController: UIViewController,UITableViewDelegate,UITableViewDataSource

{
    var tableView : UITableView?
    var items :NSMutableArray?
    var account:String?
    var age:String?
    var finishtime:String?
    var starttime:String?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "储蓄历史"
        self.navigationController?.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.white]

        getPerson()
        setupTableView()
    }
    func setupTableView()
    {
        self.tableView = UITableView(frame:self.view!.frame)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView?.register(UINib(nibName: "CheckTableViewCell", bundle: nil), forCellReuseIdentifier:"cell")
        
        self.view?.addSubview(self.tableView!)
    }
    // tableView 的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    func getContext () -> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       var showCell: CheckTableViewCell! = self.tableView!.dequeueReusableCell(withIdentifier: "cell") as? CheckTableViewCell
        if showCell == nil
        {
            showCell = self.tableView!.dequeueReusableCell(withIdentifier: "cell") as? CheckTableViewCell

        }
        showCell = self.tableView?.dequeueReusableCell(withIdentifier: "cell")as?CheckTableViewCell
        showCell.DateLabel.text = "11111111111"
        showCell.TimeLabel.text = self.starttime
        showCell.GoalLabel.text = self.finishtime
        showCell.MoneyLabel.text = self.age

        return showCell
       
    }
       //获取 coreDate  存储的数据
    func getPerson(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            print("numbers of \(searchResults.count)")
            
            for p in (searchResults as! [NSManagedObject])
            {
                print("account:  \(p.value(forKey: "account")!) finishtime: \(p.value(forKey: "finishtime")!)name:  \(p.value(forKey: "name")!) starttime: \(p.value(forKey: "starttime")!)")
              
                self.account = "\(p.value(forKey:"account"))"
                self.finishtime = "\(p.value(forKey:"finishtime"))"
                self.age = "\(p.value(forKey:"name"))"
                self.starttime = "\(p.value(forKey:"starttime"))"
                
                
                
            }
        } catch
        {
            print(error)
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
