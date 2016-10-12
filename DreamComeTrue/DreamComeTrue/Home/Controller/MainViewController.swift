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
    let goalview3 = UIView()
    let HEIGHT = UIScreen.main.bounds.size.height
    let WIDTH = UIScreen.main.bounds.size.width


    override func viewDidLoad() {
        super.viewDidLoad()
        //判断一下目标的个数是否为零
        //如果为零，显示添加新目标
        btnAddGoal.addTarget(self, action:#selector(AddGoal_OnClick(_:)), for:.touchUpInside)
        //如果不为零，显示目标一
        createScrollerView()


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
        let pageWidth = WIDTH
        //scrollView的初始化
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x:0,y:HEIGHT/4,width:WIDTH,height:HEIGHT/3*2)
        //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize=CGSize(width:Double(pageWidth)*Double(numOfPages),height:0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false

        //添加第二个视图目标
//        let goalview2 = UIView()
//        //goalview2.frame = CGRect(x:450,y:60,width:271,height:380)
//
//        //背景图
//        let imageview = UIImageView()
//        imageview.frame = CGRect(x:0,y:0,width:271,height:380)
//        imageview.image = UIImage(named:"center")!
//        goalview2.addSubview(imageview)

        //scrollView.addSubview(goalview2)

        //添加第三个视图目标
//        let goalview3 = UIView()
//        //goalview3.frame = CGRect(x:450+375,y:60,width:271,height:380)
//        //背景图
//        let imageview3 = UIImageView()
//        imageview3.frame = CGRect(x:0,y:0,width:271,height:380)
//        imageview3.image = UIImage(named:"center")!
//        goalview3.addSubview(imageview3)


        //添加子页面
        for i in 0..<numOfPages{
            if(i == 0){
                scrollView.addSubview(goalView)
            }
            else{
                let j = i - 1
                createGoalView(num: Double(j))
                scrollView.addSubview(goalview3)
            }
        }
        self.view.addSubview(scrollView)
    }

    //创建一个目标view
    func createGoalView(num:Double)  {
        goalview3.frame = CGRect(x: Double(WIDTH) + Double(1*num)+65,y:60,width:271,height:380)
        //背景图
        let imageview = UIImageView()
        imageview.frame = CGRect(x:0,y:0,width:271,height:380)
        imageview.image = UIImage(named:"center")!
        goalview3.addSubview(imageview)

        //设置一些别的输入框和标题
        let lbltitle = UILabel()
        lbltitle.frame = CGRect(x:goalview3.frame.size.width/2-50,y:14,width:100,height:30)
        lbltitle.textAlignment = NSTextAlignment(rawValue: 1)!
        lbltitle.text = "目标一"
        lbltitle.textColor = UIColor.white
        lbltitle.font = UIFont(name:"目标一",size:30)
        goalview3.addSubview(lbltitle)

        let lblname = UILabel()
        lblname.frame = CGRect(x:goalview3.frame.size.width/2-30,y:60,width:150,height:20)
        lblname.text = "美丽计划"
        goalview3.addSubview(lblname)

        let lblstarttime = UILabel()
        lblstarttime.frame = CGRect(x:goalview3.frame.size.width/2-30,y:87,width:150,height:20)
        lblstarttime.text = "2015-10-10"
        goalview3.addSubview(lblstarttime)

        let lblfinishtime = UILabel()
        lblfinishtime.frame = CGRect(x:goalview3.frame.size.width/2-30,y:117,width:150,height:20)
        lblfinishtime.text = "2016-10-10"
        goalview3.addSubview(lblfinishtime)

        let lblaccount = UILabel()
        lblaccount.frame = CGRect(x:goalview3.frame.size.width/2-30,y:145,width:150,height:20)
        lblaccount.text = "100万"
        goalview3.addSubview(lblaccount)

        let image1 = UIImageView()
        image1.frame = CGRect(x:15,y:210,width:goalview3.frame.size.width/3-20,height:40)
        image1.backgroundColor = UIColor.blue
        goalview3.addSubview(image1)

        let image2 = UIImageView()
        image2.frame = CGRect(x:goalview3.frame.size.width/3+10,y:210,width:goalview3.frame.size.width/3-20,height:40)
        image2.backgroundColor = UIColor.blue
        goalview3.addSubview(image2)

        let image3 = UIImageView()
        image3.frame = CGRect(x:goalview3.frame.size.width/3*2+10,y:210,width:goalview3.frame.size.width/3-20,height:40)
        image3.backgroundColor = UIColor.blue
        goalview3.addSubview(image3)

        //drawRect(rect: CGRect(x:10,y:300,width:100,height:100))
    }
    // 弧线
    func drawRect(rect: CGRect) {
        let color = UIColor.red
        color.set() // 设置线条颜色
        let aPath = UIBezierPath(arcCenter: CGPoint(x:150, y:150), radius: 75,
                                 startAngle: 0, endAngle: (CGFloat)(90*M_PI/180), clockwise: true)
        aPath.lineWidth = 5.0 // 线条宽度
        aPath.stroke() // Draws line 根据坐标点连线，不填充
        aPath.fill() // Draws line 根据坐标点连线，填充
    }
}
