//
//  GoalViewController.swift
//  DreamComeTrue
//
//  Created by 水蒸气很快乐 on 16/10/12.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        CreateUIBezierPath()
    }
    func CreateUIBezierPath()
    {
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: 0))
        myBezier.addLine(to: CGPoint(x: 100, y: 0))
        myBezier.addLine(to: CGPoint(x: 50, y: 100))
        myBezier.close()
        let color = UIColor.red   //returns color
        color.setStroke()

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
