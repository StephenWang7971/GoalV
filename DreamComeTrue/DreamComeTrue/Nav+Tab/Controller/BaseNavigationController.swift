
//
//  BaseNavigationController.swift
//  PersonalDrame
//
//  Created by 水蒸气很快乐 on 16/10/9.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController
{

    override class func initialize()
    {
        super.initialize()
        let navBar = UINavigationBar.appearance()
        //navBar.barTintColor = UIColor.white
        navBar.barTintColor = UIColor(red: 218/255.0, green: 0/255.0, blue: 5/255.0, alpha: 1)
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17)]
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            //viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_28x28_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    func navigationBack() {
        popViewController(animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
