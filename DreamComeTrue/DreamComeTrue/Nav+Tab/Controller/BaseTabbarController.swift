//
//  BaseTabbarController.swift
//  PersonalDrame
//
//  Created by 水蒸气很快乐 on 16/10/9.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        
       
    }
    override class func initialize() {
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor.red
    }
    fileprivate func addChildViewControllers()
    {
        addChildViewController(MainViewController(), title: "主页" )
        addChildViewController(GoalViewController(), title: "目标")
        addChildViewController(FindViewController(), title: "发现")
        addChildViewController(MyViewController(), title: "我的")
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func addChildViewController(_ childController: UIViewController, title: String) {
            //childController.tabBarItem.image = UIImage(named: imageName)
            //childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
            childController.title = title
            let nav = BaseNavigationController(rootViewController: childController)
            addChildViewController(nav)
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
