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
        //添加目标
        btnAddGoal.addTarget(self, action:#selector(AddGoal_OnClick(_:)), for:.touchUpInside)

//        let imageView=UIImageView(image:UIImage(named:"creat_background"))
//        
//        scrollview.delegate = self
//        scrollview.addSubview(imageView);
//        self.view.addSubview(scrollview)
        //判断一下目标的个数是否为零
        //如果为零，显示添加新目标

        //如果不为零，显示目标一


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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
