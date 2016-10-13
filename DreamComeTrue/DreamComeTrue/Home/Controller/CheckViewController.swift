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
    var  account = ""
    var age:String?
    var finishtime:String?
    var starttime:String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "储蓄历史"
        self.navigationController?.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.white]
        self.items = NSMutableArray()
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
    //tableView的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return self.items!.count
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
        showCell.DateLabel.text = self.starttime
        //let selfaccount = String(describing: Int (self.account!))
       // print("------ \(String(describing: Int(self.account!)))")
     //   print("HELLO OF \(selfaccount)")
        showCell.TimeLabel.text = self.account
       //showCell.TimeLabel.text = "111111"
        showCell.GoalLabel.text = self.finishtime
        showCell.MoneyLabel.text = self.age
        return showCell
       }
       //获取 coreDate  存储的数据
    func getPerson()
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            print("numbers of \(searchResults.count)")
            self.items?.addObjects(from:searchResults)
              print(" \(self.items?.count)")
            for p in (searchResults as! [NSManagedObject])
            {
                print("account:  \(p.value(forKey: "account")!) finishtime: \(p.value(forKey: "finishtime")!)name:  \(p.value(forKey: "name")!) starttime: \(p.value(forKey: "starttime")!)")
              
                //self.account = p.value(forKey:"account")! as! String
                print(self.account)
                print(p.value(forKey:"account")!)
                
                let   myTest = p.value(forKey:"account")!
                print(myTest)
                self.account = myTest as! String

                
                print(self.account)
                //self.account = p.value(forKey:"account") as!String?
//                print(String(p.value(forKey:"account")),
////                String(String(self.account!))
////                print("---------------\((self.account!))")
//                self.finishtime = "\(p.value(forKey:"finishtime"))"
//                self.age = "\(p.value(forKey:"name"))"
//                self.starttime = "\(p.value(forKey:"starttime"))"
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
