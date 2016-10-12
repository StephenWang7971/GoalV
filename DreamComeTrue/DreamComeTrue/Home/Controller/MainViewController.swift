//
//  MainViewController.swift
//  DreamComeTrue
//
//  Created by Unite-iMac on 16/10/10.
//  Copyright © 2016年 One Hydrogen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIScrollViewDelegate {

    //目标个数
    @IBOutlet weak var lblGoalNum: UILabel!

    //当前目标数
    @IBOutlet weak var lblCurrentGoalNum: UILabel!

    //总金额
    @IBOutlet weak var lblTotalAmount: UILabel!

    //共实现目标数
    @IBOutlet weak var lblTotalGoalNum: UILabel!

    //总计金额
    @IBOutlet weak var lblAmount: UILabel!

    //滚动视图
    @IBOutlet weak var scrollview: UIScrollView!

    //目标view
    @IBOutlet weak var goalView: UIView!

    //添加一个目标按钮
    @IBOutlet weak var btnAddGoal: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //判断一下目标的个数是否为零
        //如果为零，显示添加新目标
        btnAddGoal.addTarget(self, action:#selector(AddGoal_OnClick(_:)), for:.touchUpInside)
        //如果不为零，显示目标一
        createScrollerView()
        setupRightBarButtonItem()

    }
    
    func setupRightBarButtonItem()
    {
            let rightBtn: UIButton = UIButton(type: .custom)
            rightBtn.frame = CGRect(x: 0,y: 0,width: 40,height:25)
            rightBtn.setTitle("目标", for: UIControlState())
            rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            rightBtn.setTitleColor(UIColor.white, for: UIControlState())
            rightBtn.layer.borderColor = UIColor.white.cgColor
            rightBtn.layer.borderWidth = 1
            rightBtn.layer.cornerRadius = 3
            rightBtn.addTarget(self, action: #selector(CheckGoal(_:)) ,for:.touchUpInside)

            let barButtonItem = UIBarButtonItem(customView:rightBtn)
            self.navigationItem.rightBarButtonItem = barButtonItem
    }
    func CheckGoal(_ button:UIButton)
    {
        self.navigationController?.pushViewController(CheckViewController(), animated:true)
    }
    func AddGoal_OnClick(_ button:UIButton){
        //跳转到添加页面
        let vc = AddGoalViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //视图滚动中一直触发
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }

    //创建滚动视图
    func createScrollerView(){
        //创建滚动视图
        let numOfPages = 3
        let pageWidth = 375
        //scrollView的初始化
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x:0,y:180,width:375,height:450)
        //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize=CGSize(width:pageWidth*numOfPages,height:0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false

        //添加第二个视图目标
        let goalview2 = UIView()
        goalview2.frame = CGRect(x:450,y:60,width:271,height:380)

        //背景图
        let imageview = UIImageView()
        imageview.frame = CGRect(x:0,y:0,width:271,height:380)
        imageview.image = UIImage(named:"center")!
        goalview2.addSubview(imageview)


        scrollView.addSubview(goalview2)
        //添加第三个视图目标
        let goalview3 = UIView()
        goalview3.frame = CGRect(x:450+375,y:60,width:271,height:380)
        goalview3.backgroundColor = UIColor(patternImage: UIImage(named:"center")!)
        scrollView.addSubview(goalview3)
        //添加子页面
        for i in 0..<numOfPages{
            if(i == 0){
                scrollView.addSubview(goalView)
            }
            if(i == 1){
                scrollView.addSubview(goalview2)
            }
            print("%d",i)

        }
        self.view.addSubview(scrollView)
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
