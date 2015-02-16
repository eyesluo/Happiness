//
//  HappinessViewController.swift
//  Happiness
//
//  Created by eyesluo on 15-2-16.
//  Copyright (c) 2015年 eyesluo. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController,FaceViewDelegate
{
    var happyValue:Double = 0
        {

            didSet
            {
                
                faceView.setNeedsDisplay()
        }
    }
    
    @IBOutlet weak var faceView: FaceView!
    {
        didSet
        {
            faceView.dataSource = self
        }
        
    }
    


    @IBOutlet weak var transLable: UILabel!
    @IBAction func myPanGesture(sender: UIPanGestureRecognizer) {
        println("\(sender.state)")
        switch sender.state
        {
        case .Ended: fallthrough
        case .Changed:
            var trans = sender.translationInView(faceView)
            var change = -(trans.y)
            change = change / 4
            happyValue = happyValue + Double(change)
            
            if happyValue > 50
            {
                happyValue = 50
            }
            else if happyValue < -50
            {
                happyValue = -50
            }
            
            sender.setTranslation(CGPointZero, inView: faceView)
            
        default:break
            
        }
    }
    
    func getFaceData() -> Double? {
        return happyValue/50
    }
}
