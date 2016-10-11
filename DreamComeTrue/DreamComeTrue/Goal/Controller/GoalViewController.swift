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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupRightBarButtonItem()
    }
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
