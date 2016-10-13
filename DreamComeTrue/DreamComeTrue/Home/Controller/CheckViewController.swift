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
    //var ageAry :NSMutableArray?
    var ageAry:[AnyObject] = []
    var finishtimeAry:[AnyObject] = []
    var starttimeAry :[AnyObject] = []
    var accountAry:[AnyObject] = []
    var account :AnyObject!
    var age :AnyObject!
    var finishtime:AnyObject!
    var starttime :AnyObject!
    var  number: AnyObject!
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
    //tableView的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return number as! Int
    }
    func getContext () -> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      //var showCell: CheckTableViewCell! = self.tableView!.dequeueReusableCell(withIdentifier: "cell", forIndexPath:indexPath) as? CheckTableViewCell
       var showCell: CheckTableViewCell!  = self.tableView!.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as?CheckTableViewCell
        
        if showCell == nil
        {
            showCell = self.tableView!.dequeueReusableCell(withIdentifier: "cell") as? CheckTableViewCell

        }
        showCell = self.tableView?.dequeueReusableCell(withIdentifier: "cell")as?CheckTableViewCell
        let myData = SaveDataBase()
        myData.Maccount = self.accountAry[indexPath.row] as? String
        print("HEll0----",self.accountAry.count)
        showCell.MoneyLabel.text = "11111111"

//        print(self.starttime)
//    
       showCell.GoalLabel.text = self.age as! String?
        showCell.MoneyLabel.text = self.finishtime as! String?
        return showCell
       }
       //获取 coreDate  存储的数据
    func getPerson()
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do {
            let   searchResults = try getContext().fetch(fetchRequest)
             self.items?.addObjects(from: searchResults)
            print("numbers of \(searchResults.count)")
            number = Int(searchResults.count) as AnyObject?
            print(" \(self.items?.count)")
            for p in (searchResults as! [NSManagedObject])
            {
                print("account:  \(p.value(forKey: "account")!) finishtime: \(p.value(forKey: "finishtime")!)name:  \(p.value(forKey: "name")!) starttime: \(p.value(forKey: "starttime")!)")
                self.account = p.value(forKey:"account") as AnyObject!
                self.age = p.value(forKey: "finishtime")as AnyObject!
                self.finishtime = p.value(forKey: "name")as AnyObject!
                self.starttime = p.value(forKey: "starttime")as AnyObject!
                self.ageAry.append(self.age)
                self.accountAry.append(self.account)
                self.starttimeAry.append(self.starttime)
                self.finishtimeAry.append(self.finishtime)
              
            }
              print("----------------------------------------------------", self.accountAry.count)
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
