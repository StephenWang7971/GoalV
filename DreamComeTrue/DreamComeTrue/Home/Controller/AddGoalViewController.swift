//
//  AddGoalViewController.swift
//  DreamComeTrue
//
//  Created by Unite-iMac on 16/10/11.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//


import Foundation
import CoreData
extension Goal {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal");
    }
    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var headImg: NSData?
    @NSManaged public var isLeave: Bool
    @NSManaged public var name: String?
    @NSManaged public var tel: String?
    @NSManaged public var birthDay: String?
}
import UIKit
class AddGoalViewController: UIViewController {
    //名称
    @IBOutlet weak var lblName: UILabel!

    //开始时间
    @IBOutlet weak var lblStartTime: UILabel!

    //完成时间
    @IBOutlet weak var lblFinishTime: UILabel!

    //金额
    @IBOutlet weak var lblAcount: UILabel!

    //照片1
    @IBOutlet weak var btnPhoto1: UIButton!

    //照片2
    @IBOutlet weak var btnPhoto2: UIButton!

    //照片3
    @IBOutlet weak var btnPhoto3: UIButton!

    //开始创建
    @IBOutlet weak var btnCreateGoal: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "创建目标"
        //添加一个事件
        btnCreateGoal.addTarget(self, action: #selector(StartCreateGoal(_:)) ,for:.touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //添加按钮的事件
    func StartCreateGoal(_ button:UIButton) {

        //使用coredata来创建数据，进行保存
      
        storePerson(name: "sfsdfaaa", starttime: "sfsdfbbb", finishtime: "sfsdfccc", account: "sfsdfddd")
        getPerson()
    }

    //获取Context，为了方便使用，这里封装成一个函数
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    //存储数据
    func storePerson(name:String, starttime:String,finishtime:String,account:String){
        let context = getContext()
        // 定义一个entity，这个entity一定要在xcdatamodeld中做好定义
        let entity = NSEntityDescription.entity(forEntityName: "Goal", in: context)

        let goal = NSManagedObject(entity: entity!, insertInto: context)

        goal.setValue(name, forKey: "name")
        goal.setValue(starttime, forKey: "starttime")
        goal.setValue(finishtime, forKey: "finish")
        goal.setValue(account, forKey: "account")

        do {
            try context.save()
            print("saved")
        }catch{
            print(error)
        }
    }
    // 获取某一entity的所有数据
    func getPerson(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            print("numbers of \(searchResults.count)")

            for p in (searchResults as! [NSManagedObject]){
                print("name:  \(p.value(forKey: "name")!) starttime: \(p.value(forKey: "starttime")!)")
            }
        } catch  {
            print(error)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
