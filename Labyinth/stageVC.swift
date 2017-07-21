//
//  stageVC.swift
//  Labyinth
//
//  Created by 陳信毅 on 2017/7/20.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit
import CoreMotion

class stageVC: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var animator: UIDynamicAnimator?
    let mm = CMMotionManager()

    // 隱藏最上方的狀態列
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 將螢幕關閉功能取消
        UIApplication.shared.isIdleTimerDisabled = true
        
        // 啟動加速器取得加速值
        mm.startAccelerometerUpdates(to: OperationQueue(), withHandler: { (data,error)  in
            if let tmp = data?.acceleration {
                self.app.accelerometerX =   tmp.x
                self.app.accelerometerY =  -tmp.y
            }
        })
        
        //動態行為建構
        animator = UIDynamicAnimator(referenceView: view)
        // 重力
        app.gravity = UIGravityBehavior()
        animator?.addBehavior(app.gravity!)
        // 碰撞
        app.collision = UICollisionBehavior()
        app.collision!.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(app.collision!)
        
        //切換關卡

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        switchStage(view: view)
        app.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {(timer) in
            self.goal(view: self.view)
            self.holl(view: self.view)
            
        })
    }

    


    //掉進洞的判斷
    func holl(view: UIView) {
        for hole in app.holes {
            if app.ball.center.x >= hole.origin.x &&
                app.ball.center.x <= hole.origin.x + hole.size.width &&
                app.ball.center.y >= hole.origin.y &&
                app.ball.center.y <= hole.origin.y + hole.size.height {
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                app.refreshTimer?.invalidate()
                app.refreshTimer = nil
                app.timer?.invalidate()
                app.timer = nil

                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = hole.origin.x
                    imageView.frame.origin.y = hole.origin.y
                    imageView.alpha = 0
                    imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                })
                app.ball.center = app.ball.start
                app.ball.bounds.size = CGSize(width: view.frame.width*32/375, height: view.frame.width*32/375)
                //Sleep 1 Sec
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {(timer) in
                    view.addSubview(self.app.ball)
                    self.app.gravity!.addItem(self.app.ball)
                    self.app.collision!.addItem(self.app.ball)
                    self.app.refreshTimer = refreshTime(timeInterval: 0.1)
                    self.app.timer = self.appTimer(timeInterval: 0.1)
                })
            }
        }
    }



    
    //掉進目標的判斷
    func goal(view:UIView) {
        for goal in app.goals {
            if app.ball.center.x >= goal.origin.x &&
                app.ball.center.x <= goal.origin.x + goal.size.width &&
                app.ball.center.y >= goal.origin.y &&
                app.ball.center.y <= goal.origin.y + goal.size.height {
                app.gravity!.removeItem(app.ball)
                app.collision!.removeItem(app.ball)
                
                let imageView = UIImageView(frame: (app.ball.frame))
                app.ball.removeFromSuperview()
                
                imageView.image = app.ball.image
                view.addSubview(imageView)
                
                UIView.animate(withDuration: 1, animations: {
                    imageView.frame.origin.x = goal.origin.x
                    imageView.frame.origin.y = goal.origin.y
                    imageView.alpha = 0
                    //imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
                
                app.stageName = ""
                app.gravity = nil
                app.collision = nil

                app.timer?.invalidate()
                app.refreshTimer?.invalidate()
                app.timer = nil
                mm.stopAccelerometerUpdates()

                if let vc = storyboard?.instantiateViewController(withIdentifier: "MainVC"){
                    show(vc, sender: self)
                }
                
            }
        }
    }
    
    func appTimer(timeInterval:Double)->Timer{
        return Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {(timer) in
            self.goal(view: self.view)
            self.holl(view: self.view)
        })
    }

}
