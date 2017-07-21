//
//  stageViewDraw.swift
//  Labyinth
//
//  Created by 陳信毅 on 2017/7/20.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
import UIKit

private let app = UIApplication.shared.delegate as! AppDelegate




func chapter1(view:UIView) {
    // 背景
    UIGraphicsBeginImageContext(view.frame.size)
    UIImage(named: "Background")?.draw(in: view.bounds)
    
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext()
    
    view.backgroundColor = UIColor(patternImage: image)
    
    // 關卡
    app.stages.append(Stage(name: "stage1_1",
                        frame: CGRect(x: view.frame.width*4.8/6.8,
                                      y: view.frame.height*10/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
    app.stages.append(Stage(name: "stage1_2",
                        frame: CGRect(x: view.frame.width*3.7/6.8,
                                      y: view.frame.height*7.8/12.1,
                                      width: view.frame.width*64/375,
                                      height: view.frame.width*64/375)))
//    app.stages.append(Stage(name: "stage1_3",
//                        frame: CGRect(x: view.frame.width*5.5/6.8,
//                                      y: view.frame.height*5.2/12.1,
//                                      width: view.frame.width*64/375,
//                                      height: view.frame.width*64/375)))
//    app.stages.append(Stage(name: "stage1_4",
//                        frame: CGRect(x: view.frame.width*3.5/6.8,
//                                      y: view.frame.height*3.2/12.1,
//                                      width: view.frame.width*64/375,
//                                      height: view.frame.width*64/375)))
//    app.stages.append(Stage(name: "stage1_5",
//                        frame: CGRect(x: view.frame.width*4.5/6.8,
//                                      y: view.frame.height*1/12.1,
//                                      width: view.frame.width*64/375,
//                                      height: view.frame.width*64/375)))
    // app.ball
    app.ball = Ball(image: UIImage(named: "monkey")!)
    app.ball.frame.size = CGSize(width: view.frame.width*64/375, height: view.frame.width*64/375)
    app.ball.center.x = view.frame.width * 2.5/12.1
    app.ball.center.y = view.frame.width * 2.5/6.8
}


func stage1_1(view:UIView){
    view.backgroundColor = UIColor.white
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*32/375, height: view.frame.width*32/375)
    // app.ball的位置
    app.ball.center.x = view.frame.width * 4/5
    app.ball.center.y = view.frame.height * 1/7
    
    app.ball.start = app.ball.center
    
    // 牆
    app.walls.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*2.2/10, width: view.frame.width * 5.2/7, height: view.frame.height * 0.5/10))
    app.walls.append(CGRect(x: 0, y: view.frame.height*4.5/10, width: view.frame.width * 3.6/7, height: view.frame.height * 0.5/10))
    app.walls.append(CGRect(x: view.frame.width*5/7, y: view.frame.height*4.5/10, width: view.frame.width * 2/7, height: view.frame.height * 0.5/10))
    app.walls.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*6.9/10, width: view.frame.width * 5.2/7, height: view.frame.height * 0.5/10))
    
    // 洞
    let holeside = view.frame.width*32/375
    app.holes.append(CGRect(x: view.frame.width*1/7, y: view.frame.height*0.8/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*1/7, y: view.frame.height*3.7/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.5/7, y: view.frame.height*3/10, width:holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4/7, y: view.frame.height*5.7/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*2/7, y: view.frame.height*8.5/10, width: holeside, height: holeside))
    
    // 目標
    app.goals.append(CGRect(x: view.frame.width*5/7, y: view.frame.height*8.2/10, width: holeside, height: holeside))
}

func stage1_2(view:UIView){
    view.backgroundColor = UIColor.white
    app.ball = nil
    app.ball = Ball(image: UIImage(named: "ball")!)
    app.ball.frame.size = CGSize(width: view.frame.width*32/375, height: view.frame.width*32/375)
    // app.ball的位置
    app.ball.center.x = view.frame.width * 0.8/6.8
    app.ball.center.y = view.frame.height * 0.8/12.1
    
    app.ball.start = app.ball.center
    
    app.walls.append(CGRect(x: view.frame.width*0/7, y: view.frame.height*0/10, width: view.frame.width * 7/7, height: view.frame.height * 0.4/10))
    app.walls.append(CGRect(x: view.frame.width*0/7, y: view.frame.height*9.6/10, width: view.frame.width * 7/7, height: view.frame.height * 0.4/10))
    app.walls.append(CGRect(x: view.frame.width*0/7, y: view.frame.height*0/10, width: view.frame.width * 0.4/7, height: view.frame.height * 10/10))
    app.walls.append(CGRect(x: view.frame.width*6.6/7, y: view.frame.height*0/10, width: view.frame.width * 0.4/7, height: view.frame.height * 10/10))
    app.walls.append(CGRect(x: view.frame.width*1.4/7, y: view.frame.height*0/10, width: view.frame.width * 0.35/7, height: view.frame.height * 8.8/10))
    app.walls.append(CGRect(x: view.frame.width*1.4/7, y: view.frame.height*8.45/10, width: view.frame.width * 4.3/7, height: view.frame.height * 0.35/10))
    app.walls.append(CGRect(x: view.frame.width*2.8/7, y: view.frame.height*1.2/10, width: view.frame.width * 2.9/7, height: view.frame.height * 0.35/10))
    app.walls.append(CGRect(x: view.frame.width*5.35/7, y: view.frame.height*1.2/10, width: view.frame.width * 0.35/7, height: view.frame.height * 7.6/10))
    app.walls.append(CGRect(x: view.frame.width*2.8/7, y: view.frame.height*1.2/10, width: view.frame.width * 0.34/7, height: view.frame.height * 6.2/10))
    app.walls.append(CGRect(x: view.frame.width*2.8/7, y: view.frame.height*7.05/10, width: view.frame.width * 1.6/7, height: view.frame.height * 0.35/10))
    app.walls.append(CGRect(x: view.frame.width*4.1/7, y: view.frame.height*2.6/10, width: view.frame.width * 0.35/7, height: view.frame.height * 4.8/10))
    
    let holeside = view.frame.width*32/375
    app.holes.append(CGRect(x: view.frame.width*0.5/7, y: view.frame.height*9.1/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*6.0/7, y: view.frame.height*9.1/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*6.0/7, y: view.frame.height*0.4/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*0.4/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*1.8/7, y: view.frame.height*7.8/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.7/7, y: view.frame.height*7.8/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*4.7/7, y: view.frame.height*1.6/10, width: holeside, height: holeside))
    app.holes.append(CGRect(x: view.frame.width*3.2/7, y: view.frame.height*1.6/10, width: holeside, height: holeside))
    
    // 目標
    app.goals.append(CGRect(x: view.frame.width*3.3/7, y: view.frame.height*6.4/10, width: holeside, height: holeside))
}




