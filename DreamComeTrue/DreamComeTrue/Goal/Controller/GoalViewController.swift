//
//  GoalViewController.swift
//  DreamComeTrue
//
//  Created by 水蒸气很快乐 on 16/10/11.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController
{
    
    //var  mainScrollView : UIScrollView?

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupRightBarButtonItem()
       
    }
    //创建导航栏右侧按钮
     func setupRightBarButtonItem()
     {
        let rightBtn: UIButton = UIButton(type: .custom)
        rightBtn.frame = CGRect(x: 0,y: 0,width: 40,height:25)
        rightBtn.setTitle("编辑", for: UIControlState())
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        rightBtn.setTitleColor(UIColor.white, for: UIControlState())
        rightBtn.layer.borderColor = UIColor.white.cgColor
        rightBtn.layer.borderWidth = 1
        rightBtn.layer.cornerRadius = 3
        let barButtonItem = UIBarButtonItem(customView:rightBtn)
        self.navigationItem.rightBarButtonItem = barButtonItem

     }
    //创建目标按钮
     func setupGoalButton()
     {
        let FGBtn:UIButton = UIButton(type: .custom)
        FGBtn.frame = CGRect(x: 0,y: 0,width:kMAIN_SIZE.width/4,height:kMAIN_SIZE.height/20)
        FGBtn.setTitle("上一目标", for: UIControlState())
        FGBtn.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        FGBtn.setTitleColor(UIColor.white, for: UIControlState())
        FGBtn.backgroundColor = UIColor.red
        FGBtn.layer.borderWidth = 0.5
        FGBtn.layer.cornerRadius = 2
        let SGBtn:UIButton = UIButton(type: .custom)
        SGBtn.frame = CGRect(x: 0,y: 0,width: 40,height:25)
        SGBtn.setTitle("目标一", for: UIControlState())
        SGBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        SGBtn.setTitleColor(UIColor.white, for: UIControlState())
        SGBtn.layer.borderColor = UIColor.white.cgColor
        SGBtn.layer.borderWidth = 1
        SGBtn.layer.cornerRadius = 3
        let TGBtn:UIButton = UIButton(type: .custom)
        TGBtn.frame = CGRect(x: 0,y: 0,width: 40,height:25)
        TGBtn.setTitle("下一目标", for: UIControlState())
        TGBtn.titleLabel?.font = UIFont.systemFont(ofSize:9)
        TGBtn.setTitleColor(UIColor.white, for: UIControlState())
        TGBtn.layer.borderColor = UIColor.white.cgColor
        TGBtn.layer.borderWidth = 1
        TGBtn.layer.cornerRadius = 3
        self.view.addSubview(FGBtn)
        
    }
    //创建全局滚动视图
    func setupMainScrollView()
    {
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
