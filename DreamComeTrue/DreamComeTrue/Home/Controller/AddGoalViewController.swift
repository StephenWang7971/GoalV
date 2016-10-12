//
//  AddGoalViewController.swift
//  DreamComeTrue
//
//  Created by Unite-iMac on 16/10/11.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//


import UIKit
import CoreData
import Alamofire

class AddGoalViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //名称
    @IBOutlet weak var txtName: UITextField!

    //开始时间
    @IBOutlet weak var txtStartTime: UITextField!

    //完成时间
    @IBOutlet weak var txtFinishTime: UITextField!

    //金额
    @IBOutlet weak var txtAccount: UITextField!

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
        btnPhoto1.addTarget(self, action: #selector(btnPhoto1_OnClick(_:)), for:.touchUpInside)
        btnPhoto2.addTarget(self, action: #selector(btnPhoto2_OnClick(_:)), for:.touchUpInside)
        btnPhoto3.addTarget(self, action: #selector(btnPhoto3_OnClick(_:)), for:.touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //添加按钮的事件
    func StartCreateGoal(_ button:UIButton) {

        //使用coredata来创建数据，进行保存
        storePerson(name: txtName.text!, starttime: txtStartTime.text!, finishtime: txtFinishTime.text!, account: txtAccount.text!)
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
        goal.setValue(finishtime, forKey: "finishtime")
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
    //上传第一张照片的点击事件
    func btnPhoto1_OnClick(_ button:UIButton){
        popupView()
    }
    func btnPhoto2_OnClick(_ button:UIButton){
        popupView()
    }
    func btnPhoto3_OnClick(_ button:UIButton){
        popupView()
    }
    //底部弹窗
    func popupView(){
        var alert: UIAlertController!
        alert = UIAlertController(title: "提示", message: "添加照片", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cleanAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel,handler:nil)
        let photoAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.default){ (action:UIAlertAction)in
            self.camera()
        }
        let choseAction = UIAlertAction(title: "从手机相册选择", style: UIAlertActionStyle.default){ (action:UIAlertAction)in
            self.photo()
        }

        alert.addAction(cleanAction)
        alert.addAction(photoAction)
        alert.addAction(choseAction)
        self.present(alert, animated: true, completion: nil)
    }
    //调用照相机方法
    func camera(){
        let pick:UIImagePickerController = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = UIImagePickerControllerSourceType.camera
        self.present(pick, animated: true, completion: nil)
    }
    //调用相册方法

    func photo(){
//        let pick:UIImagePickerController = UIImagePickerController()
//        pick.delegate = self
//        pick.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        self.present(pick, animated: true, completion: nil)
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    //选择图片成功后代理
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //获取选择的原图
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage

        //将选择的图片保存到Document目录下
        let fileManager = FileManager.default
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                           .userDomainMask, true)[0] as String
        let filePath = "\(rootPath)/pickedimage.jpg"
        let imageData = UIImageJPEGRepresentation(pickedImage, 1.0)
        fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)

        //上传图片
        if (fileManager.fileExists(atPath: filePath)){
            //取得NSURL
            let imageNSURL:NSURL = NSURL.init(fileURLWithPath: filePath)

            //使用Alamofire上传
//            Alamofire.upload(.POST, "http://www.hangge.com/upload.php", file: imageNSURL)
//                .responseString { response in
//                    print("Success: \(response.result.isSuccess)")
//                    print("Response String: \(response.result.value)")
//            }
//            Alamofire.upload(imageNSURL, to: "", method: .post, headers: nil).responseString { response in
//                                    print("Success: \(response.result.isSuccess)")
//                                    print("Response String: \(response.result.value)")
//                            }
//
        }

        //图片控制器退出
        picker.dismiss(animated: true, completion:nil)
    }

}
